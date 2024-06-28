clear all

saveplots = 0;

fp = figureparams;

addpath('/Users/jennymotzer/Documents/GitHub/ZOOT/experiment-files/functions/')

%% compile
subs = {'S0004', 'S0005', 'S0007', 'S0013', 'S0015', 'S0019', 'S0108', 'S0070','S0122', 'S0133'};
dataAll = [];

for iSub=1:length(subs) % for participant
    SID = subs{iSub};
    %iMac
    behDir = ['/Users/jennymotzer/Documents/GitHub/ZOOT/experiment-files/data/' SID '/beh/'];
    exptDir = '/Users/jennymotzer/Documents/GitHub/ZOOT/experiment-files/';
    % beh comp
    % behDir = ['/home/denisonlab-beh/Experiments/ZOOT/experiment-files/data' SID '/beh'];
    cd(behDir);
    dataAll(iSub).subjectID = SID;
    fields = {'precue','target', 'T1Contrast', 'T2Contrast', 'T1Tilt', 'T2Tilt', 'targetTilt', 'targetContrast', 'seen', 'correct', 'response', 'correctDis', 'session', 'eyeSkip'}; % fieldnames(data);
    for iF = 1:numel(fields) % initialize
        dataAll(iSub).(fields{iF}) = [];
    end
    sessions = {'session1','session2'};
    for iSession = 1:numel(sessions) % for session
        highestBlock = 0;
        sesNum = sessions{iSession};
        sesDir = ['/Users/jennymotzer/Documents/GitHub/ZOOT/experiment-files/data/' SID '/beh/' sesNum];
        cd(sesDir)
        listing = dir;
        for iFile = 3:size(dir) % for file
            fileName = listing(iFile).name;
            splitName  = strsplit(fileName, '_');
            splitBlock = splitName{5};
            blockNum = str2num(splitBlock(6:end));
            if blockNum > highestBlock
                highestBlock = blockNum;
            end
        end
        findFile = dir(sprintf('*block%d*.mat', highestBlock));
        highestFileName = findFile.name;
        load(highestFileName)
        for iF = 1:numel(fields) % initialize
            if strcmp(fields{iF}, 'eyeSkip') == 1
                data.(fields{iF}) = data.(fields{iF})';
            end
            dataAll(iSub).(fields{iF}) = [dataAll(iSub).(fields{iF}) data.(fields{iF})]; % compiles data structures from one participant
        end

   %% variables

        % get nontarget info
        contrasts = [1 0];
        tilts = [-1 1];
        dataAll(iSub).nonTargetContrast = [];
        dataAll(iSub).nontarget = [];
        dataAll(iSub).nonTargetTilt = [];
        for iNonTarget = 1:size(dataAll(iSub).targetContrast,2)
            if dataAll(iSub).target(iNonTarget) == 1
                dataAll(iSub).nontarget(iNonTarget) = 2;
                dataAll(iSub).nonTargetContrast(iNonTarget) = contrasts(dataAll(iSub).T2Contrast(iNonTarget));
                dataAll(iSub).nonTargetTilt(iNonTarget) = tilts(dataAll(iSub).T2Tilt(iNonTarget));
            elseif dataAll(iSub).target(iNonTarget) == 2
                dataAll(iSub).nontarget(iNonTarget) = 1;
                dataAll(iSub).nonTargetContrast(iNonTarget) = contrasts(dataAll(iSub).T1Contrast(iNonTarget));
                dataAll(iSub).nonTargetTilt(iNonTarget) = tilts(dataAll(iSub).T1Tilt(iNonTarget));
            end
        end
        for iTilt = 1:size(dataAll(iSub).target,2)
            if dataAll(iSub).targetContrast(iTilt) == 0
                dataAll(iSub).targetTilt(iTilt) = 0;
            end
            if dataAll(iSub).nonTargetContrast(iTilt) == 0
                dataAll(iSub).nonTargetTilt(iTilt) = 0;
            end
        end

        % validity variables
        Valid = dataAll(iSub).precue == dataAll(iSub).target;
        Neutral = dataAll(iSub).precue == 3;
        Invalid = (dataAll(iSub).precue == 1| dataAll(iSub).precue == 2) & dataAll(iSub).precue ~= dataAll(iSub).target;

        % target/nontarget present/absent
        PresentPresent = dataAll(iSub).targetContrast == 1 & dataAll(iSub).nonTargetContrast == 1;
        PresentAbsent = dataAll(iSub).targetContrast == 1 & dataAll(iSub).nonTargetContrast == 0;
        AbsentPresent =dataAll(iSub).targetContrast == 0 & dataAll(iSub).nonTargetContrast == 1;
        AbsentAbsent = dataAll(iSub).targetContrast == 0 & dataAll(iSub).nonTargetContrast == 0;

        Validities = {Valid Neutral Invalid};
        contrastConds = {PresentPresent PresentAbsent AbsentPresent AbsentAbsent};


     
    end % session - needs to be here to compile both sessions for each participant

      %% SDT collapsed across cueing conds
    nhDet = dataAll(iSub).seen == 1 & dataAll(iSub).targetContrast == 1; % hit: seen and present
    nfaDet = dataAll(iSub).seen == 1 & dataAll(iSub).targetContrast == 0; % fa: seen and absent
    nsignalDet = dataAll(iSub).targetContrast == 1; % signal: present
    nnoiseDet = dataAll(iSub).targetContrast == 0; % noise: absent
    Det = {nhDet nfaDet nsignalDet nnoiseDet};

    % indices for all conditions based on target, validity, SDT variable -
    % returns which contains data for all, nontarget present, non target absent. each of these contains condition data for nh nfa
    % nsignal and  nnoise
    for iTarget =1:2
        for iDet = 1:numel(Det)
            detAllIdx = Det{iDet} & dataAll(iSub).target == iTarget & ~dataAll(iSub).eyeSkip; % find all T1 and T2
            det.all(iTarget, iDet) = sum(detAllIdx);
            detNTPIdx = Det{iDet} & dataAll(iSub).target == iTarget & dataAll(iSub).nonTargetContrast == 1 & ~dataAll(iSub).eyeSkip; % find all T1 when T2 present and all T2 when T1 present
            det.nontargetPresent(iTarget, iDet) = sum(detNTPIdx);
            detNTAIdx = Det{iDet} & dataAll(iSub).target == iTarget & dataAll(iSub).nonTargetContrast == 0 & ~dataAll(iSub).eyeSkip; % find all T1 when T2 absent nd all T2 when T1 absent
            det.nontargetAbsent(iTarget, iDet) = sum(detNTAIdx);
        end
    end

    % calculate dprime and c per condition, detd/c.all, nontargetPresent,
    % nontargetAbsent for valid, neutral, and invalid for T1 and T2 
    dp = [];
    c = [];
    Detfieldnames = fieldnames(det);
    for iTarget = 1:2
        for iF = 1:numel(Detfieldnames)
            dataAll(iSub).nhDet.(Detfieldnames{iF})(1, iTarget) = det.(Detfieldnames{iF})(iTarget,1);
            dataAll(iSub).nfaDet.(Detfieldnames{iF})(1, iTarget) = det.(Detfieldnames{iF})(iTarget,2);
            dataAll(iSub).nsignalDet.(Detfieldnames{iF})(1, iTarget) = det.(Detfieldnames{iF})(iTarget,3);
            dataAll(iSub).nnoiseDet.(Detfieldnames{iF})(1, iTarget) = det.(Detfieldnames{iF})(iTarget,4);
            [dprime, criterion] = kt_dprime2(dataAll(iSub).nhDet.(Detfieldnames{iF})(1, iTarget), dataAll(iSub).nfaDet.(Detfieldnames{iF})(1, iTarget), dataAll(iSub).nsignalDet.(Detfieldnames{iF})(1, iTarget), dataAll(iSub).nnoiseDet.(Detfieldnames{iF})(1, iTarget),1);
            dataAll(iSub).detd.(Detfieldnames{iF})(1, iTarget) = [dp dprime]; % store d prime
            dataAll(iSub).detc.(Detfieldnames{iF})(1, iTarget) = [c criterion]; % store c
        end
    end

    %% discrimination
    nhDis = dataAll(iSub).correctDis == 1 & dataAll(iSub).targetTilt == 1;
    nfaDis = dataAll(iSub).correctDis == 0 & dataAll(iSub).targetTilt == -1;
    nsignalDis = dataAll(iSub).targetContrast == 1 & dataAll(iSub).seen == 1 & dataAll(iSub).targetTilt == 1;
    nnoiseDis = dataAll(iSub).targetContrast == 1 & dataAll(iSub).seen == 1 & dataAll(iSub).targetTilt == -1;
    Dis = {nhDis nfaDis nsignalDis nnoiseDis};
    %indices for all conditions based on target, validity, SDT variable
    for iTarget =1:2
            for iDis = 1:numel(Dis)
                disAllIdx =Dis{iDis} & dataAll(iSub).target == iTarget & ~dataAll(iSub).eyeSkip; % find all T1 and T2
                dis.all(iTarget, iDis) = sum(disAllIdx);
                disNTPIdx = Dis{iDis} & dataAll(iSub).target == iTarget & dataAll(iSub).nonTargetContrast == 1 & ~dataAll(iSub).eyeSkip; % find all T1 when T2 present and all T2 when T1 present
                dis.nontargetPresent(iTarget, iDis) = sum(disNTPIdx);
                disNTAIdx = Dis{iDis} & dataAll(iSub).target == iTarget & dataAll(iSub).nonTargetContrast == 0 & ~dataAll(iSub).eyeSkip; % find all T1 when T2 absent nd all T2 when T1 absent
                dis.nontargetAbsent(iTarget, iDis) = sum(disNTAIdx);
            end
    end

    % calculate dprime and c per condition
    dp = [];
    c = [];
    Disfieldnames = fieldnames(dis);
    for iTarget = 1:2
        for iF = 1:numel(Disfieldnames)
            dataAll(iSub).nhDis.(Disfieldnames{iF})(1,iTarget) = dis.(Disfieldnames{iF})(iTarget,1);
            dataAll(iSub).nfaDis.(Disfieldnames{iF})(1,iTarget) = dis.(Disfieldnames{iF})(iTarget,2);
            dataAll(iSub).nsignalDis.(Disfieldnames{iF})(1,iTarget) = dis.(Disfieldnames{iF})(iTarget,3);
            dataAll(iSub).nnoiseDis.(Disfieldnames{iF})(1,iTarget) = dis.(Disfieldnames{iF})(iTarget,4);
            [dprime, criterion] = kt_dprime2(dataAll(iSub).nhDis.(Disfieldnames{iF})(1,iTarget), dataAll(iSub).nfaDis.(Disfieldnames{iF})(1,iTarget), dataAll(iSub).nsignalDis.(Disfieldnames{iF})(1,iTarget), dataAll(iSub).nnoiseDis.(Disfieldnames{iF})(1,iTarget),1);
            dataAll(iSub).disd.(Disfieldnames{iF})(1,iTarget) = [dp dprime]; % store d prime
            dataAll(iSub).disc.(Disfieldnames{iF})(1,iTarget) = [c criterion]; % store c
        end
    end
end % subject

% mean, std, err for dprime and c for dis and det
dprimeDetIdx = [];
cDetIdx = [];
dprimeDisIdx = [];
cDisIdx = [];
for iTarget = 1:2
    for iF = 1:numel(Detfieldnames)
        for iSub = 1:length(subs)
            dprimeDetIdx = [dprimeDetIdx dataAll(iSub).detd.(Detfieldnames{iF})(1,iTarget)];
            cDetIdx = [cDetIdx dataAll(iSub).detc.(Detfieldnames{iF})(1,iTarget)];
            dprimeDisIdx = [dprimeDisIdx dataAll(iSub).disd.(Detfieldnames{iF})(1,iTarget)];
            cDisIdx = [cDisIdx dataAll(iSub).disc.(Detfieldnames{iF})(1,iTarget)];
        end
        detdStd.(Detfieldnames{iF})(1,iTarget) = std(dprimeDetIdx);
        detd.(Detfieldnames{iF})(1,iTarget) = mean(dprimeDetIdx);
        detdErr.(Detfieldnames{iF})(1,iTarget) = detdStd.(Detfieldnames{iF})(1,iTarget)/sqrt(length(subs));
        detcStd.(Detfieldnames{iF})(1,iTarget) = std(cDetIdx);
        detc.(Detfieldnames{iF})(1,iTarget) = mean(cDetIdx);
        detcErr.(Detfieldnames{iF})(1,iTarget) = detcStd.(Detfieldnames{iF})(1,iTarget)/sqrt(length(subs));

        disdStd.(Disfieldnames{iF})(1,iTarget)= std(dprimeDisIdx);
        disd.(Disfieldnames{iF})(1,iTarget) = mean(dprimeDisIdx);
        disdErr.(Disfieldnames{iF})(1,iTarget) = disdStd.(Disfieldnames{iF})(1,iTarget)/sqrt(length(subs));
        discStd.(Disfieldnames{iF})(1,iTarget) = std(cDisIdx);
        disc.(Disfieldnames{iF})(1,iTarget)= mean(cDisIdx);
        discErr.(Disfieldnames{iF})(1,iTarget) = discStd.(Disfieldnames{iF})(1,iTarget)/sqrt(length(subs));

        dprimeDetIdx = [];
        cDetIdx = [];
        dprimeDisIdx = [];
        cDisIdx = [];
    end
end

%% plot detection
dprimefieldnames = fieldnames(dataAll(iSub).detd);
critfieldnames = fieldnames(dataAll(iSub).detc);
figure();
sgtitle('ga SDT collapsed acrossing cueing conditions')
for iF = 1:numel(dprimefieldnames) % for each condition (all, nontarget present, nontarget absent)
    subplot(2,2,1)
    b = bar([detd.all; detd.nontargetPresent; detd.nontargetAbsent]);
    hold on
    for k = 1:numel(b)      % code to align error bars to grouped subplot bar coordinate, revised from stack exchange   % Recent MATLAB Versions
        xtips = b(k).XEndPoints;
        ytips = b(k).YEndPoints;
        errorbar(xtips,ytips,detdErr.(dprimefieldnames{iF})(:,k), '.k', 'MarkerSize',0.1) 
    end
    hold off
    title("detection d'")
    ylabel("d'")
    ylim([0 5])
    set(gca, 'xticklabel', {'all', 'ntp', 'nta'})
end
hold on

for iF = 1:numel(critfieldnames)
    subplot(2,2,3)
    b = bar([detc.all; detc.nontargetPresent; detc.nontargetAbsent]);
     hold on
    for k = 1:numel(b)      % code to align error bars to grouped subplot bar coordinate, revised from stack exchange   % Recent MATLAB Versions
        xtips = b(k).XEndPoints;
        ytips = b(k).YEndPoints;
        errorbar(xtips,ytips,detcErr.(dprimefieldnames{iF})(:,k), '.k', 'MarkerSize',0.1)
    end
    hold off
    title('detection c')
    ylabel('c')
    ylim([-1 1])
    set(gca, 'xticklabel', {'all', 'ntp' 'nta'})
end
% legend('T1' 'T2')
% legend('Location', 'best')
% ax = gca;
% ax.XGrid = 'off';
% ax.YGrid = 'off';
hold on

%% plot discrimination
dprimefieldnames = fieldnames(dataAll(iSub).disd);
critfieldnames = fieldnames(dataAll(iSub).detc);
for iF = 1:numel(dprimefieldnames) % for each condition (all, nontarget present, nontarget absent)
    subplot(2,2,2)
    b = bar([disd.all; disd.nontargetPresent; disd.nontargetAbsent]);
    hold on
    for k = 1:numel(b)      % code to align error bars to grouped subplot bar coordinate, revised from stack exchange   % Recent MATLAB Versions
        xtips = b(k).XEndPoints;
        ytips = b(k).YEndPoints;
        errorbar(xtips,ytips,disdErr.(dprimefieldnames{iF})(:,k), '.k', 'MarkerSize',0.1) 
    end
    hold off
    title("discrimination d'")
    ylabel("d'")
    ylim([0 5])
    set(gca, 'xticklabel', {'all', 'ntp', 'nta'})
end
hold on

for iF = 1:numel(critfieldnames)
    subplot(2,2,4)
    b = bar([disc.all; disc.nontargetPresent; disc.nontargetAbsent]);
     hold on
    for k = 1:numel(b)      % code to align error bars to grouped subplot bar coordinate, revised from stack exchange   % Recent MATLAB Versions
        xtips = b(k).XEndPoints;
        ytips = b(k).YEndPoints;
        errorbar(xtips,ytips,discErr.(dprimefieldnames{iF})(:,k), '.k', 'MarkerSize',0.1)
    end
    hold off
    title('discrimination c')
    ylabel('c')
    ylim([-1 1])
    set(gca, 'xticklabel', {'all', 'ntp', 'nta'})
end
legend('T1','T2')
legend('Location', 'best')
ax = gca;
ax.XGrid = 'off';
ax.YGrid = 'off';

%%