function zoot
% zoot Runs experiment code for temporal attention x temporal competition experiment.
% zoot = zero one or two target 
%
% JM & KT
% December 2023

%% PTB setup

% Check we are running PTB-3
AssertOpenGL;

% Skip screen tests - ONLY for demo, not for real experiments
Screen('Preference', 'SkipSyncTests', 0); % set to 0 for real experiment

% s.subjectID = 'test'; %debugging 
% s.session = 1; 
% s.comp = 'denlab-beh'; 
% s.exptStage = 6; 

%% Input
s.subjectID= input('Enter subject ID:  ', 's');
s.session = input('Enter session number (1-2):  ');
s.comp = input('Enter computer (iMac, denlab-beh, denlab-eeg):  ', 's');
s.exptStage = input(['Which expt stage?', ...
        '\n0 - intro' ...
        '\n1 - neutral practice' ...
        '\n2 - staircasing', ...
        '\n3 - valid practice', ...
        '\n4 - full task practice', ...
        '\n5 - main task', ...
        '\n6 - one target practice', ...
        '\n']);

%% RUN experiment 
[data]= zoot_main(s);




