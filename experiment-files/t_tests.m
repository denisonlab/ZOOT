%% load and organize data 
load dataAll.mat

% creates a 3 (validity) x number of subjects x 2 (target) matrix for each
% contrast condition, each row holds a list of each participants data value
% for each condition (row 1 of matrix 1: all valid PP T1 values for each
% participant)
names = {'PP', 'PA', 'AP', 'AA'};
for iSub = 1:numel(dataAll)
    for iCond = 1:4
        for iTarget = 1:2
            for iValid = 1:3
                acc.(names{iCond})(iValid,iSub,iTarget) = dataAll(iSub).means(iCond,iValid,iTarget); % accuracy
            end
        end
    end
end

%% t-test
for iCond = 1:4
    for iTarget = 1:2
        [h,p,ci,stats] = ttest(acc.(names{iCond})(1,:,iTarget), acc.(names{iCond})(2,:, iTarget)); % t-test for valid and neutral
        acc.(names{iCond}).valid_neutral_h = h;

        [h,p,ci,stats] = ttest(acc.(names{iCond})(1,:,iTarget), acc.(names{iCond})(3,:, iTarget)); % valid and invalid
        acc.(names{iCond}).valid_invalid = [h,p,ci,stats];
        [h,p,ci,stats] = ttest(acc.(names{iCond})(2,:,iTarget), acc.(names{iCond})(3,:, iTarget)); % neutral and invalid
        acc.(names{iCond}).neutral_invalid = [h,p,ci,stats];
    end 
end 