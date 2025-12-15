function [pathToZoot,figDir] = pathToZoot(user)
% adds paths to zoot and returns correct figDir 

% Directories
switch user
    case {'karen'}
        pathToZoot = '/Users/kantian/Dropbox/github/ZOOT';
    case {'karenlab'}
        pathToZoot = '/Users/karen/Dropbox/github/ZOOT';
    case {'jenny'}
        pathToZoot = '/Users/jennymotzer/Documents/GitHub/ZOOT';
    otherwise 
        error('User not specified. Please specify in pathToZoot.m')
end
addpath(genpath(pathToZoot))

figDir = sprintf('%s/groupFigs',pathToZoot); 
if ~exist(figDir,'dir')
    mkdir(figDir)
end

