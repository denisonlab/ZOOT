function expt = zoot(subjectID)
% tazoott
%
% jenny motzer
% december 2023

%% PTB setup
% Check we are running PTB-3
AssertOpenGL;

% Skip screen tests - ONLY for demo, not for real experiments
Screen('Preference', 'SkipSyncTests', 1); % set to 0 for real experiment

%% Basic info
% Name the subject
if nargin==0
    error('Missing subject ID - call function with ID')
end 

% Load parameters for this experiment
p = zootparams;

cd(p.dir)

currDir=pwd; %save current directory as variable
addpath data/ toolboxes/eyetrack-tools-master/ functions/

makeDirectories(subjectID, currDir);


% Set tilt or get from thresholding procedure
p.tilt = 2;

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

respLeftCode=KbName(p.respLeft);
respRightCode=KbName(p.respRight);
respAbsent=KbName(p.respAbsent);

%% %%%% Make stimuli %%%%
%% Making images ...

%% Calculate stimulus dimensions (px) and position
pixelsPerDegree = ang2pix(1, p.screenSize(1), p.screenRes(1), p.viewDist, 'central');

fixSize = p.fixSize*pixelsPerDegree;

%% Make a gabor image
% First make a grating image
nTotalTrials=11;
edgeWidth=round(p.apertureEdgeWidth*pixelsPerDegree);
gratingRadius = round(p.gratingDiameter/2*pixelsPerDegree);

phases=linspace(0,2*pi,nTotalTrials);
phases_t1=phases(randperm(length(phases)));
phases_t2=phases(randperm(length(phases)));
p.phases=phases;

for i=1:nTotalTrials
    t1_grating = rd_grating(pixelsPerDegree, p.imSize, p.gratingSF, 0, phases_t1(i), 1);
    % Place an Gaussian aperture on the image to turn it into a Gabor
    im_t1= rd_aperture(t1_grating, p.aperture, gratingRadius, edgeWidth, p.angularFreq);
    tex_t1=Screen('MakeTexture', window, im_t1);
    gabor_t1=tex_t1;

    t2_grating = rd_grating(pixelsPerDegree, p.imSize, p.gratingSF, 0, phases_t2(i), 1);
    % Place an Gaussian aperture on the image to turn it into a Gabor
     im_t2= rd_aperture(t2_grating, p.aperture, gratingRadius, edgeWidth, p.angularFreq);
    tex_t2=Screen('MakeTexture', window, im_t2);
    gabor_t2=tex_t2;
end

% % View the gabor
% figure
% imshow(gabor)

%% Make the rects for placing the images in the window
grating=rd_grating(pixelsPerDegree, p.imSize, p.gratingSF, 0, 0, 1);
imSize = size(grating);
imRect = CenterRectOnPoint([0 0 imSize(1) imSize(2)], cx+p.imPos(1), cy+p.imPos(2));

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
trialsHeaders = {'precueValidity','target','T1Axis','T2Axis'...
    'T1Tilt','T2Tilt', 'T1Contrast', 'T2Contrast','precue','targetTilt','T1OriDeg','T2OriDeg',...
    'responseKey','response','accuracy','rt_t1'};

% make sure column indices match trials headers
precueValidityIdx = strcmp(trialsHeaders,'precueValidity');
targetIdx = strcmp(trialsHeaders,'target');
T1AxisIdx = strcmp(trialsHeaders,'T1Axis');
T2AxisIdx = strcmp(trialsHeaders,'T2Axis');
T1TiltIdx = strcmp(trialsHeaders,'T1Tilt');
T2TiltIdx = strcmp(trialsHeaders,'T2Tilt');
T1ContrastIdx = strcmp(trialsHeaders,'T1Contrast');
T2ContrastIdx = strcmp(trialsHeaders,'T2Contrast');

precueIdx = strcmp(trialsHeaders,'precue');
T1OriIdx = strcmp(trialsHeaders,'T1OriDeg');
T2OriIdx = strcmp(trialsHeaders,'T2OriDeg');
targetTiltIdx = strcmp(trialsHeaders,'targetTilt');

responseKeyIdx = strcmp(trialsHeaders,'responseKey');
responseIdx = strcmp(trialsHeaders,'response');
accuracyIdx = strcmp(trialsHeaders,'accuracy');
rtIdx = strcmp(trialsHeaders,'rt');


% full factorial design
trials = fullfact([numel(p.precueValidities) ...
    numel(p.targets) ...
    numel(p.axes) ...
    numel(p.axes) ...
    numel(p.tilts) ...
    numel(p.tilts) ...
    numel(p.contrasts) ...
    numel(p.contrasts)]);

%% Set order of trial presentation
nTrials = 1;
trialOrder = randperm(nTrials);

%% %%%% Eyetracker %%%%


%% %%%% Present trials %%%%
%% Show instruction screen and wait for a button press
Screen('FillRect', window, white*p.backgroundColor);
DrawFormattedText(window, 'Press any key to begin', 'center', 'center', [1 1 1]*white);
Screen('Flip', window);
 KbWait(devNum);
timeStart = GetSecs;

for iTrial = 1:nTrials % the iteration in the trial loop
    trialIdx = trialOrder(iTrial); % the trial number in the trials matrix

    %% %%%% Present one trial %%%
    %% Get condition information for this trial
    precueValidity = p.precueValidities(trials(trialIdx, precueValidityIdx));
    target = trials(trialIdx, targetIdx);
    T1Axis = trials(trialIdx, T1AxisIdx);
    T2Axis = trials(trialIdx, T2AxisIdx);
    T1Tilt = trials(trialIdx, T1TiltIdx);
    T2Tilt = trials(trialIdx, T2TiltIdx);
    T1Contrast = trials(trialIdx, T1ContrastIdx);
    T2Contrast = trials(trialIdx, T2ContrastIdx);
    tilts = [T1Tilt T2Tilt];

    % precue
    precueName = p.precueNames{precueValidity};
    switch precueName
        case 'valid'
            precue = target;
        case 'neutral'
            precue = 3;
        case 'invalid'
            % precue = nontarget
            precue = 3 - target;
        otherwise
            error('precueName not recognized')
    end

    % target tilt
    targetTilt = tilts(target);

    %% Set up stimuli for this trial
    % precue tone
    precueTone = cueTones(precue,:);

    % T1 orientation (rotation angle)
    T1Orientation = p.axes(T1Axis) + p.tilt*p.tilts(T1Tilt);
    currTilt_stim1 =p.tilt*p.tilts(T1Tilt);
    

    % T2 orientation (rotation angle)
    T2Orientation = p.axes(T2Axis) + p.tilt*p.tilts(T2Tilt);
    currTilt_stim2 =p.tilt*p.tilts(T2Tilt);

    % postcue tone
    postcueTone = cueTones(target,:);

    %% Store stimulus information in trials matrix
  trials(trialIdx, precueIdx) = precue;
    trials(trialIdx, targetTiltIdx) = targetTilt;
    trials(trialIdx, T1AxisIdx) = T1Axis;
    trials(trialIdx, T2AxisIdx) = T2Axis;
    trials(trialIdx, T1TiltIdx) = T1Tilt;
    trials(trialIdx, T2TiltIdx) = T2Tilt;
    trials(trialIdx, T1Contrast)= T1Contrast;
    trials(trialIdx, T2Contrast)= T2Contrast;
    trials(trialIdx, T1OriIdx) = T1Orientation;
    trials(trialIdx, T2OriIdx) = T2Orientation;
    

    %% %%%% Play the trial %%%%
    %% Present fixation

    fixColor = p.fixColor;
    drawFixation(window, cx, cy, fixSize, fixColor);
    timeFix = Screen('Flip', window);

    %% Present precue tone
    PsychPortAudio('FillBuffer', pahandle, precueTone);
    timePrecue = PsychPortAudio('Start', pahandle, [], [], 1); % waitForStart = 1 in order to return a timestamp of playback

    %% Present T1 
    drawFixation(window, cx, cy, fixSize, fixColor);
    Screen('DrawTexture', window, gabor_t1, [], imRect, T1Orientation);
    timeT1 = Screen('Flip', window, timePrecue + p.precueSOA - slack);
    % PsychPortAudio('FillBuffer', pahandle, [p.sound; p.sound]);
    % timeT1Click=PsychoPortAudio('Start', pahandle, 1, 0, 0);

    % blank
    drawFixation(window, cx, cy, fixSize, fixColor);
    timeBlank1 = Screen('Flip', window, timeT1 + p.imDur - slack);

    %% Present T2 
    drawFixation(window, cx, cy, fixSize, fixColor);
    Screen('DrawTexture', window, gabor_t2, [], imRect, T2Orientation);
    timeT2 = Screen('Flip', window, timeT1 + p.targetSOA - slack);
    % PsychPortAudio('FillBuffer', pahandle, p.sound);
    % timeTClick=PsychoPortAudio('Start', pahandle, 1, 0, 0);

    % blank
    drawFixation(window, cx, cy, fixSize, fixColor);
    timeBlank2 = Screen('Flip', window, timeT2 + p.imDur - slack);

    %% Present postcue
    PsychPortAudio('FillBuffer', pahandle, postcueTone);
    timePostcue = PsychPortAudio('Start', pahandle, [], timeT2 + p.postcueSOA, 1); % waitForStart = 1 in order to return a timestamp of playback

    %% response window 

    drawFixation(window, cx, cy, fixSize, fixColor);
    timeTargetResponseGo=Screen('Flip', window, timePostcue-slack);
    Screen('Flip', window);
drawFixation(window, cx, cy, fixSize, fixColor);
    Screen('Flip', window);
    [timeTargetResponse, keyCode] = KbWait(devNum);
    % timeTargetRT = timeTargetResponse-timeTargetResponseGo;
    responseKey = find(keyCode);
    responseKeyName=KbName(responseKey);


    %% feedback 
       if ~p.watch_response %response has happened, so provide feedback
            if p.staircasing==0 && p.stimmapping ==1
                % ContrastT1High = contrasts(i)==1 | contrasts(i)==3
                % ContrastT2High = contrasts(i)==1 | contrasts(i)==4
                % ContrastT1Low = contrasts(i)==2 | contrasts(i)==4
                % ContrastT2Low = contrasts(i)==2 | contrasts(i)==3

                %1 =h/h, 2=l/l, 3=h/l, 
                % 4=l/h
                if currTilt_stim1<0 && responseKey==respLeftCode  %correct CCW
                    correct=1;
                elseif currTilt_stim1>0 && responseKey==respRightCode  %correct CW
                    correct=1;
                elseif currTilt_stim2<0 && responseKey==respLeftCode %correct t2 CCW
                    correct=1;
               elseif currTilt_stim2>0 && responseKey==respRightCode %correct t2 CW
                    correct=1;
                else
                    correct=0;
                end

            elseif p.staircasing==0
                if cues(currTrial,2)==1 %neutral postcue T1
                    if (contrasts(currTrial)==1 || contrasts(currTrial)==3) && currTilt_stim1<0 && data_keyCode==respLeftCode % T1 CCW
                        correct=1;
                    elseif (contrasts(currTrial)==1 || contrasts(currTrial)==3) && currTilt_stim1>0 && data_keyCode==respRightCode %T1 CW
                        correct=1;
                    elseif (contrasts(currTrial)==2 || contrasts(currTrial)==4) && data_keyCode==respAbsent %T1 absent
                        correct=1;
                    else
                        correct=0;
                    end
                elseif cues(currTrial,2)==2 % neutral postcue T2
                    if (contrasts(currTrial)==1 || contrasts(currTrial)==4) && currTilt_stim2<0 && data_keyCode==respLeftCode % T2 CCW
                        correct=1;
                    elseif (contrasts(currTrial)==1 || contrasts(currTrial)==4) && currTilt_stim2>0 && data_keyCode==respRightCode %T2 CW
                        correct=1;
                    elseif (contrasts(currTrial)==2 || contrasts(currTrial)==3) && data_keyCode==respAbsent %T2 absent
                        correct=1;
                    else
                        correct=0;
                    end
                else
                    correct=0;
                end
            end 
            if correct==1
                p.fixColor=[0 1 0]; %green for correct
            elseif correct ==0
                p.fixColor=[1 0 0]; %red for incorrect
            end
       end 
% 
% feedbackLength=p.feedbackLength;
%        for i=1:feedbackLength  
            if correct==1
                fixColor=[0 1 0]; %green for correct
            elseif correct==0
                fixColor=[1 0 0]; %red for incorrect
                %         elseif answered_early==1 && i < p.feedbackLength || (watch_response==1 && i < p.feedbackLength)
                %             fixColor=[0 0 1]; %if they haven't responded, make it blue
                %         else
                %             fixColor=p.dimFixColor; %finally set to dim. will be brighened for next trial
            end


            Screen('Flip', window)
            %draw fix
            drawFixation(window, cx,cy, p.fixSize, fixColor);
            % 
            % %recommended optimization
            % Screen('DrawingFinished',window);

            %flip
            timeFeedback = Screen('Flip', window, timePostcue + p.toneDur - slack);
       % end 

     
    %% Store trial info
    % trials(trialIdx, t1rtIdx) = rt;
    trials(trialIdx, responseKeyIdx) = responseKey;

    % DrawFormattedText(window, sprintf('Your reaction time was %.2f s!', rt), 'center', 'center', [1 1 1]*white);
    Screen('Flip', window);
    WaitSecs(2);
end

%% Store expt info
expt.subjectID = subjectID;
expt.p = p;
expt.trialsHeaders = trialsHeaders;
expt.trials = trials;

%% Clean up
PsychPortAudio('Stop', pahandle);
PsychPortAudio('Close', pahandle);
Screen('CloseAll')