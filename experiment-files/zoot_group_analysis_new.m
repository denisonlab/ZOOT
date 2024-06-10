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
        % highestTime = '0000';
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

        %% accuracy

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

        % sort data by contrast condition, validity, and target and get averages
        % per condition as matrices
        Validities = {Valid Neutral Invalid};
        contrastConds = {PresentPresent PresentAbsent AbsentPresent AbsentAbsent};
        for iTarget = 1:2 % for each target (1 or 2)
            for iContrastCond = 1:4 % for each contrast condition (PP, PA, AP, AA)
                for iValidity = 1:3 % for each precue validity (Valid, Neutral, Invalid)
                    idx = dataAll(iSub).target == iTarget & Validities{iValidity} & contrastConds{iContrastCond} & ~dataAll(iSub).eyeSkip;
                    Acc.n(iContrastCond, iValidity, iTarget) = size(dataAll(iSub).correct(idx),2); % denominator, number of trials per condition
                    Acc.correct(iContrastCond, iValidity, iTarget) = size(dataAll(iSub).correct(idx & dataAll(iSub).correct==1),2); % numerator, number of trials that meet a certain rule (correct, seen, correctDis, RT)
                    Acc.prop(iContrastCond, iValidity, iTarget) = Acc.correct(iContrastCond, iValidity, iTarget)/Acc.n(iContrastCond, iValidity, iTarget);
                end
            end
        end


        %% confusability map (all trials) for target
        % sort data by target/nontarget, stimulus (CCW, CW, absent), and response to create
        % heat maps for all conditions and one target conditions
        tilts = [-1 1 0];
        for iTarget = 1:2
            for iStimID = 1:3 % CCW absent CW
                for iResponse = 1:3
                    if tilts(iStimID)==0 % Target absent
                        idx = dataAll(iSub).target==iTarget & ~dataAll(iSub).targetContrast & ~dataAll(iSub).eyeSkip;
                        idxNon = dataAll(iSub).nontarget==iTarget & ~dataAll(iSub).nonTargetContrast & ~dataAll(iSub).eyeSkip;
                        idxOneTarg = dataAll(iSub).target==iTarget & ~dataAll(iSub).targetContrast & ~dataAll(iSub).eyeSkip & dataAll(iSub).T1Contrast~=dataAll(iSub).T2Contrast;
                        idxNonOneTarg = dataAll(iSub).nontarget==iTarget & ~dataAll(iSub).nonTargetContrast & ~dataAll(iSub).eyeSkip & dataAll(iSub).T1Contrast~=dataAll(iSub).T2Contrast;
                    else % Target present
                        idx = dataAll(iSub).target==iTarget & dataAll(iSub).targetTilt==tilts(iStimID) & dataAll(iSub).targetContrast & ~dataAll(iSub).eyeSkip;% & dataAll.T1Contrast~=dataAll.T2Contrast; % denominator; number of trials that meet this stimulus condition (CCW, CW, absent) and target (T1 or T2)
                        idxNon = dataAll(iSub).nontarget==iTarget & dataAll(iSub).nonTargetTilt==tilts(iStimID) & dataAll(iSub).nonTargetContrast & ~dataAll(iSub).eyeSkip;
                        idxOneTarg = dataAll(iSub).target==iTarget & dataAll(iSub).targetTilt==tilts(iStimID) & dataAll(iSub).targetContrast & ~dataAll(iSub).eyeSkip & dataAll(iSub).T1Contrast~=dataAll(iSub).T2Contrast;
                        idxNonOneTarg = dataAll(iSub).nontarget==iTarget & dataAll(iSub).nonTargetTilt==tilts(iStimID) & dataAll(iSub).nonTargetContrast & ~dataAll(iSub).eyeSkip & dataAll(iSub).T1Contrast~=dataAll(iSub).T2Contrast;
                    end
                    CM.n(iStimID,iResponse,iTarget) = size(dataAll(iSub).response(idx),2); % contains number of trials for each condition for target; each matrix corresponds to a target (T1 or T2), row 1: CCW, row 2: CW, row 3: abs
                    CM.response(iStimID,iResponse,iTarget) = size(dataAll(iSub).response(idx & dataAll(iSub).response==iResponse),2); % find in dataAll.response where the stimulus and the response match, contains number of trials for each response; each matrix corresponds to a target
                    CM.prop(iStimID,iResponse,iTarget) = CM.response(iStimID,iResponse,iTarget)/CM.n(iStimID,iResponse,iTarget);
                    CM.nNon(iStimID,iResponse,iTarget) = size(dataAll(iSub).response(idxNon),2); % contains number of trials for each condition for nontarget; each matrix corresponds to a target (T1 or T2), row 1: CCW, row 2: CW, row 3: abs
                    CM.responseNon(iStimID,iResponse,iTarget) = size(dataAll(iSub).response(idxNon & dataAll(iSub).response==iResponse),2); % find in dataAll.response where the stimulus and the response match, contains number of trials for each response; each matrix corresponds to a target
                    CM.propNon(iStimID,iResponse,iTarget) = CM.responseNon(iStimID,iResponse,iTarget)/CM.nNon(iStimID,iResponse,iTarget);

                    CM.nOneTarg(iStimID,iResponse,iTarget) = size(dataAll(iSub).response(idxOneTarg),2); % contains number of trials for each one target condition for target ; each matrix corresponds to a target (T1 or T2), row 1: CCW, row 2: CW, row 3: abs
                    CM.responseOneTarg(iStimID,iResponse,iTarget) = size(dataAll(iSub).response(idxOneTarg & dataAll(iSub).response==iResponse),2); % find in dataAll.response where the stimulus and the response match, contains number of trials for each response; each matrix corresponds to a target
                    CM.propOneTarg(iStimID,iResponse,iTarget) = CM.responseOneTarg(iStimID,iResponse,iTarget)/CM.nOneTarg(iStimID,iResponse,iTarget);
                    CM.nNonOneTarg(iStimID,iResponse,iTarget) = size(dataAll(iSub).response(idxNonOneTarg),2); % contains number of trials for each one target condition for nontarget; each matrix corresponds to a target (T1 or T2), row 1: CCW, row 2: CW, row 3: abs
                    CM.responseNonOneTarg(iStimID,iResponse,iTarget) = size(dataAll(iSub).response(idxNonOneTarg & dataAll(iSub).response==iResponse),2); % find in dataAll.response where the stimulus and the response match, contains number of trials for each response; each matrix corresponds to a target
                    CM.propNonOneTarg(iStimID,iResponse,iTarget) = CM.responseNonOneTarg(iStimID,iResponse,iTarget)/CM.nNonOneTarg(iStimID,iResponse,iTarget);
                end
            end
        end

     SDT = [nhDet nfDet nsignalDet nnoiseDet]
     for iContrast = 1:numel(contrastConds)
         for iValid = 1:nume(Validities)
             for 


    end
    dataAll(iSub).means = Acc.prop*100; % save each participant's mean data in dataAll
    dataAll(iSub).CM_tAllProp= CM.prop;
    dataAll(iSub).CM_nAllProp= CM.propNon;
    dataAll(iSub).CM_tOneProp= CM.propOneTarg;
    dataAll(iSub).CM_nOneProp= CM.propNonOneTarg;

    dataAll(iSub).nsignalDet = dataAll(iSub).targetContrast == 1 & ~dataAll(iSub).eyeSkip; % target present
    dataAll(iSub).nnoiseDet = dataAll(iSub).targetContrast == 0 & ~dataAll(iSub).eyeSkip; % target absent
    dataAll(iSub).nhDet = dataAll(iSub).seen==1 & dataAll(iSub).targetContrast == 1 & ~dataAll(iSub).eyeSkip; % hits (seen and present)
    dataAll(iSub).nfaDet = dataAll(iSub).seen==1 & dataAll(iSub).targetContrast == 0 & ~dataAll(iSub).eyeSkip; % false alarms (seen and absent)
end

%% get means and standard error

accIdx = []; % used to collect each position of the matrix (each condition) by participant into a list to perform std and mean, then create new matrices for std, mean, and error
cmTIdx = []; % used to collect proportion of response to condition for all and one target conditions by T1, T2, and both targets collpased
cmNIdx = [];
cm1TIdx = [];
cm1NIdx = [];
for iContrast = 1:numel(contrastConds)
    for iValid = 1:numel(Validities)
        for iTarget = 1:2
            for iSub = 1:length(subs)
                accIdx = [accIdx dataAll(iSub).means(iContrast,iValid,iTarget)]; % collects the accuracy of each condition by each participant into a list so can do group analysis 
            end
            Acc.std(iContrast,iValid,iTarget) = std(accIdx);
            Acc.mean(iContrast, iValid, iTarget) = mean(accIdx);
            Acc.err(iContrast,iValid,iTarget) = Acc.std(iContrast,iValid,iTarget)/sqrt(size(dataAll,2));
            accIdx = [];
        end
    end
end

for iStimID = 1:3
    for iResponse = 1:3
        for iTarget = 1:2
            for iSub = 1:length(subs)
                cmTIdx = [cmTIdx dataAll(iSub).CM_tAllProp(iStimID, iResponse, iTarget)];
                cmNIdx = [cmNIdx dataAll(iSub).CM_nAllProp(iStimID, iResponse, iTarget)];
                cm1TIdx = [cm1TIdx dataAll(iSub).CM_tOneProp(iStimID, iResponse, iTarget)];
                cm1NIdx = [cm1NIdx dataAll(iSub).CM_nOneProp(iStimID, iResponse, iTarget)];
            end
            CM.allTprop(iStimID, iResponse, iTarget) = mean(cmTIdx);
            CM.allNprop(iStimID, iResponse, iTarget) = mean(cmNIdx);
            CM.oneTprop(iStimID, iResponse, iTarget) = mean(cm1TIdx);
            CM.oneNprop(iStimID, iResponse, iTarget) = mean(cm1NIdx);
            cmTIdx = [];
            cmNIdx = [];
            cm1TIdx = [];
            cm1NIdx = [];
        end
    end
end

 
%% SDT - detection
cd(exptDir)

nh = 0;
nfa = 0;
nsignal = 0;
nnoise = 0;
for iSub = 1:length(iSub)
    nh = nh + sum(dataAll(iSub).nhDet);
    nfa = nfa + sum(dataAll(iSub).nfaDet);
    nsignal = sum(nsignal + dataAll(iSub).nsignalDet);
    nnoise = sum(nnoise + dataAll(iSub).nnoiseDet);
end 

[dprime, criterion] = rd_dprime2(nh,nfa,nsignal,nnoise);
dprimeDet = dprime;
criterionDet = criterion;

%% SDT - discrimination
cd(exptDir)

nh = 0;
nfa = 0;
nsignal = 0;
nnoise = 0;
for iSub = 1:length(iSub)
    nh = nh + sum(dataAll(iSub).nhDet);
    nfa = nfa + sum(dataAll(iSub).nfaDet);
    nsignal = sum(nsignal + dataAll(iSub).nsignalDet);
    nnoise = sum(nnoise + dataAll(iSub).nnoiseDet);
end 

[dprime, criterion] = rd_dprime2(nh,nfa,nsignal,nnoise);
dprimeDet = dprime;
criterionDet = criterion;


%% figures
%% figure 1 - target presence x validity x target

figure();
sgtitle('ga accuracy')
for iF = 1:numel(contrastConds)
    subplot(2,2,iF)
    b = bar([Acc.mean(iF,:,1); Acc.mean(iF,:,2)]);
    hold on
    for k = 1:numel(b)      % code to align error bars to grouped subplot bar coordinate, revised from stack exchange   % Recent MATLAB Versions
        xtips = b(k).XEndPoints;
        ytips = b(k).YEndPoints;
        errorbar(xtips,ytips,Acc.err(iF,k), '.k', 'MarkerSize',0.1)
    end
    hold off
    condTitle = [{'target present/nontarget present'} {'target present/nontarget absent'} {'target absent/nontarget present'} {'target absent/nontarget absent'}];
    title([condTitle{iF}])
    ylabel('accuracy %')
    ylim([30 100])
    set(gca, 'ytick', 30:10:100)
    set(gca, 'xticklabel', {'T1', 'T2'})
    ytickformat('percentage')
    hold on
end
legend('Valid', 'Neutral', 'Invalid')
legend('Location', 'best')
% lgd.Layout.Tile = 'eastoutside';
ax = gca;
ax.XGrid = 'off';
ax.YGrid = 'off';

if saveplots
    figTitle = sprintf('%s_%s',...
        'beh_acc',datestr(now,'yymmdd'));
    saveas(gcf,sprintf('%s/%s', behDir, figTitle))
end



%% fig 2 + 3 - confusability maps for all conditions and one target conditions
% get proportions for all conditions by T1, T2, and both targets collapsed
CMAll.TargetT1 = CM.allTprop(:,:,1); 
CMAll.TargetT2 = CM.allTprop(:,:,2); 
CMAll.TargetAll = (CMAll.TargetT1 + CMAll.TargetT2) / 2;
CMAll.NontargetT1 = CM.allNprop(:,:,1); 
CMAll.NontargetT2 = CM.allNprop(:,:,2); 
CMAll.NontargetAll = (CMAll.NontargetT1 + CMAll.NontargetT2) / 2;

% get proportions for one target conditions by T1, T2, and both targets collapsed
CMOneT.TargetT1 = CM.oneTprop(:,:,1); 
CMOneT.TargetT2 = CM.oneTprop(:,:,2); 
CMOneT.TargetAll = (CMOneT.TargetT1 + CMOneT.TargetT2) / 2;
CMOneT.NontargetT1 = CM.oneNprop(:,:,1); 
CMOneT.NontargetT2 = CM.oneNprop(:,:,2); 
CMOneT.NontargetAll = (CMOneT.NontargetT1 + CMOneT.NontargetT2) / 2;


CMAllfieldnames = fieldnames(CMAll);
CMOneTfieldnames = fieldnames(CMOneT);
figure();
set(gcf,'Position',[100 100 1200 400])
sgtitle('ga confusability maps - all conditions')
for iF = 1:numel(CMAllfieldnames) % fix later so dynamic
    subplot(2,3,iF)
    imagesc(CMAll.(CMAllfieldnames{iF}))
    x = [1 2 3];
    y = [1 2 3];
    title([CMAllfieldnames{iF}])
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
if saveplots
    figTitle = sprintf('%s_CM_All_%s',...
        SID, datestr(now,'yymmdd'));
    saveas(gcf,sprintf('%s/%s', behDir, figTitle))
end

figure();
set(gcf,'Position',[100 100 1200 400])
sgtitle( 'ga confusability maps - one target conditions')
for iF = 1:numel(CMOneTfieldnames) % fix later so dynamic
    subplot(2,3,iF)
    imagesc(CMOneT.(CMOneTfieldnames{iF}))
    x = [1 2 3];
    y = [1 2 3];
    title([CMOneTfieldnames{iF}])
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
if saveplots
    figTitle = sprintf('%s_CM_OneTarget_%s',...
        SID,datestr(now,'yymmdd'));
    saveas(gcf,sprintf('%s/%s', behDir, figTitle))
end

 
