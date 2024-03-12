function trialOrder = zoot_makeBlocks(p)

% Choose order of trial presentation
% makes block structure for zoot 
% 
% % nTrials = 1280; % size(trials,1); % 640 - 320 per session x 4 = 1280 
% 
nTrials = p.nTotalTrials;
trialOrder = randperm(nTrials);
% 
% % 
% trialOrder = [];
% for iRep = 1:p.nReps
%     trialOrder = [trialOrder randperm(nTrials)];
% end
% 

% % Minimum counterbalanced unit of validity, target, contrasts = 40; 
% MCU = numel(p.precueValidities) * numel(p.targets) * numel(p.contrasts) * numel(p.contrasts); 
% 
% trialOrder = NaN(1,nTrials);
% 
% % Randomly shuffle within each MCU
% if s.session ==1
%     for i = 1:MCU:nTrials % finds index of number of first trial per block (eg. numtrialsperblock = 40; 1 41 81 121, etc.)
%         MCUIdx = i:i+MCU-1; % finds numbers between the nums in list above to get groups of 40 (eg. 1-40; 41-80, etc.)
%         shuffledMCUIdx = MCUIdx( randperm(length(MCUIdx)) ); % randomly shuffles each group of 40
%         trialOrder(MCUIdx) = shuffledMCUIdx; % returns 1 x 1280 structure of trial order shuffled in groups of 40
%     end
% end

