%% CSV

load dataAll.mat

SIDs = {'S0004', 'S0005', 'S0007', 'S0013', 'S0015', 'S0018', 'S0019', 'S0070', 'S0071', 'S0085', 'S0105', 'S0108', 'S0111', 'S0122', 'S0133'};
Validities = [ 1 2 3]; % Valid, Neutral, Invalid
Targets = [1 2] ; % T1, T2
Contrasts = [1 0]; % present absent 
nontargetContrasts = [1 2 3]; % all, nontarget present, nontarget absent
numCondsAcc_RT = 3*2*4; % three validities x two targets x four contrast conditions 


% create csv file for accuracy and RT data (needs to be separate from SDT
% because acc and RT out of 4 contrast conditions (PP, PA, AP, AA) and SDT
% out of three ( all NTP NTA)
SID = [];
Validity = [];
Target = [];
targetContrast = [];
nontargetContrast = [];
for iSub = 1:length(SIDs)
    for i = 1:numCondsAcc_RT
        SID = [SID; SIDs{iSub}]; % SID
    end

    % contrasts 
    for iContrast = 1:numel(Contrasts)
        for iTarget = 1:numel(Targets)
            for i = 1:6
                targetContrast = [targetContrast; Contrasts(iContrast)];
            end 
        end 
    end 

    for iTarget = 1:numel(Targets)
        for iContrast = 1:numel(Contrasts)
            for i = 1:6
                %targetContrast = [targetContrast; Contrasts(iContrast)]; % target contrast 
                nontargetContrast = [nontargetContrast; Contrasts(iContrast)]; % nontarget contrast 
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

%get accuracy and RT 
Acc = [];
RT = [];
for iSub = 1:length(SIDs)
    for iContrast = 1:4
        for iTarget = 1:numel(Targets)
            for iValid = 1:numel(Validities)
                Acc = [Acc; dataAll(iSub).means(iContrast,iValid, iTarget)];
                RT = [RT; dataAll(iSub).RTmeans(iContrast, iValid, iTarget)];
            end
        end
    end
end

accTable = table(SID, Validity, Target, targetContrast, nontargetContrast, Acc, RT);
writetable(accTable,'tazoot_Acc_RT.csv','Delimiter',',','QuoteStrings','all')
type 'tazoot_Acc_RT.csv'

%% accuracy by target contrast - broken down anova 

%% create csv file for SDT 
numCondsSDT = 3*3*2; % three validities x three conditions (all, ntp, nta), and two targets

sdt_SID = [];
sdt_Validity = [];
sdt_Target = [];
sdt_nontargetContrast = [];
for iSub = 1:length(SIDs)
    for i = 1:numCondsSDT
        sdt_SID = [sdt_SID; SIDs{iSub}];
    end
    for iNontargetContrast = 1:numel(nontargetContrasts)
        for i = 1:6
            sdt_nontargetContrast = [sdt_nontargetContrast; nontargetContrasts(iNontargetContrast)];
        end
    end
end

for iSub = 1:length(SIDs)*3
    for i = 1:2
        for iValid = 1:numel(Validities)
            sdt_Validity = [sdt_Validity; Validities(iValid)];
        end
    end
    for iTarget = 1:numel(Targets)
        for i = 1:3 % for each validity - does three sets of each target (1 1 1, 2 2 2) for each validity
            sdt_Target = [sdt_Target; Targets(iTarget)];
        end
    end
end

% get dPrime and criterion
det_dPrime = [];
det_crit = [];
dis_dPrime = [];
dis_crit = [];
for iSub = 1:length(SIDs)
    dataAll(iSub).detdPrime = cat(3, dataAll(iSub).detd.all, dataAll(iSub).detd.nontargetPresent, dataAll(iSub).detd.nontargetAbsent);
    dataAll(iSub).detCrit = cat(3, dataAll(iSub).detc.all, dataAll(iSub).detc.nontargetPresent, dataAll(iSub).detc.nontargetAbsent);
    dataAll(iSub).disdPrime = cat(3, dataAll(iSub).disd.all, dataAll(iSub).disd.nontargetPresent, dataAll(iSub).disd.nontargetAbsent);
    dataAll(iSub).disCrit = cat(3, dataAll(iSub).disc.all, dataAll(iSub).disc.nontargetPresent, dataAll(iSub).disc.nontargetAbsent);
    for iNontargetContrast = 1:numel(nontargetContrasts)
        for iTarget = 1:numel(Targets)
            for iValid = 1:numel(Validities)
                det_dPrime = [det_dPrime; dataAll(iSub).detdPrime(iTarget,iValid, iNontargetContrast)];
                det_crit = [det_crit; dataAll(iSub).detCrit(iTarget, iValid, iNontargetContrast)];
                dis_dPrime = [dis_dPrime; dataAll(iSub).disdPrime(iTarget,iValid, iNontargetContrast)];
                dis_crit = [dis_crit; dataAll(iSub).disCrit(iTarget, iValid, iNontargetContrast)];
            end
        end
    end
end


sdtTable = table(sdt_SID, sdt_Validity, sdt_Target, sdt_nontargetContrast, det_dPrime, det_crit, dis_dPrime, dis_crit);
writetable(sdtTable,'tazoot_SDT.csv','Delimiter',',','QuoteStrings','all')
type 'tazoot_SDT.csv'

