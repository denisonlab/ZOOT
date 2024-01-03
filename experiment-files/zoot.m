function zoot

% zoot.m
% runs experiment 
% ___________________________________________________________________
% 
% Testing higher whether temporal competition happens during sensory stage 
% or working memory

% Goal: Determine whether behavioral effects of temporal attention persist
% in one target trials 
% 
% p = parameters
% s = stimuli, rects, trials 
% window = window 
% data = data 
% ___________________________________________________________________

clear; close all; 

%% Input 
% Subject and session info 
p.subjectID = input('Enter subject ID:  ','s');
p.sessionNum = input('Enter session number (1,2,3 (if more than 3 enter 3): ');
p.testingLocation = input('Enter testing location (desk, DenBehav, MW, DenEEG):  ','s');
p.exptStage = input(['Which expt stage?',...
       '\n1 - Threshold instructions',...
       '\n2 - Threshold',...
       '\n3 - Main expt instructions',...
       '\n6 - Main expt (interleaved target contrasts)',...
       '\n7 - Eye test',...
       '\n8 - Practice',...
       '\n']);
       % '\n4 - Main expt',...
       % '\n5 - Main expt (blocked target duration)',...
