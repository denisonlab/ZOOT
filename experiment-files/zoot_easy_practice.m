function [data] = zoot_easy_practice(subjectID)
% tazoott
%
% jenny motzer
% december 2023

%% PTB setup

% Check we are running PTB-3
AssertOpenGL;

% Skip screen tests - ONLY for demo, not for real experiments
Screen('Preference', 'SkipSyncTests', 1); % set to 0 for real experiment


%% Input

%% Basic info
% Name the subject
if nargin==0
    error('Missing subject ID - call function with ID')
end 

directory = pwd; %get project directory path
addpath(genpath(directory))
data.directory=directory;

%get parameters
p=zootparams;

%subject data directory
data.dataDir = sprintf('%s/data', pwd);
if ~exist(data.dataDir, 'dir')
    mkdir(data.dataDir)
end 
data.subDir =  sprintf('%s/%s', data.dataDir, subjectID);
if ~exist(data.subDir, 'dir')
    mkdir(data.subDir)
end

% Set tilt or get from thresholding procedure
p.tilt = p.practiceThreshold;

PsychDefaultSetup(2); %psychtoolbox settings


%% %%%% Setup: window, sound, and keyboard %%%%
%% Window
% Here we open a PTB window and see how to get several properties of the
% window.

%% Setting up the window ...
% Pick the screen on which to display the window
screenNumber = max(Screen('Screens'));

% Check screen resolution
screenRes = Screen('Resolution',screenNumber);

% Get the color code for white
white = WhiteIndex(screenNumber);
grey=p.backgroundColor;

% Open a PTB window
if p.windowTesting==0
    [window, rect] = PsychImaging('OpenWindow', screenNumber, grey); % defaults to full screen
elseif p.windowTesting==1
    [window, rect] = PsychImaging('OpenWindow', screenNumber, grey, [0 0 600 400]);
end 

%% Getting many useful properties of the window ...
% Get x and y coordinates for the center of the window
[cx, cy] = RectCenter(rect);

% Get window size
[screenWidthPx, screenHeightPx] = Screen('WindowSize', window);

% Get refresh rate
flipInterval = Screen('GetFlipInterval', window); % frame duration (s)

% We will request the screen to flip half a refresh (the "slack" time) before we
% actually want the screen to change. This helps to avoid late screen
% flips. So let's define this "slack" variable for convenience.
slack = flipInterval/2;

Screen('TextFont', window, p.font); %setup text type
Screen('TextSize', window, p.fontSize);

DrawFormattedText(window, 'Setting up...', 'centerblock', 'center', 1);
Screen('Flip', window);

%% Sound
% Initialize the sound driver
InitializePsychSound(1); % 1 for precise timing

PsychPortAudio('Close');

% Open audio device for low-latency output
reqlatencyclass = 2; % Level 2 means: Take full control over the audio device, even if this causes other sound applications to fail or shutdown.
pahandle = PsychPortAudio('Open', [], [], reqlatencyclass, p.Fs, 1); % 1 = single-channel

%% Keyboard
% Check all "devices" (keyboards, mice) for response input
devNum = -1;

%% %%%% Make stimuli %%%%
%% Making images ...

%% Calculate stimulus dimensions (px) and position
pixelsPerDegree = ang2pix(1, p.screenSize(1), p.screenRes(1), p.viewDist, 'central');

fixSize = p.fixSize*pixelsPerDegree;

%% Making sounds ...
% 10^0.5 for every 10dB
%% Make a pure tone for each cue frequency
cueTones = [];
for iF = 1:numel(p.toneFreqs)
    tone0 = MakeBeep(p.toneFreqs(iF), p.toneDur, p.Fs);

    % Apply an envelope so the sound doesn't click at the beginning and end
    tone = applyEnvelope(tone0, p.Fs);

    cueTones(iF,:) = tone;
end
cueTones(iF+1,:) = mean(cueTones,1); % neutral precue, both tones together

% % View tone
% t = 1/p.Fs:1/p.Fs:p.toneDur;
% figure
% plot(t, tone)
% xlabel('Time (s)')
% ylabel('Amplitude')

% % Listen to tone
% sound(tone, p.Fs)

%% %%%% Generate trials in different conditions %%%%
% "precueValidity" = valid/neutral/invalid
% "target" = the stimulus that is postcued, which the subject responds to
% "axis" = V/H
% "tilt" = CW/CCW
% "response" = response category, e.g. CW/CCW
trialsHeaders = {'precueAllNeutral','target','T1Axis','T2Axis'...
    'T1Tilt','T2Tilt', 'precue','targetTilt', 'T1OriDeg','T2OriDeg',...
    'responseKey','response','accuracy','rt'};

% make sure column indices match trials headers, returns a logical array 
% this is used to get the index of each variable in the trials matrix
for iF=1:numel(trialsHeaders)
    field=trialsHeaders{iF};
    idx.(field)=strcmp(trialsHeaders,field);
end

% full factorial design - creates matrix of trial conditions for full sesh
trials = fullfact([numel(p.precueAllNeutral) ...
    numel(p.targets) ...
    numel(p.axes) ...
    numel(p.axes) ...
    numel(p.tilts) ...
    numel(p.tilts)]);
%% Set order of trial presentation
nTrials = 32; % for debugging
% nTrials = length(trials); %for experiment
trialOrder=randperm(nTrials);
block = 1;

%% Make a gabor image
% First make a grating image
edgeWidth=round(p.apertureEdgeWidth*pixelsPerDegree);
gratingRadius = round(p.gratingDiameter/2*pixelsPerDegree);

gabors_t1=nan(1,nTrials);
gabors_t2=nan(1,nTrials);

phases=linspace(0,2*pi,nTrials);
phases_t1=phases(randperm(length(phases))); 
phases_t2=phases(randperm(length(phases)));

for i=1:nTrials
    t1_grating = rd_grating(pixelsPerDegree, p.imSize, p.gratingSF, 0, phases_t1(i), 1); %creates grating 
    % Place an Gaussian aperture on the image to turn it into a Gabor
    im_t1= rd_aperture(t1_grating, p.aperture, gratingRadius, edgeWidth, p.angularFreq); %matrix for gaussian
    tex_t1=Screen('MakeTexture', window, im_t1); %for psychtoolbox, need matrix to become a texture 
    gabors_t1(i)=tex_t1;

    t2_grating = rd_grating(pixelsPerDegree, p.imSize, p.gratingSF, 0, phases_t2(i), 1);
    % Place an Gaussian aperture on the image to turn it into a Gabor
     im_t2= rd_aperture(t2_grating, p.aperture, gratingRadius, edgeWidth, p.angularFreq);
    tex_t2=Screen('MakeTexture', window, im_t2);
    gabors_t2(i)=tex_t2;
end

% % View the gabor
% figure
% imshow(gabor)

%% Make the rects for placing the images in the window
grating=rd_grating(pixelsPerDegree, p.imSize, p.gratingSF, 0, 0, 1);
imSize = size(grating);
imRect = CenterRectOnPoint([0 0 imSize(1) imSize(2)], cx+p.imPos(1), cy+p.imPos(2));

%% %%%% Eyetracker %%%%

   %% Show instruction screen and wait for a button press
Screen('FillRect', window, white*p.backgroundColor);
DrawFormattedText(window, 'Press any key to begin', 'center', 'center', [1 1 1]*white);
Screen('Flip', window);
KbWait(devNum);
timeStart = GetSecs;
%% %%%% Present trials %%%%

for iTrial = 1:nTrials % the iteration in the trial loop
    trialIdx = trialOrder(iTrial); % the current trial number in the trials matrix

    %% %%%% Present trials %%%
    % Get condition information for this trial
    precueAllNeutral = p.precueValidities(trials(trialIdx, idx.precueAllNeutral)); %saves each column in trials matrix as corresponding variable e.g. column 1 = precue validity 
    target = trials(trialIdx, idx.target);
    T1Axis = trials(trialIdx, idx.T1Axis);
    T2Axis = trials(trialIdx, idx.T2Axis);
    T1Tilt = trials(trialIdx, idx.T1Tilt);
    T2Tilt = trials(trialIdx, idx.T2Tilt);
    tilts = p.tilts([T1Tilt T2Tilt]);
    % 
    % % precue
    % precueName = p.precueNames{precueValidity};
    % switch precueName
    %     case 'valid'
    %         precue = target;
    %     case 'neutral'
    %         precue = 3;
    %     case 'invalid'
    %         % precue = nontarget
    %         precue = 3 - target;
    %     otherwise
    %         error('precueName not recognized')
    % end

    % target tilt
    targetTilt = tilts(target);  

    %% Set up stimuli for this trial
    % precue tone
    precueTone = cueTones(3,:);

    % T1 orientation (rotation angle)
    T1Orientation = p.axes(T1Axis) + p.tilt*p.tilts(T1Tilt);
    
    % T2 orientation (rotation angle)
    T2Orientation = p.axes(T2Axis) + p.tilt*p.tilts(T2Tilt);

    % postcue tone
    postcueTone = cueTones(target,:);

    %% Store stimulus information in trials matrix
    % trials(trialIdx, idx.precue) = precue;
    trials(trialIdx, idx.target)=target;
    trials(trialIdx, idx.targetTilt) = targetTilt;
    trials(trialIdx, idx.T1Axis) = T1Axis;
    trials(trialIdx, idx.T2Axis) = T2Axis;
    trials(trialIdx, idx.T1Tilt) = T1Tilt;
    trials(trialIdx, idx.T2Tilt) = T2Tilt;
    trials(trialIdx, idx.T1OriDeg) = T1Orientation;
    trials(trialIdx, idx.T2OriDeg) = T2Orientation;

    %% %%%% Play the trial %%%%
    %% Present fixation
    fixColor = p.fixColor;
    drawFixation(window, cx, cy, fixSize, p.fixColor);
    timeFix = Screen('Flip', window);
    if p.eyeTracking
        Eyelink('Message', 'EVENT_FIX')
    end 

    %% Present precue tone
    PsychPortAudio('FillBuffer', pahandle, precueTone);
    timePrecue = PsychPortAudio('Start', pahandle, [], [], 1); % waitForStart = 1 in order to return a timestamp of playback
    if p.eyeTracking
        Eyelink('Message', 'EVENT_FIX')
    end

    %% Present T1 
    drawFixation(window, cx, cy, fixSize, p.fixColor);
    Screen('DrawTexture', window, gabors_t1(trialIdx), [], imRect, T1Orientation);
    timeT1 = Screen('Flip', window, timePrecue + p.precueSOA - slack);
    PsychPortAudio('FillBuffer', pahandle, p.sound);
    timeT1Click=PsychPortAudio('Start', pahandle, 1, 0, 0);
    if p.eyeTracking
        Eyelink('Message', 'EVENT_FIX')
    end

    % blank
    drawFixation(window, cx, cy, fixSize, fixColor);
    timeBlank1 = Screen('Flip', window, timeT1 + p.practiceImDur - slack);
    if p.eyeTracking
        Eyelink('Message', 'EVENT_FIX')
    end

    %% Present T2 
    drawFixation(window, cx, cy, fixSize, p.fixColor);
    Screen('DrawTexture', window, gabors_t2(trialIdx), [], imRect, T2Orientation);
    timeT2 = Screen('Flip', window, timeT1 + p.practiceSOA - slack);
    PsychPortAudio('FillBuffer', pahandle, p.sound);
    timeT2Click=PsychPortAudio('Start', pahandle, 1, 0, 0);
    if p.eyeTracking
        Eyelink('Message', 'EVENT_FIX')
    end

    % blank
    drawFixation(window, cx, cy, fixSize, p.fixColor);
    timeBlank2 = Screen('Flip', window, timeT2 + p.practiceImDur - slack);
    if p.eyeTracking
        Eyelink('Message', 'EVENT_FIX')
    end

    %% Present postcue
    PsychPortAudio('FillBuffer', pahandle, postcueTone);
    timePostcue = PsychPortAudio('Start', pahandle, [], timeT2 + p.postcueSOA, 1); % waitForStart = 1 in order to return a timestamp of playback

    %% response window 
    drawFixation(window, cx, cy, fixSize, p.fixColor);
    Screen('DrawingFinished', window)
    timeTargetResponseWindow=Screen('Flip', window, timePostcue +p.toneDur -slack);

    [timeTargetResponse, keyCode] = KbWait(devNum);
    timeTargetRT = timeTargetResponse-timeTargetResponseWindow;
    responseKey = find(keyCode);
    responseKeyName=KbName(responseKey);
    response = find(strcmp(p.responseKeys,responseKeyName)); 


    %% feedback

    if response==3 % absent
        responseTilt = 0;
        correct = responseTilt==targetContrast;
    else
        responseTilt = p.tilts(response);
        correct = targetTilt==responseTilt;
    end

    if correct==1
        fixColor=[0 1 0]*255; %green for correct
    elseif correct ==0
        fixColor=[1 0 0]*255; %red for incorrect
    end

    % Screen('Flip', window)
    drawFixation(window, cx,cy, fixSize, fixColor);
    timeFeedbackFix = Screen('Flip', window);

    drawFixation(window, cx,cy, fixSize, p.fixColor);
    timeBlank3 = Screen('Flip', window, timeFeedbackFix+1-slack);
    
    %% ITI
    drawFixation(window, cx,cy, fixSize, p.fixColor);
    timeITIstart = Screen('Flip', window, timeBlank3-slack);
    drawFixation(window, cx,cy, fixSize, p.fixColor);
    timeITIend = Screen('Flip', window, timeITIstart+p.ITI-slack);

    %% Store trial info
    trials(trialIdx, idx.responseKey) = responseKey;
    trials(trialIdx, idx.response) = response;
    trials(trialIdx, idx.accuracy) = correct;
    trials(trialIdx, idx.rt) = timeTargetRT;

    % % DrawFormattedText(window, sprintf('Your reaction time was %.2f s!', rt), 'center', 'center', [1 1 1]*white);\
    Screen('Flip', window);
    % WaitSecs(2);1

timeEnd = GetSecs;
%% Store expt info

timing.timeStart = timeStart;
timing.timeFix(iTrial) = timeFix;
timing.timePrecue{iTrial} = timePrecue;
timing.timeT1(iTrial) = timeT1;
timing.timeT1Click(iTrial) = timeT1Click;
timing.timeBlank1(iTrial) = timeBlank1;
timing.timeT2(iTrial) = timeT2;
timing.timeT2Click(iTrial) = timeT2Click;
timing.timeBlank2(iTrial) = timeBlank2;
timing.timePostcue(iTrial) = timePostcue;
timing.timeTargetResponseWindow(iTrial) = timeTargetResponseWindow;
timing.timeTargetRT(iTrial) = timeTargetRT;
timing.timeFeedbackFix(iTrial) = timeFeedbackFix;
timing.timeBlank3(iTrial) = timeBlank3;
timing.timeITIstart(iTrial) = timeITIstart;
timing.timeITIend(iTrial) = timeITIend;
timing.timeEnd(iTrial) = timeEnd;

% timing.precueSOA(iTrial)=timing.timeT1(iTrial)-timing.timePrecue(iTrial);
% timing.T1Dur(iTrial)=timing.timeBlank1(iTrial)-timing.timeT1(iTrial);
% timing.SOA(iTrial)=timing.timeT2(iTrial)-timing.timeT1(iTrial);
% timing.T2Dur(iTrial)=timing.timeBlank2(iTrial)-timing.timeT2(iTrial);
% timing.postcueSOA(iTrial)=timing.timePostcue(iTrial)-timing.timeT2(iTrial);
% timing.feedbackSOA(iTrial)=timing.timeFeedbackFix(iTrial)-timing.timePostcue(iTrial);
% timing.feedbackDur(iTrial)=timing.timeBlank3(iTrial)-timing.timeFeedbackFix(iTrial);
% timing.itiDur(iTrial) = timing.timeITIend(iTrial) - timing.timeITIstart(iTrial)
end

data.subjectID = subjectID;
data.p = p;
data.trialsHeaders = trialsHeaders;
data.trials = trials;
data.trialOrder=trialOrder;
dateStr = datetime('now', 'TimeZone', 'local', 'Format', 'yyMMdd_hhmm');
data.whenSaved = datestr(now);
data.dateTime=dateStr;
data.timings=timing;
%% save beh data
filename=sprintf('%s/%s_mainExpt_%s_block%d.mat', data.subDir, subjectID, dateStr, block);
data.filename = filename;
save(filename,'data')
disp('data saved!')

if p.eyeTracking
    rd_eyeLink('eyestop', window, {eyeFile, eyeDataDir})
    movefile(['eyedata/' subjectID '/' eyeFile '.edf'], ['eyedata/' subjectID, 'eyeFileFull']) % what is this doing
end
%% Completion message
WaitSecs(1);
DrawFormattedText(window, 'All done! Thank you for your effort', 'center', 'center', 1);
Screen('Flip', window);
WaitSecs(3);

%% Clean up
PsychPortAudio('Stop', pahandle);
PsychPortAudio('Close', pahandle);
Screen('CloseAll')