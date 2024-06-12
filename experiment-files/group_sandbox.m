clear all

saveplots = 0;

fp = figureparams;
%% compile
subs = {'S0004', 'S0005', 'S0007', 'S0015', 'S0019', 'S0108', 'S0070','S0122'};
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

       %% CM by validity
        validityNames = {'valid', 'neutral', 'invalid'};
        conditionNames = {'all contrasts', 'one target'};
        tilts = [-1 1 0];
        for iValid = 1:numel(Validities)
            for iTarget = 1:2
                for iStimID = 1:3 % CCW absent CW
                    for iResponse = 1:3
                        if tilts(iStimID)==0 % Target absent
                            idx = dataAll(iSub).target==iTarget & ~dataAll(iSub).targetContrast & Validities{iValid} & ~dataAll(iSub).eyeSkip;
                            idxNon = dataAll(iSub).nontarget==iTarget & ~dataAll(iSub).nonTargetContrast & Validities{iValid} & ~dataAll(iSub).eyeSkip;
                            idxOneTarg = dataAll(iSub).target==iTarget & ~dataAll(iSub).targetContrast & ~dataAll(iSub).eyeSkip & dataAll(iSub).T1Contrast~=dataAll(iSub).T2Contrast & Validities{iValid};
                            idxNonOneTarg = dataAll(iSub).nontarget==iTarget & ~dataAll(iSub).nonTargetContrast & ~dataAll(iSub).eyeSkip & dataAll(iSub).T1Contrast~=dataAll(iSub).T2Contrast & Validities{iValid};
                        else % Target present
                            idx = dataAll(iSub).target==iTarget & dataAll(iSub).targetTilt==tilts(iStimID) & dataAll(iSub).targetContrast & Validities{iValid} &  ~dataAll(iSub).eyeSkip;% & dataAll.T1Contrast~=dataAll.T2Contrast; % denominator; number of trials that meet this stimulus condition (CCW, CW, absent) and target (T1 or T2)
                            idxNon = dataAll(iSub).nontarget==iTarget & dataAll(iSub).nonTargetTilt==tilts(iStimID) & dataAll(iSub).nonTargetContrast & Validities{iValid} & ~dataAll(iSub).eyeSkip;
                            idxOneTarg = dataAll(iSub).target==iTarget & dataAll(iSub).targetTilt==tilts(iStimID) & dataAll(iSub).targetContrast & ~dataAll(iSub).eyeSkip & dataAll(iSub).T1Contrast~=dataAll(iSub).T2Contrast  & Validities{iValid};
                            idxNonOneTarg = dataAll(iSub).nontarget==iTarget & dataAll(iSub).nonTargetTilt==tilts(iStimID) & dataAll(iSub).nonTargetContrast & ~dataAll(iSub).eyeSkip & dataAll(iSub).T1Contrast~=dataAll(iSub).T2Contrast & Validities{iValid};
                        end
                        CM.n(iStimID,iResponse,iTarget) = size(dataAll(iSub).response(idx),2); % contains number of trials for each condition for target; each matrix corresponds to a target (T1 or T2), row 1: CCW, row 2: CW, row 3: abs
                        CM.response(iStimID,iResponse,iTarget) = size(dataAll(iSub).response(idx & dataAll(iSub).response==iResponse),2); % find in dataAll.response where the stimulus and the response match, contains number of trials for each response; each matrix corresponds to a target
                        CMprop.all.targ(iStimID,iResponse,iTarget) = CM.response(iStimID,iResponse,iTarget)/CM.n(iStimID,iResponse,iTarget);
                        CM.nNon(iStimID,iResponse,iTarget) = size(dataAll(iSub).response(idxNon),2); % contains number of trials for each condition for nontarget; each matrix corresponds to a target (T1 or T2), row 1: CCW, row 2: CW, row 3: abs
                        CM.responseNon(iStimID,iResponse,iTarget) = size(dataAll(iSub).response(idxNon & dataAll(iSub).response==iResponse),2); % find in dataAll.response where the stimulus and the response match, contains number of trials for each response; each matrix corresponds to a target
                        CMprop.all.nontarg(iStimID,iResponse,iTarget) = CM.responseNon(iStimID,iResponse,iTarget)/CM.nNon(iStimID,iResponse,iTarget);

                        CM.nOneTarg(iStimID,iResponse,iTarget) = size(dataAll(iSub).response(idxOneTarg),2); % contains number of trials for each one target condition for target ; each matrix corresponds to a target (T1 or T2), row 1: CCW, row 2: CW, row 3: abs
                        CM.responseOneTarg(iStimID,iResponse,iTarget) = size(dataAll(iSub).response(idxOneTarg & dataAll(iSub).response==iResponse),2); % find in dataAll.response where the stimulus and the response match, contains number of trials for each response; each matrix corresponds to a target
                        CMprop.one.targ(iStimID,iResponse,iTarget) = CM.responseOneTarg(iStimID,iResponse,iTarget)/CM.nOneTarg(iStimID,iResponse,iTarget);
                        CM.nNonOneTarg(iStimID,iResponse,iTarget) = size(dataAll(iSub).response(idxNonOneTarg),2); % contains number of trials for each one target condition for nontarget; each matrix corresponds to a target (T1 or T2), row 1: CCW, row 2: CW, row 3: abs
                        CM.responseNonOneTarg(iStimID,iResponse,iTarget) = size(dataAll(iSub).response(idxNonOneTarg & dataAll(iSub).response==iResponse),2); % find in dataAll.response where the stimulus and the response match, contains number of trials for each response; each matrix corresponds to a target
                        CMprop.one.nontarg(iStimID,iResponse,iTarget) = CM.responseNonOneTarg(iStimID,iResponse,iTarget)/CM.nNonOneTarg(iStimID,iResponse,iTarget);
                    end
                end
            end
            dataAll(iSub).CMV.(validityNames{iValid}) = CMprop;
        end
    end 
end 


TCMVIdx = 0;
NCMVIdx = 0;
validfieldnames = fieldnames(dataAll(iSub).CMV.valid); % gives "all" and "one"
for iCond = 1:2
    for iValid = 1:numel(Validities)
        for iSub = 1:length(subs)
            TCMVIdx = TCMVIdx + dataAll(iSub).CMV.(validityNames{iValid}).(validfieldnames{iCond}).targ;  % add each condition proporition across participants for target per condition (all contrast or one target) and validity
            NCMVIdx = NCMVIdx + dataAll(iSub).CMV.(validityNames{iValid}).(validfieldnames{iCond}).nontarg;% add each condition proporition across participants for nontarget per condition (all contrast or one target) and validity
        end
        TCMV.(validfieldnames{iCond}).(validityNames{iValid}) = TCMVIdx/length(subs);
        NCMV.(validfieldnames{iCond}).(validityNames{iValid}) = NCMVIdx/length(subs);
        TCMVIdx = 0;
        NCMVIdx = 0;
    end
end

% plot CM by attention
CMVfieldnames = fieldnames(TCMV.all);
for iCond = 1:2
    for iValidity = 1:numel(CMVfieldnames) % for validity
        CMVAll.TargetT1 = TCMV.(validfieldnames{iCond}).(validityNames{iValidity})(:,:,1);
        CMVAll.TargetT2 = TCMV.(validfieldnames{iCond}).(validityNames{iValidity})(:,:,2);
        CMVAll.TargetAll = (CMVAll.TargetT1 + CMVAll.TargetT2) / 2;
        CMVAll.NontargetT1 = NCMV.(validfieldnames{iCond}).(validityNames{iValidity})(:,:,1);
        CMVAll.NontargetT2 = NCMV.(validfieldnames{iCond}).(validityNames{iValidity})(:,:,2);
        CMVAll.NontargetAll = (CMVAll.NontargetT1 + CMVAll.NontargetT2) / 2;
        CMVAllfieldnames = fieldnames(CMVAll);
        figure();
        set(gcf,'Position',[100 100 1200 400])
        for iCM = 1:numel(CMVAllfieldnames)
            sgtitle(['ga ' conditionNames{iCond} ' ' validityNames{iValidity}]) % make so says valid, neutral, invalid, appropriately
            subplot(2,3,iCM)
            imagesc(CMVAll.(CMVAllfieldnames{iCM}))
            x = [1 2 3];
            y = [1 2 3];
            title([CMVAllfieldnames{iCM}])
            ylabel('stimulus')
            xlabel('response')
            set(gca, 'ytick', 1:1:3)
            set(gca, 'yticklabel', {'CCW', 'CW', 'absent'})
            set(gca, 'xtick', 1:1:3)
            set(gca, 'xticklabel', {'CCW', 'CW', 'absent'})
            colormap(gray)
            colorbar
            clim([0 1])
            hold on

        end
    end
end 
    if saveplots
         figTitle = sprintf('%s_CM_All_%s',...
             SID, datestr(now,'yymmdd'));
         saveas(gcf,sprintf('%s/%s', behDir, figTitle))
     end

 % plot valid-invalid by contrast condition
     for iCond = 1:2
         CMVAll.TargetT1 = T.(validfieldnames{iCond}).diff(:,:,1); % difference for target all/one condition for T1
         CMVAll.TargetT2 = T.(validfieldnames{iCond}).diff(:,:,2); % difference for target all/one condition for T2
         CMVAll.TargetAll = (CMVAll.TargetT1 + CMVAll.TargetT2) / 2; % difference for target all/one condition for all targets
         CMVAll.NontargetT1 = N.(validfieldnames{iCond}).diff(:,:,1);% difference for nontarget all/one condition for T1
         CMVAll.NontargetT2 = N.(validfieldnames{iCond}).diff(:,:,2);% difference for nontarget all/one condition for T2
         CMVAll.NontargetAll = (CMVAll.NontargetT1 + CMVAll.NontargetT2) / 2;  % difference for nontarget all/one condition for all targets
         CMVAllfieldnames = fieldnames(CMVAll);
         figure();
         set(gcf,'Position',[100 100 1200 400])
         for iCM = 1:numel(CMVAllfieldnames)
             sgtitle(['ga ' conditionNames{iCond} ' valid-invalid']) % make so says valid, neutral, invalid, appropriately
             subplot(2,3,iCM)
             imagesc(CMVAll.(CMVAllfieldnames{iCM}))
             x = [1 2 3];
             y = [1 2 3];
             title([CMVAllfieldnames{iCM}])
             ylabel('stimulus')
             xlabel('response')
             set(gca, 'ytick', 1:1:3)
             set(gca, 'yticklabel', {'CCW', 'CW', 'absent'})
             set(gca, 'xtick', 1:1:3)
             set(gca, 'xticklabel', {'CCW', 'CW', 'absent'})
             cd(exptDir)
             colormap(b2r(-0.2, 0.2))
             colorbar
             clim([-0.2 0.2])
             hold on

         end
     end
 
    if saveplots
         figTitle = sprintf('%s_CM_All_%s',...
             SID, datestr(now,'yymmdd'));
         saveas(gcf,sprintf('%s/%s', behDir, figTitle))
     end