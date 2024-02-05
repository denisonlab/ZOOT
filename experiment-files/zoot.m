function zoot

% zoot.m
% tazoott
%
% jenny motzer
% december 2023

%% PTB setup

% % Check we are running PTB-3
% AssertOpenGL;
% 
% % Skip screen tests - ONLY for demo, not for real experiments
Screen('Preference', 'SkipSyncTests', 1); % set to 0 for real experiment

s.subjectID = 'test'; %debugging 
s.session = 1; 
s.comp = 'iMac'; 
s.exptStage = 5; 

%% Input
% s.subjectID= input('Enter subject ID:  ', 's');
% s.session = input('Enter session number (1-4):  ');
% s.comp = input('Enter computer (iMac, denlab-beh, denlab-eeg):  ', 's');
% s.exptStage = input(['Which expt stage?', ...
%         '\n0 - intro' ...
%         '\n1 - neutral practice' ...
%         '\n2 - staircasing', ...
%         '\n3 - valid practice', ...
%         '\n4 - full task practice', ...
%         '\n5 - main task', ...
%         '\n']);


%% RUN
switch s.exptStage
    case 0
        [data]  = zoot_main(s);
    case 1
        [data]  = zoot_main(s);
    case 2
        [data] = zoot_main(s);
    case 3 
        [data]= zoot_main(s);
    case 4
        [data]= zoot_main(s);
    case 5
        [data]= zoot_main(s);

end
