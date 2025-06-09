function [stairIdx, lastFewAcc] = updateStaircase(stairs, stairIdx, lastFewAcc, correct)
% [stairIdx lastFewAcc] = updateStaircase(stairs, stairIdx, lastFewAcc, correct)
%
% Implements a 3 up, 1 down staircase
% Output args are required and must be named the same as their
% corresponding input args.
% Assumes the stairs are ordered hard to easy (as when finding a threshold)
%
% Rachel Denison
% 2014 April 15

%edited by MLE to reset tracker at level changes - 2021-10-21
% edited by JAM to 2 up 1 down
% keep track of last 2 trials

lastFewAcc = [lastFewAcc correct];
% if numel(lastFewAcc)>3
%     lastFewAcc = lastFewAcc(end-2:end);
% end
if sum(lastFewAcc)==3
    stairIdx = stairIdx-1; % make it harder
    lastFewAcc=[]; %reset tracker at reversal
elseif correct==0
    stairIdx = stairIdx+1; % make it easier
    lastFewAcc=[]; %reset tracker at reversal
end
if stairIdx > numel(stairs)
    stairIdx = numel(stairs);
elseif stairIdx < 1
    stairIdx = 1;
end