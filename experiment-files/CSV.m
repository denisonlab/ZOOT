%% CSV

load dataAll.mat

SIDs = {'S0004', 'S0005', 'S0007', 'S0013', 'S0015', 'S0018', 'S0019', 'S0070', 'S0071', 'S0085', 'S0105', 'S0108', 'S0111', 'S0122', 'S0133'};
Validities = [ 1 2 3]; % Valid, Neutral, Invalid
Targets = [1 2] ; % T1, T2
numConds = 3*2; % three validities x two targets

SID = [];
for iSub = 1:length(SIDs)
    for i = 1:numConds
        SID = [SID; SIDs{iSub}];
    end
end

Validity = [];
Target = [];
for iSub = 1:length(SIDs)
    for i = 1:2
        for iValid = 1:numel(Validities)
            Validity = [Validity; Validities(iValid)];
        end
    end
end

for iSub = 1:length(SIDs)
    for iTarget = 1:numel(Targets)
        for i = 1:3
            Target = [Target; Targets(iTarget)];

        end
    end
end

AccPP = [];
AccPA = [];
AccAP = [];
AccAA = [];
for iSub = 1:length(SIDs)
    for iTarget = 1:numel(Targets)
        for iValid = 1:numel(Validities)
            AccPP = [AccPP; dataAll(iSub).means(1,iValid, iTarget)];
            AccPA = [AccPA; dataAll(iSub).means(2,iValid, iTarget)]
            AccAP = [AccAP; dataAll(iSub).means(3,iValid, iTarget)];
            AccAA = [AccAA; dataAll(iSub).means(4,iValid, iTarget)]
        end
    end
end

accTable = table(SID, Validity, Target, AccPP, AccPA, AccAP, AccAA);
writetable(accTable,'tazoot_behav.csv','Delimiter',',','QuoteStrings','all')
type 'tazoot_behav.csv'