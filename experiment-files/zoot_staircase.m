function [data threshold] = zoot_staircase(s)
% finds tilt threshold

%% PTB setup
% Check we are running PTB-3
AssertOpenGL;

% Skip screen tests - ONLY for demo, not for real experiments
Screen('Preference', 'SkipSyncTests', 1); % set to 0 for real experiment

%% Input
%% Basic info
% Name the subject

%get parameters
p = zootparams;

%change directory
cd(p.dir)

directory = pwd; 
addpath(genpath(directory))
data.directory = directory;

%subject data directory
data.dataDir = sprintf('%s/data', pwd);
if ~exist(data.dataDir, 'dir')
    mkdir(data.dataDir)
end 
data.subDir =  sprintf('%s/%s', data.dataDir, s.subjectID);
if ~exist(data.subDir, 'dir')
    mkdir(data.subDir)
end
data.stairDir =  sprintf('%s/%s', data.subDir, 'staircasing');
if ~exist(data.stairDir, 'dir')
    mkdir(data.stairDir)
end

data.subjectID = s.subjectID;
data.p = p;
% Set tilt or get from thresholding procedure

PsychDefaultSetup(2); %psychtoolbox settings

%% %%%% Setup: window, sound, and keyboard %%%%
%% Window
% Here we open a PTB window and get several properties of the window

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

%% %%%% Generate trials in different conditions %%%%
% "precueValidity" = valid/neutral/invalid
% "target" = the stimulus that is postcued, which the subject responds to
% "axis" = V/H
% "tilt" = CW/CCW
% "response" = response category, e.g. CW/CCW
% trialsHeaders = {'precueValidity','target', 'T1Contrast', 'T2Contrast','T1Axis','T2Axis',...
%     'T1Tilt','T2Tilt','precue','targetTilt', 'targetContrast', 'T1OriDeg','T2OriDeg',...
%     'T1Phase', 'T2Phase', 'responseKey','response','accuracy','rt'};

trialsHeaders = {'precueValidity','target','T1Axis','T2Axis',...
   'T1Tilt','T2Tilt'}; 

% Make a structure called TrialsPresented with all trial headers not in
% fullfact + storing presented stim (do not override trials matrix)

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

%% set staircase conditions

currentStaircase = 1; % start with first staircase

% find index
index_s1 = numel(p.stairs); % start at last step, easiest 
index_s2 = 1; %start at first step, hardest 

% track last few trial accuracy for updateStaircase.m
lastFewAcc_s1 = [];
lastFewAcc_s2 = [];

%track trial counts for each staircase - is this needed?
% nTrials_s1=p.staircaseTrials;
% nTrials_s2=p.staircaseTrials;


%% Make a gabor image
% First make a grating image
edgeWidth=round(p.apertureEdgeWidth*pixelsPerDegree);
gratingRadius = round(p.gratingDiameter/2*pixelsPerDegree);
% gabors_t1=nan(1,nTotalTrials);
% gabors_t2=nan(1,nTotalTrials);

% phase (4) x contrast (1) maybe can come back to speed up image generation
for i=1:numel(p.phases) % we will just make four gratings of different phases, to be used across T1 and T2; nTotalTrials  %  % should this be nTrials or nTotalTrials
    contrast = 1; 
    grating = rd_grating(pixelsPerDegree, p.gratingDiameter, p.gratingSF, 0, p.phases(i), contrast); % creates grating 
    switch p.aperture 
        case 'cosine'
            im = rd_aperture(grating, p.aperture, gratingRadius, edgeWidth, p.angularFreq); % matrix for gaussian
        case 'gaussian'
            im = rd_aperture(grating, p.aperture, p.gratingSD*pixelsPerDegree);
    end
    tex = Screen('MakeTexture', window, im); % for psychtoolbox, need matrix to become a texture
    gabors(i) = tex;
end

%% Make the rects for placing the images in the window
% grating=rd_grating(pixelsPerDegree, p.imSize, p.gratingSF, 0, 0, 1);
imSize = size(grating); % pixels 
imRect = CenterRectOnPoint([0 0 imSize(1) imSize(2)], cx+p.imPos(1), cy+p.imPos(2));

%% %%%% Eyetracker %%%%
if p.eyeTracking
    %Snd('Open', pahandle); %nec for eyetracker
    % Initialize eye tracker
    [el, exitFlag] = rd_eyeLink('eyestart', window, eyeFile);
    if exitFlag
        return
    end

    % Write subject ID into the edf file
    Eyelink('message', 'BEGIN DESCRIPTIONS');
    Eyelink('message', 'Subject code: %s', subjectID);
    Eyelink('message', 'END DESCRIPTIONS');

    % No sounds indicating success of calibration
    el.drift_correction_target_beep = [0 0 0];
    el.drift_correction_failed_beep = [0 0 0];
    el.drift_correction_success_beep = [0 0 0];

    % Accept input from all keyboards
    el.devicenumber = -1; %see KbCheck for details of this value

    % Update with custom settings
    EyelinkUpdateDefaults(el);

    % Calibrate eye tracker
    [~, exitFlag] = rd_eyeLink('calibrate', window, el);
    if exitFlag
        return
    end

    %start eyetracking
    rd_eyeLink('trialstart', window, {el, 1});
    % Start recording
    rd_eyeLink('startrecording',window,{el,fixRect});
end

%% Show instruction screen and wait for a button press
Screen('FillRect', window, white*p.backgroundColor);
DrawFormattedText(window, 'Press any key to begin', 'center', 'center', [1 1 1]*white);
Screen('Flip', window);
KbWait(devNum);
timeStart = GetSecs;

%% %%%% Present trials %%%%
% data.trialOrder = zoot_makeBlocks(p, data);
% trialOrder=randperm(p.nTotalTrials);

trial_structure = repmat(trials,2,1); %double trials for double staircase 
trialOrder = randperm(numel(trial_structure(:,1))); 

for iTrial = 1:numel(trialOrder) % p.nTrialsPerBlock % the iteration in the trial loop
    % trialIdx = trialOrder(block, iTrial); % the current trial number in the trials matrix
    trialIdx = trialOrder(iTrial);
    %% Get condition information for this trial
    precueValidity = p.precueValidities(trial_structure(trialIdx, idx.precueValidity)); % saves each column in trials matrix as corresponding variable e.g. column 1 = precue validity
    target = trial_structure(trialIdx, idx.target);
    T1Axis = trial_structure(trialIdx, idx.T1Axis);
    T2Axis = trial_structure(trialIdx, idx.T2Axis);
    T1Tilt = trial_structure(trialIdx, idx.T1Tilt);
    T2Tilt = trial_structure(trialIdx, idx.T2Tilt);

    tilts = p.tilts([T1Tilt T2Tilt]);

    % Phase: randomly selected per trial
    T1Phase = randperm(numel(p.phases),1);
    T2Phase = randperm(numel(p.phases),1);

    % Precue
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

    % Target tilt
    targetTilt = tilts(target);

    %% Set up stimuli for this trial

    
    % Precue tone
    precueTone = cueTones(3,:); % all neutral precues
    % Postcue tone
    postcueTone = cueTones(target,:);

    if currentStaircase == 1
        % T1 orientation (rotation angle)
        T1Orientation = p.axes(T1Axis) + p.stairs(index_s1)*p.tilts(T1Tilt); % takes the axis (0 for vertical, 90 for horizonta), adds staircase tilt, multiplies by 1 or -1 for CCW/CW
        % T2 orientation (rotation angle)
        T2Orientation = p.axes(T2Axis) + p.stairs(index_s1)*p.tilts(T2Tilt);
    elseif currentStaircase ==2
        T1Orientation = p.axes(T1Axis) + p.stairs(index_s2)*p.tilts(T1Tilt); % takes the axis (0 for vertical, 90 for horizonta), adds staircase tilt, multiplies by 1 or -1 for CCW/CW
        % T2 orientation (rotation angle)
        T2Orientation = p.axes(T2Axis) + p.stairs(index_s2)*p.tilts(T2Tilt);
    end 

    %% Store stimulus information in trials matrix - change so not overwriting trials matrix

    data.precue(iTrial) = precue; % these are indices
    data.target(iTrial) = target;
    data.targetTilt(iTrial) = targetTilt;
    data.T1Axis(iTrial) = T1Axis;
    data.T2Axis(iTrial) = T2Axis;
    data.T1Tilt(iTrial) = T1Tilt;
    data.T2Tilt(iTrial) = T2Tilt;
    data.T1Orientation(iTrial) = T1Orientation;
    data.T2Orientation(iTrial) = T2Orientation;
    data.T1Phase(iTrial) = T1Phase;
    data.T2Phase(iTrial) = T2Phase;

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
    WaitSecs(p.toneDur + 0.01); % added to let PsychPortAudio close
    data.statusPrecue = PsychPortAudio('GetStatus', pahandle); % returns status struct with start time, stop time, etc.
    if p.eyeTracking
        Eyelink('Message', 'EVENT_FIX')
    end

    %% Present T1
    Screen('DrawTexture', window, gabors(T1Phase), [], imRect, T1Orientation);
    drawFixation(window, cx, cy, fixSize, p.fixColor);
    timeT1 = Screen('Flip', window, timePrecue + p.precueSOA - slack);
    PsychPortAudio('FillBuffer', pahandle, p.sound);
    timeT1Click=PsychPortAudio('Start', pahandle, 1, 0, 1);
    data.statusT1Click = PsychPortAudio('GetStatus', pahandle);
    if p.eyeTracking
        Eyelink('Message', 'EVENT_FIX')
    end

    % blank
    drawFixation(window, cx, cy, fixSize, fixColor);
    timeBlank1 = Screen('Flip', window, timeT1 + p.imDur - slack);
    if p.eyeTracking
        Eyelink('Message', 'EVENT_FIX')
    end

    %% Present T2
    Screen('DrawTexture', window, gabors(T2Phase), [], imRect, T2Orientation);
    drawFixation(window, cx, cy, fixSize, p.fixColor);
    timeT2 = Screen('Flip', window, timeT1 + p.targetSOA - slack);
    PsychPortAudio('FillBuffer', pahandle, p.sound);
    timeT2Click=PsychPortAudio('Start', pahandle, 1, 0, 1);
    data.statusT2Click = PsychPortAudio('GetStatus', pahandle);
    if p.eyeTracking
        Eyelink('Message', 'EVENT_FIX')
    end

    % blank
    drawFixation(window, cx, cy, fixSize, p.fixColor);
    timeBlank2 = Screen('Flip', window, timeT2 + p.imDur - slack);
    if p.eyeTracking
        Eyelink('Message', 'EVENT_FIX')
    end

    %% Present postcue
    PsychPortAudio('FillBuffer', pahandle, postcueTone);
    timePostcue = PsychPortAudio('Start', pahandle, [], timeT2 + p.postcueSOA, 1); % timeT2 + p.postcueSOA, waitForStart = 1 in order to return a timestamp of playback

    %% Response window
    drawFixation(window, cx, cy, fixSize, p.fixColor);
    Screen('DrawingFinished', window);
    timeTargetResponseWindow=Screen('Flip', window, timePostcue +p.toneDur -slack);

    data.statusPostcue = PsychPortAudio('GetStatus', pahandle); % moved here to let PsychPortAudio close
    % 
      response = [];
    while isempty(response)
        [timeTargetResponse, keyCode] = KbWait(devNum);
        timeTargetRT = timeTargetResponse-timeTargetResponseWindow;
        responseKey = find(keyCode);
        responseKeyName=KbName(responseKey);
        response = find(strcmp(p.responseKeys,responseKeyName));
    end

    % Feedback
    correct = 0;
    if response==1 || response==2
            responseTilt = p.tilts(response);
            correct = targetTilt==responseTilt;
    end

    if correct==1
        fixColor=[0 1 0]*255; % green for correct
    elseif correct==0
        fixColor=[1 0 0]*255; % red for incorrect
    % else
    %     fixColor=[0 0 1]*255; % blue if timeout (but maybe irrelevant for now) 
    end

    % Screen('Flip', window)
    drawFixation(window, cx,cy, fixSize, fixColor);
    timeFeedbackFix = Screen('Flip', window);

    drawFixation(window, cx,cy, fixSize, p.fixColor);
    timeBlank3 = Screen('Flip', window, timeFeedbackFix+p.feedbackLength-slack); % returns fixation to white

    %% ITI
    drawFixation(window, cx,cy, fixSize, p.fixColor);
    timeITIstart = Screen('Flip', window, timeBlank3-slack);
    drawFixation(window, cx,cy, fixSize, p.fixColor);
    timeITIend = Screen('Flip', window, timeITIstart+p.ITI-slack);


    %% Store data
    data.responseKey(iTrial) = responseKey;
    data.response(iTrial) = response;
    data.correct(iTrial) = correct;
    data.timeTargetRT(iTrial) = timeTargetRT;
    data.session(iTrial) = s.session; 

    % % DrawFormattedText(window, sprintf('Your reaction time was %.2f s!', rt), 'center', 'center', [1 1 1]*white);\

    % WaitSecs(2);1

    %% staircase update and calculations
    if currentStaircase == 1
        [index_s1, lastFewAcc_s1] = updateStaircase(p.stairs, index_s1, lastFewAcc_s1, correct);
        currentStaircase = 2;
    elseif currentStaircase == 2
        [index_s2, lastFewAcc_s2] = updateStaircase(p.stairs, index_s2, lastFewAcc_s2, correct);
        currentStaircase = 1;
   end

    threshold.index_s1(iTrial) = index_s1;
    threshold.index_s2(iTrial) = index_s2;
    threshold.staircase1val(iTrial) = p.stairs(index_s1);
    threshold.staircase2val(iTrial) = p.stairs(index_s2);

    %% Store timing
    timing.timeStart = timeStart;
    timing.timeFix(iTrial) = timeFix;
    timing.timePrecue(iTrial) = timePrecue;
    timing.timePrecueOff(iTrial) = data.statusPrecue.EstimatedStopTime;
    timing.timeT1(iTrial) = timeT1;
    timing.timeT1Click(iTrial) = timeT1Click;
    timing.timeT1ClickOff(iTrial) = data.statusT1Click.EstimatedStopTime;
    timing.timeBlank1(iTrial) = timeBlank1; % fixation draw after T1 dur
    timing.timeT2(iTrial) = timeT2;
    timing.timeT2Click(iTrial) = timeT2Click;
    timing.timeT2ClickOff(iTrial) = data.statusT2Click.EstimatedStopTime;
    timing.timeBlank2(iTrial) = timeBlank2; %fixation draw after T2 dur
    timing.timePostcue(iTrial) = timePostcue;
    timing.timePostcueOff(iTrial) = data.statusPostcue.EstimatedStopTime;
    timing.timeTargetResponseWindow(iTrial) = timeTargetResponseWindow;
    timing.timeTargetRT(iTrial) = timeTargetRT;
    timing.timeFeedbackFix(iTrial) = timeFeedbackFix;
    timing.timeBlank3(iTrial) = timeBlank3; %fixation draw after feedback dur
    timing.timeITIstart(iTrial) = timeITIstart;
    timing.timeITIend(iTrial) = timeITIend;

    timing.precueSOA(iTrial)=timing.timeT1(iTrial)-timing.timePrecue(iTrial);
    timing.precueDur(iTrial)=timing.timePrecueOff(iTrial) - timing.timePrecue(iTrial);
    timing.T1Dur(iTrial)=timing.timeBlank1(iTrial)-timing.timeT1(iTrial);
    timing.T1ClickDur(iTrial) = timing.timeT1ClickOff(iTrial) -timing.timeT1Click(iTrial);
    timing.SOA(iTrial)=timing.timeT2(iTrial)-timing.timeT1(iTrial);
    timing.T2Dur(iTrial)=timing.timeBlank2(iTrial)-timing.timeT2(iTrial);
    timing.T2ClickDur(iTrial) = timing.timeT2ClickOff(iTrial) -timing.timeT2Click(iTrial);
    timing.postcueSOA(iTrial)=timing.timePostcue(iTrial)-timing.timeT2(iTrial); %come back to this one
    timing.postcueDur(iTrial)=timing.timePostcueOff(iTrial) - timing.timePostcue(iTrial);
    timing.feedbackSOA(iTrial)=timing.timeFeedbackFix(iTrial)-timing.timePostcue(iTrial); % time between postcue and fixation
    timing.feedbackDur(iTrial)=timing.timeBlank3(iTrial)-timing.timeFeedbackFix(iTrial);
    timing.itiDur(iTrial) = timing.timeITIend(iTrial) - timing.timeITIstart(iTrial);

    % If last trial in a block, save data... 
    if mod(iTrial, p.staircaseTrials)==0 || iTrial == p.staircaseTrials
        data.trialsHeaders = trialsHeaders;
        data.trials = trials;
        data.trial_structure = trial_structure;
        data.trialOrder=trialOrder;
        dateStr = datetime('now', 'TimeZone', 'local', 'Format', 'yyMMdd_hhmm');
        data.whenSaved = datestr(now);
        data.dateTime=dateStr;
        data.timings=timing;

        filename = sprintf('%s/%s_staircasing_%s.mat',data.stairDir,s.subjectID,dateStr);
        data.filename = filename;
        save(filename,'data')
        disp('data saved!')

        % blockStartTrial = (iTrial/p.nTrialsPerBlock)*p.nTrialsPerBlock - p.nTrialsPerBlock + 1;
        % if blockStartTrial < 0 % we are doing less than one block
        %     blockStartTrial = 1;
        % end
        % % trialsInBlock = trials(blockStartTrial:iTrial,:);
        % blockMessage = sprintf('Great job! You''ve completed %d of %d blocks.', block, ceil(p.nTotalTrials/p.nTrialsPerBlock));
        % if iTrial==p.nTotalTrials
        %     keyMessage = ''; % last block
        % else
        %     keyMessage = 'Press 1 to go on.';
        % end
        % 
        % blockAcc = mean(data.correct(blockStartTrial:iTrial),'omitnan'); % discrimination (only target present)
        % 
        % pointsMessages = sprintf('p(correct) = %0.2f', blockAcc);
        % 
        % breakMessage = sprintf('%s\n\n%s\n\n\n%s', blockMessage, pointsMessages, keyMessage);
        % DrawFormattedText(window, breakMessage, 'center', 'center', [1 1 1]);
        % Screen('Flip', window);
        % WaitSecs(1);
        % if iTrial < p.nTotalTrials
        %     keyPressed = 0;
        %     while ~keyPressed
        %         % if p.useKbQueue
        %         %     [keyIsDown, firstPress] = KbQueueCheck();
        %         %     keyCode = logical(firstPress);
        %         % else
        %             [secs, keyCode] = KbWait(devNum);
        %         % end
        %         if strcmp(KbName(keyCode),'1!')
        %             keyPressed = 1;
        %         end
        %     end
        % end
        % block = block+1; % keep track of block for block message only

        if p.eyeTracking
            rd_eyeLink('eyestop', window, {eyeFile, eyeDataDir})
            movefile(['eyedata/' subjectID '/' eyeFile '.edf'], ['eyedata/' subjectID, 'eyeFileFull']) % what is this doing
        end
    end
end
timeEnd = GetSecs;
timing.timeEnd = timeEnd;

threshold.staircaseavgs = [mean(threshold.staircase1val(end-5:end)) mean(threshold.staircase2val(end-5:end))]; % mean or median?
threshold.threshold = mean(threshold.staircaseavgs);

thresholdFile = sprintf('%s/threshold.mat', data.stairDir);
threshold.thresholdFile = thresholdFile;
save(thresholdFile,'threshold')
disp('threshold saved!')

%% Completion message
WaitSecs(1);
DrawFormattedText(window, 'All done! Thank you for your effort', 'center', 'center', 1);
Screen('Flip', window);
WaitSecs(3);

%% Clean up
PsychPortAudio('Stop', pahandle);
PsychPortAudio('Close', pahandle);
Screen('CloseAll')
