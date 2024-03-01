function p = zootparams(s);

%% main settings

addpath data/ toolboxes/eyetrack-tools-master/ functions/ trial-structs/
p.staircasing = 0;
p.stimmapping = 0;
p.watch_response=0;


%% Screen

switch s.comp
    case 'iMac'
        p.screenSize = 52.7;
        p.screenRes = [2240 1260];
        p.viewDist = 57;
        p.refreshRate = 60;
        p.dir = '/Users/jennymotzer/Documents/GitHub/ZOOT/experiment-files';
        p.retina = 1; disp('Testing mode for macbooks is active!');
        p.useKbQueue = 1;
        p.eyeTracking=0; disp('shutting off eyetracking since this is a test computer');
        p.windowTesting=1;
    case 'xps13'
        p.screenSize = 34.0;
        p.screenRes = [1920 1200];
        p.viewDist = 57;
        p.refreshRate = 60;
        p.dir = '/Users/Jenny Motzer/One Drive/Documents/GitHub/ZOOT/experiment-files';
        p.retina = 1; disp('Testing mode is active!');
        p.useKbQueue = 1;
        p.eyeTracking=0; disp('shutting off eyetracking since this is a test computer');
    case 'denlab-beh'
        p.screenSize = 53.5;
        p.screenRes = [1920 1080];
        p.viewDist = 75;
        p.refreshRate = 120;
        p.dir = '/home/denisonlab-beh/Experiments/ZOOT/experiment-files';
        p.retina = 0;
        p.useKbQueue = 1;
        % p.eyeTracking = 1;
        if s.exptStage > 0
            p.eyeTracking = 1; 
        else 
            p.eyeTracking = 0;
        end 
        p.eyeSlack = 0.12;
        p.windowTesting=0;
    case 'denlab-eeg'
        p.screenSize = 53.5;
        p.screenRes = [1920 1080];
        p.viewDist = 57;
        p.refreshRate = 120;
        p.dir = '/home/denisonlab/Experiments/ZOOT/experiment-files';
        p.retina = 1;
        p.useKbQueue = 1;
        p.eyeTracking = 1; 
        p.windowTesting = 0;
        p.eyeSlack = 0.12;
end 

%% Fixation
p.fixSize = 0.25; % diameter of the fixation circle, in degrees visual angle
p.fixColor = 1; % white
p.dimTargetColor = 0.75; 
p.dimFixColor = 0.25; %dimmed for ITI
p.fixLineWidth = 3;
p.fixRadius=3;
p.eyeRad = 1.5;
p.noFixTrials=[]; %variable that will contain missed trials 

%% Instructions
p.font='Arial';
p.fontSize=24;
p.instructions=fileread('instructions.txt');

%% Images
p.backgroundColor = 0.5; % gray
p.imPos = [0 0];
p.gratingSF = 4; % spatial frequency, in cycles per degree, 4
p.gratingSD = 0.7; % standard deviation, about 4 SDs will be visible at full contrast, 0.7
p.gratingDiameter = 2.8; %8
p.gratingImSize = 40; 
p.gratingBaseOrientations =[0 90];
p.gratingPhases ='rand';
p.aperture = 'gaussian'; % 'cosine'
p.apertureEdgeWidth = 1;
p.angularFreq = 8;


%% Sounds
p.volume=0.01;

p.Fs = 48000; % samples per second, 48000
p.sampleRate=48000;
p.toneFreqs = [784 523]; % Hz; [G5, C5]
p.toneDur = 0.2; % seconds 
p.toneVolume=0.5;
p.toneEnvelope=1;%1 envelope on, 2 envelope off
p.envRampDuration=10; %ms

%%%%%%%%%%%%%%%%%%%%%%%%%%% JUNEAU'S CLICK SOUND %%%%%%%%%%%%%%%%%%%%%%%%%%
% target click sounds
p.clickFs = 44100; % samples per second
p.tLev = 80; %70; %80; % Target level, "dB SPL", arbitrary, usually at 80

p.rms1Lev = 100; % Norm. value for RMS of 1, arbitrary
p.tScale = 10.^((p.tLev-p.rms1Lev)./20); % Scale factor for target level setting
p.sweepDur = 0.030; % duration of each sweep in seconds
p.rampDur = 0.005; % duration of each onset/offset ramp in seconds
p.SOADur = 0.220; % 0.250; % duration of SOA, seconds
% method = 'linear'; % sweep type, linear so duration of sweep before and after CF is equivalent
p.method = 'logarithmic';
p.ISIDur = 0.800; %1.000;
p.ISIOffsetDur = 0.470; %0.500;
p.clickDur = 0.0005;           % duration of each click in seconds - 0.0005
p.clickRampDur = p.clickDur/2;  % duration before the click peak in seconds
p.clickFreq = 8000;           % highest frequency of click peak in Hertz

% Generate the click noise (from jw_soundClick)
% "The Fourier transform of a square wave pulse is sin(x)/x"
% Source: https://www.mathworks.com/matlabcentral/answers/1612350-how-to-program-a-click-stimulus?s_tid=prof_contriblnk
% smallest it can  be on Linux and Sennheiser is 0.04644
tclick = linspace(0, p.clickDur*p.clickFs, p.clickDur*p.clickFs)/p.clickFs;     % generate time vector (s)
xValue = 2*pi*(tclick-p.clickRampDur)*p.clickFreq;               % x value based on the Fourier transform of a square wave, sin(x)/x
c = sin(xValue)./(xValue);                              % generate the click

clickRampDurSamples = 0:1/p.clickFs:p.clickRampDur - 1/p.clickFs;
clickRampDurSamples = length(clickRampDurSamples); % number of samples for onset/offset ramps
c = CosineSquaredRamp(c,clickRampDurSamples);
c = c-mean(c); % Next three lines are setting the overall level
c = c./rms(c);
c = c.*p.tScale;

clickOffsetDur = round((0.200-p.clickDur)*44100);

p.sound = c;
p.sound = repmat(p.sound,2,1); % two audio channels

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% response 
p.responseNames = {'CCW','CW','absent'};
p.responseKeys = {'1!','2@','3#'};

p.deviceIndex = 1; % accept response from all inputs 
p.eyeTrackerCalibrationKey='home';
%% Timing
p.precueSOA = 1; % precue to T1
p.imDur = 0.05; % 50ms, target presentation duration - 0.05
p.targetSOA = 0.25; % s, T1 to T2 - 0.25
p.postcueSOA = 0.5; % T2 to postcue
p.feedbackLength=0.5; %feedback color length 
p.ITI=.75; %750 ms ITI
% p.responseWindowDur=2; %2 second window allowed for response

%% Condition information
p.precueNames = {'valid','neutral','invalid'};
p.precueValidities = [1 1 1 2 3];
p.targets = {'T1','T2'};
p.axisNames = {'V','H'};
p.axes = [0 90]; %  90
p.tiltNames = {'CCW','CW'};
p.tilts = [-1 1];
p.contrastNames = {'high', 'low'};
p.contrasts = [1 0]; % set back to 1 0
p.phases = linspace(0,1.5*pi,4);

%% practice settings

p.practiceThreshold = 5;
p.nTotalTrials = numel(p.targets) * numel(p.contrasts) * numel(p.contrasts) * numel(p.axes) * numel(p.axes) * numel(p.tilts) * numel(p.tilts);

switch s.exptStage
    case 0
        p.precueValidities = 3; % all neutral slow practice
        p.imDur = p.imDur*4;
        p.targetSOA = p.targetSOA*4;
        p.nTotalTrials = numel(p.targets) * numel(p.contrasts) * numel(p.contrasts) * numel(p.axes) * numel(p.axes) * numel(p.tilts) * numel(p.tilts);
        p.nTrialsPerBlock = p.nTotalTrials;
    case 1
        p.precueValidities = 3; % all neutral practice
        p.nTotalTrials = numel(p.targets) * numel(p.contrasts) * numel(p.contrasts) * numel(p.axes) * numel(p.axes) * numel(p.tilts) * numel(p.tilts);
        p.nTrialsPerBlock = 32; %p.nTotalTrials;
    case 2
        p.precueValidities = 3; % all neutral threshold
        p.nTotalTrials = numel(p.targets) * numel(p.contrasts) * numel(p.contrasts) * numel(p.axes) * numel(p.axes) * numel(p.tilts) * numel(p.tilts);
        p.nTrialsPerBlock = p.nTotalTrials;
        p.stairs = [.2 .4 .6 .8 1 1.2 1.4 2 3 5];
    case 3
        p.precueValidities = 1; % all valid
        p.nTotalTrials = numel(p.targets) * numel(p.contrasts) * numel(p.contrasts) * numel(p.axes) * numel(p.axes) * numel(p.tilts) * numel(p.tilts);
        p.nTrialsPerBlock = 32;
    case 4 % full task practice
        p.nTotalTrials = numel(p.precueValidities) * numel(p.targets) * numel(p.contrasts) * numel(p.contrasts) * numel(p.axes) * numel(p.axes) * numel(p.tilts) * numel(p.tilts);
        p.nTrialsPerBlock = numel(p.precueValidities) * numel(p.targets) * numel(p.contrasts) * numel(p.contrasts); % main task
        %p.nTrialsPerBlock = 4; %debugging
        p.nBlocks = 1;
        p.nBlockPerSession = 1;
    case 5 % main task
        p.nTotalTrials = numel(p.precueValidities) * numel(p.targets) * numel(p.contrasts) * numel(p.contrasts) * numel(p.axes) * numel(p.axes) * numel(p.tilts) * numel(p.tilts);
        p.nTrialsPerBlock = numel(p.precueValidities) * numel(p.targets) * numel(p.contrasts) * numel(p.contrasts); % main task
        %p.nTrialsPerBlock = 4; %debugging
        p.nBlocks = p.nTotalTrials / p.nTrialsPerBlock;
        p.nBlockPerSession = p.nBlocks/2;
end
