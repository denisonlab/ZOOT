function p = zootparams

%% main settings

addpath data/ toolboxes/eyetrack-tools-master/ functions/ trial-structs/
p.windowTesting=1;
p.staircasing = 0;
p.stimmapping = 0;
p.watch_response=0;
p.comp = 'iMac';

%% Screen

switch p.comp
    case 'iMac'
        p.screenSize = 52.7;
        p.screenRes = [2240 1260];
        p.viewDist = 57;
        p.refreshRate = 60;
        p.dir = '/Users/jennymotzer/Documents/GitHub/ZOOT/experiment-files';
        p.retina = 1; disp('Testing mode for macbooks is active!');
        p.useKbQueue = 1;
        p.eyeTracking=0; disp('shutting off eyetracking since this is a test computer');
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
        p.dir = '/Users/denisonlab-beh/Experiments/ZOOT/experiment-files';
        p.retina = 1;
        p.useKbQueue = 1;
        p.eyeTracking=1;
    case 'denlab-eeg'
        p.screenSize = 53.5;
        p.screenRes = [1920 1080];
        p.viewDist = 57;
        p.refreshRate = 120;
        p.dir = '/Users/denisonlab-eeg/Experiments/ZOOT/experiment-files';
        p.retina = 1;
        p.useKbQueue = 1;
        p.eyeTracking=1; 
end 

%% Fixation
p.fixSize = 0.5; % diameter of the fixation circle, in degrees visual angle
p.fixColor = 1; % white
p.dimFixColor = 0.25; %dimmed for ITI
p.fixLineWidth = 3;
p.fixRadius=3;
p.noFixTrials=[]; %variable that will contain missed trials 

%% Instructions
p.font='Arial';
p.fontSize=24;
p.instructions=fileread('instructions.txt');

%% Images
p.backgroundColor = 0.5; % gray
p.imPos = [0 0];
p.imSize = 40; 
p.gratingSize = 4; % grating diameter, in degrees visual angle
p.gratingSF = 1; % spatial frequency, in cycles per degree
p.gaborSD = 0.5; % about 4 SDs will be visible at full contrast
p.gratingDiameter=[4 0.5];
p.gratingBaseOrientations=[0 90];
p.gratingPhases ='rand';
p.aperture = 'cosine'
p.apertureEdgeWidth=0.5;
p.angularFreq=8;


%% Sounds
p.volume=0.01;

p.Fs = 48000; % samples per second
p.sampleRate=48000;
p.toneFreqs = [784 523]; % Hz; [G5, C5]
p.toneDur = 0.2; % seconds 
p.toneVolume=0.5;
p.toneEnvelope=1;%1 envelope on, 2 envelope off
p.envRampDuration=10; %ms

%%%%%%%%%%%%%%%%%%%%%%%%%%% JUNEAU'S CLICK SOUND %%%%%%%%%%%%%%%%%%%%%%%%%%
% target click sounds
p.Fs = 44100; % samples per second
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
p.clickDur = 0.0005;           % duration of each click in seconds
p.clickRampDur = p.clickDur/2;  % duration before the click peak in seconds
p.clickFreq = 8000;           % highest frequency of click peak in Hertz

% Generate the click noise (from jw_soundClick)
% "The Fourier transform of a square wave pulse is sin(x)/x"
% Source: https://www.mathworks.com/matlabcentral/answers/1612350-how-to-program-a-click-stimulus?s_tid=prof_contriblnk
% smallest it can  be on Linux and Sennheiser is 0.04644
tclick = linspace(0, p.clickDur*p.Fs, p.clickDur*p.Fs)/p.Fs;     % generate time vector (s)
xValue = 2*pi*(tclick-p.clickRampDur)*p.clickFreq;               % x value based on the Fourier transform of a square wave, sin(x)/x
s = sin(xValue)./(xValue);                              % generate the click

clickRampDurSamples = 0:1/p.Fs:p.clickRampDur - 1/p.Fs;
clickRampDurSamples = length(clickRampDurSamples); % number of samples for onset/offset ramps
s = CosineSquaredRamp(s,clickRampDurSamples);
s = s-mean(s); % Next three lines are setting the overall level
s = s./rms(s);
s = s.*p.tScale;

clickOffsetDur = round((0.200-p.clickDur)*44100);

p.sound = s;
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
p.axes = [0 90];
p.tiltNames = {'CCW','CW'};
p.tilts = [-1 1];
p.contrastNames = {'high', 'low'};
p.contrasts = [1 0];
p.phases = [0 pi/2 pi 3*pi/2];


