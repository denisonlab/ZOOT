%% load and organize data 
load dataAll.mat

% creates a 3 (validity) x number of subjects x 2 (target) matrix for each
% contrast condition, each row holds a list of each participants data value
% for each condition (row 1 of matrix 1: all valid PP T1 values for each
% participant)
contrasts = {'PP', 'PA', 'AP', 'AA'};
for iSub = 1:numel(dataAll)
    for iCond = 1:4
        for iTarget = 1:2
            for iValid = 1:3
                acc.(contrasts{iCond})(iValid,iSub,iTarget) = dataAll(iSub).means(iCond,iValid,iTarget); % accuracy 
            end
        end
    end
end

%% t-test accuracy 
pairs = [1 2; 1 3; 2 3];
pairNames = {'vn','vi','ni'};
nPairs = numel(pairNames);

[h, p, ci, stats] = deal([]);

for iCond = 1:4
    for iTarget = 1:2
        for iPair = 1:nPairs
            pair = pairs(iPair,:);
            pairName = pairNames{iPair};

            [h.(pairName)(iCond,iTarget),p.(pairName)(iCond,iTarget),ci.(pairName){iCond,iTarget},stats.(pairName){iCond,iTarget}] = ...
                ttest(acc.(contrasts{iCond})(pair(1),:,iTarget), acc.(contrasts{iCond})(pair(2),:, iTarget)); % paired t-test
        end
    end
end