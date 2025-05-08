
%% Export data to csv's for R
load zoot_dataAll.mat

SIDs = {'S0004', 'S0005', 'S0007', 'S0013', 'S0015', 'S0018', 'S0019', 'S0070', 'S0071', 'S0085', 'S0105', 'S0108', 'S0111', 'S0122', 'S0133'};
Validities = [ 1 2 3]; % Valid, Neutral, Invalid
Targets = [1 2] ; % T1, T2
Contrasts = [1 0]; % present absent 
nontargetContrasts = [1 2 3]; % all, nontarget present, nontarget absent
ntpntaContrasts = [1 2];
numCondsAcc_RT = 3*2*4; % three validities x two targets x four contrast conditions 

%% Acc and RT out of 4 contrast conditions (PP, PA, AP, AA) and SDT
% out of three ( all NTP NTA)
SID = [];
Validity = [];
Target = [];
targetContrast = [];
nontargetContrast = [];
swapNontargetContrast = [];
swapTargetContrast = [];
for iSub = 1:length(SIDs)
    for i = 1:numCondsAcc_RT
        SID = [SID; SIDs{iSub}]; % SID
    end

    % contrasts 
    for iContrast = 1:numel(Contrasts)
        for iTarget = 1:numel(Targets)
            for i = 1:6
                nontargetContrast = [nontargetContrast; Contrasts(iContrast)];
            end 
        end 
    end 

    for iTarget = 1:numel(Targets)
        for iContrast = 1:numel(Contrasts)
            for i = 1:6
                targetContrast = [targetContrast; Contrasts(iContrast)]; % target contrast 
            end
        end
    end
end 
for iSub = 1:length(SIDs)*4
    for i = 1:2
        for iValid = 1:numel(Validities)
            Validity = [Validity; Validities(iValid)]; % Validity
        end
    end
    for iTarget = 1:numel(Targets)
        for i = 1:3 % for each validity - does three sets of each target (1 1 1, 2 2 2) for each validity
            Target = [Target; Targets(iTarget)]; % Target
        end
    end
end

%% Sensitivity to the non target
% create csv file for accuracy and RT data (needs to be separate from SDT
% because acc and RT out of 4 contrast conditions (PP, PA, AP, AA) and SDT
% out of three ( all NTP NTA)
clear swapAcc validity target targetContrast nonTargetContrast SID
swapAcc=[]; validity=[]; target=[]; targetContrast=[]; nonTargetContrast=[]; 
count = 1; 
for iS = 1:length(SIDs)
    for iT = 1:2
        for iCC = 1:4 % contrast condition [ target contrast ]
            for iV = 1:numel(Validities)
                if dataAll(iSub).means(iCC,iV,iT)> 93.75 % only look at swap rates when accuracy was below 93.75
                   swapAcc = [swapAcc; NaN];
                else
                   swapAcc = [swapAcc; dataAll(iSub).NTErrAccmeans(iCC,iV,iT)];
                end
                validity = [validity; Validities(iV)];
                target = [target; iT];
                SID{count} = SIDs(iS); 
                switch iCC 
                    case 1
                        tC = 1;
                        nTC = 1; 
                    case 2
                        tC = 1; 
                        nTC = 0; 
                    case 3
                        tC = 0; 
                        nTC = 1; 
                    case 4
                        tC = 1; 
                        nTC = 0; 
                end
                targetContrast = [targetContrast; tC];
                nonTargetContrast = [nonTargetContrast; nTC];
                count = count+1; 
            end
        end
    end
end

SID=SID'; 
accTable = table(SID, validity, target, targetContrast, nonTargetContrast, swapAcc);
writetable(accTable,'tazoot_swapAcc_kt.csv','Delimiter',',','QuoteStrings','all')


% errSwapAcc = []; % swaps over incorrect trials
% for iSub = 1:length(SIDs)
%     for iContrast = 1:4
%         for iTarget = 1:numel(Targets)
%             for iValid = 1:numel(Validities)
%                 errSwapAcc = [errSwapAcc; dataAll(iSub).NTErrAccmeans(iContrast,iValid, iTarget)];
%             end
%         end
%     end
% end
% 
% accTable = table(SID, Validity, Target, targetContrast, nontargetContrast, errSwapAcc);
% writetable(accTable,'tazoot_errSwapAcc.csv','Delimiter',',','QuoteStrings','all')
% type 'tazoot_errSwapAcc.csv'

% swaps over incorrect trials, excluding instances where target accuracy >
% 93.75%
% point95_SwapAcc = [];
% for iSub = 1:length(SIDs)
%     for iContrast = 1:4
%         for iTarget = 1:numel(Targets)
%             for iValid = 1:numel(Validities)
%                 if dataAll(iSub).means(iContrast,iValid,iTarget)> 93.75
%                    point95_SwapAcc = [point95_SwapAcc; NaN];
%                 else
%                    point95_SwapAcc = [point95_SwapAcc; dataAll(iSub).NTErrAccmeans(iContrast,iValid,inonTarget)];
%                 end
%             end
%         end
%     end
% end 
% accTable = table(SID, Validity, Target, targetContrast, nontargetContrast, point95_SwapAcc);
% writetable(accTable,'tazoot_point93_errSwapAcc.csv','Delimiter',',','QuoteStrings','all')
% type 'tazoot_point93_errSwapAcc_kt.csv'
