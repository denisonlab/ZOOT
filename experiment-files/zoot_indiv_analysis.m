clear all

saveplots = 1;

fp = figureparams;

%% compile
subs = {'S0004'}; %, 'S0005', 'S0007', 'S0015', 'S0019', 'S0070', 'S0108', 'S0122'};
dataAll = [];


for iSub=1:length(subs) % for participant

    SID = subs{iSub};
    %iMac
    behDir = ['/Users/jennymotzer/Documents/GitHub/ZOOT/experiment-files/data/' SID '/beh/'];
    exptDir = '/Users/jennymotzer/Documents/GitHub/ZOOT/experiment-files/';
    % beh comp
    % behDir = ['/home/denisonlab-beh/Experiments/ZOOT/experiment-files/data' SID '/beh'];
    cd(behDir);
    fields = {'precue','target', 'T1Contrast', 'T2Contrast', 'targetContrast', 'T1Tilt', 'T2Tilt', 'targetTilt', 'seen', 'correct', 'response', 'correctDis', 'eyeSkip'}; % fieldnames(data);
    for iF = 1:numel(fields) % initialize
        dataAll.(fields{iF}) = [];
    end
    sessions = {'session1', 'session2'};
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
            blockNum = str2num(splitBlock(6:end)); % get highest block number per participant
            if blockNum > highestBlock
                highestBlock = blockNum;
            end
        end
        findFile = dir(sprintf('*block%d*.mat', highestBlock)); %find and load highest block number file per participant
        highestFileName = findFile.name;
        load(highestFileName)
        for iF = 1:numel(fields) % initialize
            if strcmp(fields{iF}, 'eyeSkip') == 1
                data.(fields{iF}) = data.(fields{iF})'; % transpose eyeSkip since it was made as one column instead of one row
            end
            dataAll.(fields{iF}) = [dataAll.(fields{iF}) data.(fields{iF})]; % compiles data structures from one participant
        end

    end

    % used for figure titles, if both session then full. if one session then
    % ses number
    if numel(sessions) > 1
        ses = 'full';
    elseif numel(sessions) == 1
        ses = sessions{1};
    end

    %% accuracy

    % get nontarget info
    contrasts = [1 0];
    tilts = [-1 1];
    dataAll.nonTargetContrast = [];
    dataAll.nontarget = [];
    dataAll.nonTargetTilt = [];
    for iNonTarget = 1:size(dataAll.targetContrast,2)
        if dataAll.target(iNonTarget) == 1
            dataAll.nontarget(iNonTarget) = 2;
            dataAll.nonTargetContrast(iNonTarget) = contrasts(dataAll.T2Contrast(iNonTarget));
            dataAll.nonTargetTilt(iNonTarget) = tilts(dataAll.T2Tilt(iNonTarget));
        elseif dataAll.target(iNonTarget) == 2
            dataAll.nontarget(iNonTarget) = 1;
            dataAll.nonTargetContrast(iNonTarget) = contrasts(dataAll.T1Contrast(iNonTarget));
            dataAll.nonTargetTilt(iNonTarget) = tilts(dataAll.T1Tilt(iNonTarget));
        end
    end

    for iTilt = 1:size(dataAll.target,2)
        if dataAll.targetContrast(iTilt) == 0
            dataAll.targetTilt(iTilt) = 0;
        end
        if dataAll.nonTargetContrast(iTilt) == 0
            dataAll.nonTargetTilt(iTilt) = 0;
        end
    end

    Valid = dataAll.precue == dataAll.target;
    Neutral = dataAll.precue == 3;
    Invalid = (dataAll.precue == 1| dataAll.precue == 2) & dataAll.precue ~= dataAll.target;

    % target/nontarget present/absent
    PresentPresent = dataAll.targetContrast == 1 & dataAll.nonTargetContrast == 1;
    PresentAbsent = dataAll.targetContrast == 1 & dataAll.nonTargetContrast == 0;
    AbsentPresent =dataAll.targetContrast == 0 & dataAll.nonTargetContrast == 1;
    AbsentAbsent = dataAll.targetContrast == 0 & dataAll.nonTargetContrast == 0;

    % sort data by contrast condition, validity, and target and get averages
    % per condition as matrices
    Validities = {Valid Neutral Invalid};
    contrastConds = {PresentPresent PresentAbsent AbsentPresent AbsentAbsent};
    for iTarget = 1:2 % for each target (1 or 2)
        for iContrastCond = 1:4 % for each contrast condition (PP, PA, AP, AA)
            for iValidity = 1:3 % for each precue validity (Valid, Neutral, Invalid)
                idx = dataAll.target == iTarget & Validities{iValidity} & contrastConds{iContrastCond} & ~dataAll.eyeSkip;
                Acc.n(iContrastCond, iValidity, iTarget) = size(dataAll.correct(idx),2); % denominator, number of trials per condition
                Acc.correct(iContrastCond, iValidity, iTarget) = size(dataAll.correct(idx & dataAll.correct==1),2); % numerator, number of trials that meet a certain rule (correct, seen, correctDis, RT)
                Acc.prop(iContrastCond, iValidity, iTarget) = Acc.correct(iContrastCond, iValidity, iTarget)/Acc.n(iContrastCond, iValidity, iTarget);
            end
        end
    end


    % figure();
    % sgtitle([SID ' ' ses])
    % for iF = 1:numel(contrastConds)
    %     subplot(2,2,iF)
    %     b = bar([Acc.prop(iF,:,1); Acc.prop(iF,:,2)]*100);
    %     condTitle = [{'target present/nontarget present'} {'target present/nontarget absent'} {'target absent/nontarget present'} {'target absent nontarget absent'}];
    %     title([condTitle{iF}])
    %     ylabel('accuracy %')
    %     ylim([30 100])
    %     set(gca, 'ytick', 30:10:100)
    %     set(gca, 'xticklabel', {'T1', 'T2'})
    %     ytickformat('percentage')
    %     hold on
    % end
    % 
    % if saveplots
    %     figTitle = sprintf('%s_%s',...
    %         'beh_acc',datestr(now,'yymmdd'));
    %     saveas(gcf,sprintf('%s/%s', behDir, figTitle))
    % end


    %% confusability map (all trials) for target
    % sort data by target/nontarget, stimulus (CCW, CW, absent), and response to create
    % heat maps for all conditions and one target conditions
    tilts = [-1 1 0];
    for iTarget = 1:2
        for iStimID = 1:3 % CCW absent CW
            for iResponse = 1:3
                if tilts(iStimID)==0 % Target absent
                    idx = dataAll.target==iTarget & ~dataAll.targetContrast & ~dataAll.eyeSkip;
                    idxNon = dataAll.nontarget==iTarget & ~dataAll.nonTargetContrast & ~dataAll.eyeSkip;
                    idxOneTarg = dataAll.target==iTarget & ~dataAll.targetContrast & ~dataAll.eyeSkip & dataAll.T1Contrast~=dataAll.T2Contrast;
                    idxNonOneTarg = dataAll.nontarget==iTarget & ~dataAll.nonTargetContrast & ~dataAll.eyeSkip & dataAll.T1Contrast~=dataAll.T2Contrast;
                else % Target present
                    idx = dataAll.target==iTarget & dataAll.targetTilt==tilts(iStimID) & dataAll.targetContrast & ~dataAll.eyeSkip;% & dataAll.T1Contrast~=dataAll.T2Contrast; % denominator; number of trials that meet this stimulus condition (CCW, CW, absent) and target (T1 or T2)
                    idxNon = dataAll.nontarget==iTarget & dataAll.nonTargetTilt==tilts(iStimID) & dataAll.nonTargetContrast & ~dataAll.eyeSkip;
                    idxOneTarg = dataAll.target==iTarget & dataAll.targetTilt==tilts(iStimID) & dataAll.targetContrast & ~dataAll.eyeSkip & dataAll.T1Contrast~=dataAll.T2Contrast;
                    idxNonOneTarg = dataAll.nontarget==iTarget & dataAll.nonTargetTilt==tilts(iStimID) & dataAll.nonTargetContrast & ~dataAll.eyeSkip & dataAll.T1Contrast~=dataAll.T2Contrast;
                end
                CM.n(iStimID,iResponse,iTarget) = size(dataAll.response(idx),2); % contains number of trials for each condition for target; each matrix corresponds to a target (T1 or T2), row 1: CCW, row 2: CW, row 3: abs
                CM.response(iStimID,iResponse,iTarget) = size(dataAll.response(idx & dataAll.response==iResponse),2); % find in dataAll.response where the stimulus and the response match, contains number of trials for each response; each matrix corresponds to a target
                CM.prop(iStimID,iResponse,iTarget) = CM.response(iStimID,iResponse,iTarget)/CM.n(iStimID,iResponse,iTarget);
                CM.nNon(iStimID,iResponse,iTarget) = size(dataAll.response(idxNon),2); % contains number of trials for each condition for nontarget; each matrix corresponds to a target (T1 or T2), row 1: CCW, row 2: CW, row 3: abs
                CM.responseNon(iStimID,iResponse,iTarget) = size(dataAll.response(idxNon & dataAll.response==iResponse),2); % find in dataAll.response where the stimulus and the response match, contains number of trials for each response; each matrix corresponds to a target
                CM.propNon(iStimID,iResponse,iTarget) = CM.responseNon(iStimID,iResponse,iTarget)/CM.nNon(iStimID,iResponse,iTarget);

                CM.nOneTarg(iStimID,iResponse,iTarget) = size(dataAll.response(idxOneTarg),2); % contains number of trials for each one target condition for target ; each matrix corresponds to a target (T1 or T2), row 1: CCW, row 2: CW, row 3: abs
                CM.responseOneTarg(iStimID,iResponse,iTarget) = size(dataAll.response(idxOneTarg & dataAll.response==iResponse),2); % find in dataAll.response where the stimulus and the response match, contains number of trials for each response; each matrix corresponds to a target
                CM.propOneTarg(iStimID,iResponse,iTarget) = CM.responseOneTarg(iStimID,iResponse,iTarget)/CM.nOneTarg(iStimID,iResponse,iTarget);
                CM.nNonOneTarg(iStimID,iResponse,iTarget) = size(dataAll.response(idxNonOneTarg),2); % contains number of trials for each one target condition for nontarget; each matrix corresponds to a target (T1 or T2), row 1: CCW, row 2: CW, row 3: abs
                CM.responseNonOneTarg(iStimID,iResponse,iTarget) = size(dataAll.response(idxNonOneTarg & dataAll.response==iResponse),2); % find in dataAll.response where the stimulus and the response match, contains number of trials for each response; each matrix corresponds to a target
                CM.propNonOneTarg(iStimID,iResponse,iTarget) = CM.responseNonOneTarg(iStimID,iResponse,iTarget)/CM.nNonOneTarg(iStimID,iResponse,iTarget);
            end
        end
    end

    % get proportions for all conditions by T1, T2, and both targets collapsed
    CMAll.TargetT1 = CM.prop(:,:,1);
    CMAll.TargetT2 = CM.prop(:,:,2);
    CMAll.TargetAll = (CMAll.TargetT1 + CMAll.TargetT2) / 2;
    CMAll.NontargetT1 = CM.propNon(:,:,1);
    CMAll.NontargetT2 = CM.propNon(:,:,2);
    CMAll.NontargetAll = (CMAll.NontargetT1 + CMAll.NontargetT2) / 2;

    % get proportions for one target conditions by T1, T2, and both targets collapsed
    CMOneT.TargetT1 = CM.propOneTarg(:,:,1);
    CMOneT.TargetT2 = CM.propOneTarg(:,:,2);
    CMOneT.TargetAll = (CMOneT.TargetT1 + CMOneT.TargetT2) / 2;
    CMOneT.NontargetT1 = CM.propNonOneTarg(:,:,1);
    CMOneT.NontargetT2 = CM.propNonOneTarg(:,:,2);
    CMOneT.NontargetAll = (CMOneT.NontargetT1 + CMOneT.NontargetT2) / 2;


    CMAllfieldnames = fieldnames(CMAll);
    CMOneTfieldnames = fieldnames(CMOneT);
    figure();
    set(gcf,'Position',[100 100 1200 400])
    sgtitle([SID ' confusability maps - all conditions'])
    % for iF = 1:numel(CMAllfieldnames) % fix later so dynamic
    %     subplot(2,3,iF)
    %     imagesc(CMAll.(CMAllfieldnames{iF}))
    %     x = [1 2 3];
    %     y = [1 2 3];
    %     title([CMAllfieldnames{iF}])
    %     ylabel('stimulus')
    %     xlabel('response')
    %     set(gca, 'ytick', 1:1:3)
    %     set(gca, 'yticklabel', {'CCW', 'CW', 'absent'})
    %     set(gca, 'xtick', 1:1:3)
    %     set(gca, 'xticklabel', {'CCW', 'CW', 'absent'})
    %     colormap(gray)
    %     colorbar
    %     clim([0 1])
    %     hold on
    % 
    % end
    % if saveplots
    %     figTitle = sprintf('%s_CM_All_%s',...
    %         SID, datestr(now,'yymmdd'));
    %     saveas(gcf,sprintf('%s/%s', behDir, figTitle))
    % end
    % 
    % figure();
    % set(gcf,'Position',[100 100 1200 400])
    % sgtitle([SID ' confusability maps - one target conditions'])
    % for iF = 1:numel(CMOneTfieldnames) % fix later so dynamic
    %     subplot(2,3,iF)
    %     imagesc(CMOneT.(CMOneTfieldnames{iF}))
    %     x = [1 2 3];
    %     y = [1 2 3];
    %     title([CMOneTfieldnames{iF}])
    %     ylabel('stimulus')
    %     xlabel('response')
    %     set(gca, 'ytick', 1:1:3)
    %     set(gca, 'yticklabel', {'CCW', 'CW', 'absent'})
    %     set(gca, 'xtick', 1:1:3)
    %     set(gca, 'xticklabel', {'CCW', 'CW', 'absent'})
    %     colormap(gray)
    %     colorbar
    %     clim([0 1])
    %     hold on
    % 
    % end
    % if saveplots
    %     figTitle = sprintf('%s_CM_OneTarget_%s',...
    %         SID,datestr(now,'yymmdd'));
    %     saveas(gcf,sprintf('%s/%s', behDir, figTitle))
    % end

    %% SDT
    %detection
    cd(exptDir);
    nhDet = dataAll.seen == 1 & dataAll.targetContrast == 1;
    nfDet = dataAll.seen == 1 & dataAll.targetContrast == 0;
    nsignalDet = dataAll.targetContrast == 1;
    nnoiseDet = dataAll.targetContrast == 0;
    Det = {nhDet nfDet nsignalDet nnoiseDet};
    for iValid = 1:numel(Validities)
        for iDet = 1:numel(Det)
            detIdx = Validities{iValid} & Det{iDet} & ~dataAll.eyeSkip;
            SDT.det(iValid, iDet) = sum(detIdx);
        end
    end

    dp = [];
    c = [];
    for iValid = 1:numel(Validities)
        nh = SDT.det(iValid,1);
        nfa = SDT.det(iValid,2);
        nsignal = SDT.det(iValid,3);
        nnoise = SDT.det(iValid,4);
        [dprime, criterion] = rd_dprime2(nh,nfa,nsignal,nnoise);
        SDT.dprimeDet(iValid) = [dp dprime];
        SDT.criterionDet(iValid) = [c criterion];
    end

    % figure();
    % b = bar(SDT.criterionDet);
    % title([SID ' detection criterion'])
    % ylabel('c')
    % % ylim([30 100])
    % set(gca, 'ytick')
    % set(gca, 'xticklabel', {'V', 'N', 'I'})
    % 
    % figure();
    % b = bar(SDT.dprimeDet);
    % title([SID ' detection dprime'])
    % ylabel("d'")
    % % ylim([30 100])
    % set(gca, 'ytick')
    % set(gca, 'xticklabel', {'V', 'N', 'I'})


    %discrimination - only present present and present absent (only trials
    %with tilted targets
    nhDis = dataAll.correctDis == 1 & dataAll.targetTilt == 1;
    nfDis = dataAll.correctDis == 0 & dataAll.targetTilt == 1;
    nsignalDis = dataAll.targetTilt == 1;
    nnoiseDis = dataAll.targetTilt == -1;
    Dis = {nhDis nfDis nsignalDis nnoiseDis};
     for iTarget = 1:2
        for iValid = 1:numel(Validities)
            for iDis = 1:numel(Dis)
                disPPIdx = Validities{iValid} & Dis{iDis} & PresentPresent & dataAll.target == iTarget & ~dataAll.eyeSkip;
                SDT.disPP(iTarget, iValid, iDis) = sum(disPPIdx);
                disPAIdx = Validities{iValid} & Dis{iDis} & PresentAbsent & dataAll.target == iTarget & ~dataAll.eyeSkip;
                SDT.disPA(iTarget, iValid, iDis) = sum(disPAIdx);
            end
        end
     end

    dp = [];
    c = [];
    for iTarget = 1:2
        for iValid = 1:numel(Validities)
            nh = SDT.disPP(iTarget,iValid,1);
            nfa = SDT.disPP(iTarget,iValid,2);
            nsignal = SDT.disPP(iTarget,iValid,3);
            nnoise = SDT.disPP(iTarget,iValid,4);
            [dprime, criterion] = rd_dprime2(nh,nfa,nsignal,nnoise);
            disd.dprimePP(iTarget, iValid) = [dp dprime];
            disc.criterionPP(iTarget, iValid) = [c criterion];

             nh = SDT.disPA(iTarget,iValid,1);
            nfa = SDT.disPA(iTarget,iValid,2);
            nsignal = SDT.disPA(iTarget,iValid,3);
            nnoise = SDT.disPA(iTarget,iValid,4);
            [dprime, criterion] = rd_dprime2(nh,nfa,nsignal,nnoise);
            disd.dprimePA(iTarget, iValid) = [dp dprime];
            disc.criterionPA(iTarget, iValid) = [c criterion];
        end
    end
 dprimefieldnames = fieldnames(disd);
    critfieldnames = fieldnames(disc);
    figure();
    sgtitle([SID "discrimination d' and c"])
    for iF = 1:numel(dprimefieldnames)
        subplot(2,2,iF)
        b = bar(disd.(dprimefieldnames{iF}));
        title([dprimefieldnames{iF}])
        ylabel("d'")
        % ylim([30 100])
        set(gca, 'ytick')
        set(gca, 'xticklabel', {'T1', 'T2'})
    end
    hold on

    for iF = 1:numel(critfieldnames)
        subplot(2,2,iF+2)
        b = bar(disc.(critfieldnames{iF}));
        title([critfieldnames{iF}])
        ylabel('c')
        % ylim([30 100])
        set(gca, 'ytick')
        set(gca, 'xticklabel', {'T1', 'T2'})
    end

end
    
   