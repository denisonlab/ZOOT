clear all

saveplots = 0;

% Make figure style
fp = figureparams;

addpath('/Users/jennymotzer/Documents/GitHub/ZOOT/experiment-files/functions/')
addpath('/Users/jennymotzer/Documents/GitHub/kt-utils')
addpath('/Users/jennymotzer/Documents/GitHub/ZOOT/stats')


%% 
% Figure directory 
figType = 'png'; % svg pdf eps
figDir = sprintf('groupFigs'); 
if ~exist(figDir, 'dir')
    mkdir(figDir)
end

%% compile
subs = {'S0004', 'S0005', 'S0007', 'S0013', 'S0015', 'S0018', 'S0019', 'S0070', 'S0071', 'S0085', 'S0105', 'S0108', 'S0111', 'S0122', 'S0133'};
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
    fields = {'precue','target', 'T1Contrast', 'T2Contrast', 'T1Tilt', 'T2Tilt', 'targetTilt', 'targetContrast', 'seen', 'correct', 'response', 'correctDis', 'session', 'timeTargetRT', 'eyeSkip'}; % fieldnames(data);
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
        dataAll(iSub).NTcorrect = [];
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

        % get accuracy of reporting nontarget (swapping)
        for iResponse = 1:size(dataAll(iSub).response,2)
            if dataAll(iSub).correct(iResponse) == 0
                if dataAll(iSub).nonTargetContrast(iResponse) == 1
                    if dataAll(iSub).nonTargetTilt(iResponse) == -1 && dataAll(iSub).response(iResponse) == 1
                        dataAll(iSub).NTcorrect(iResponse) = 1;
                    elseif dataAll(iSub).nonTargetTilt(iResponse) == 1 && dataAll(iSub).response(iResponse) == 2
                        dataAll(iSub).NTcorrect(iResponse) = 1;
                    end
                elseif dataAll(iSub).nonTargetContrast(iResponse) == 0
                    if dataAll(iSub).response(iResponse) == 3
                        dataAll(iSub).NTcorrect(iResponse) = 1;
                    end
                end
            elseif dataAll(iSub).correct(iResponse) == 1
                dataAll(iSub).NTcorrect(iResponse) = 0;
            elseif isnan(dataAll(iSub).correct(iResponse))
                dataAll(iSub).NTcorrect(iResponse) = NaN;
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
        contrastConds = {PresentPresent AbsentPresent PresentAbsent AbsentAbsent};


    end % session end

        %% accuracy to target

        % sort data by contrast condition, validity, and target and get averages
        % per condition as matrices
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
    


        dataAll(iSub).means = Acc.prop*100; % save each participant's mean data in dataAll

         %% accuracy to nontarget

        % sort data by contrast condition, validity, and target and get averages
        % per condition as matrices
        for inonTarget = 1:2 % for each target (1 or 2)
            for iContrastCond = 1:4 % for each contrast condition (PP, PA, AP, AA)
                for iValidity = 1:3 % for each precue validity (Valid, Neutral, Invalid)
                    idx = dataAll(iSub).nontarget == inonTarget & Validities{iValidity} & contrastConds{iContrastCond} & ~dataAll(iSub).eyeSkip;
                    ntAcc.n(iContrastCond, iValidity, inonTarget) = size(dataAll(iSub).NTcorrect(idx),2); % denominator, number of trials per condition
                    ntAcc.correct(iContrastCond, iValidity, inonTarget) = size(dataAll(iSub).NTcorrect(idx & dataAll(iSub).NTcorrect==1),2); % numerator, number of trials that meet a certain rule (correct, seen, correctDis, RT)
                    ntAcc.prop(iContrastCond, iValidity, inonTarget) = ntAcc.correct(iContrastCond, iValidity, inonTarget)/ntAcc.n(iContrastCond, iValidity, inonTarget);
                end
            end
        end
        
        % reverse nontarget 1 and nontarget 2 to align with target 1 and
        % target 2 (aligns T1 with NT2 and T2 with NT 1)
        ntAcc.rev_prop(:,:,1) = ntAcc.prop(:,:,2);
        ntAcc.rev_prop(:,:,2) = ntAcc.prop(:,:,1);

        dataAll(iSub).NTAccmeans = ntAcc.rev_prop*100; % save each participant's mean data in dataAll


        %% accuracy collapsed across contrast (target by validity)

    % sort data by contrast condition, validity, and target and get averages
    % per condition as matrices
    for iTarget = 1:2 % for each target (1 or 2)
        % for iContrastCond = 1:4 % for each contrast condition (PP, PA, AP, AA)
        for iValidity = 1:3 % for each precue validity (Valid, Neutral, Invalid)
            idx = dataAll(iSub).target == iTarget & Validities{iValidity} & ~dataAll(iSub).eyeSkip;
            AccAll.n(iTarget, iValidity) = size(dataAll(iSub).correct(idx),2); % denominator, number of trials per condition
            AccAll.correct(iTarget, iValidity) = size(dataAll(iSub).correct(idx & dataAll(iSub).correct==1),2); % numerator, number of trials that meet a certain rule (correct, seen, correctDis, RT)
            AccAll.prop(iTarget, iValidity) = AccAll.correct(iTarget, iValidity)/AccAll.n(iTarget, iValidity);
        end
    end



    dataAll(iSub).meansAll = AccAll.prop*100; % save each participant's mean data in dataAll

            %% accuracy by target contrast 

        % sort data by contrast condition, validity, and target and get averages
        % per condition as matrices
        targContrast = [1 0]; % present, absent
        for iTarget = 1:2 % for each target (1 or 2)
            for iContrast = 1:2 % for each target contrast (present, absent)
                for iValidity = 1:3 % for each precue validity (Valid, Neutral, Invalid)
                    idx = dataAll(iSub).target == iTarget & Validities{iValidity} & dataAll(iSub).targetContrast == targContrast(iContrast) & ~dataAll(iSub).eyeSkip;
                    tcAcc.n(iContrast, iValidity, iTarget) = size(dataAll(iSub).correct(idx),2); % denominator, number of trials per condition
                    tcAcc.correct(iContrast, iValidity, iTarget) = size(dataAll(iSub).correct(idx & dataAll(iSub).correct==1),2); % numerator, number of trials that meet a certain rule (correct, seen, correctDis, RT)
                    tcAcc.prop(iContrast, iValidity, iTarget) = tcAcc.correct(iContrast, iValidity, iTarget)/tcAcc.n(iContrast, iValidity, iTarget);
                end
            end
        end
    


        dataAll(iSub).targetContrast_means = tcAcc.prop*100; % save each participant's mean data in dataAll



            %% accuracy by nontarget contrast 

        % sort data by contrast condition, validity, and target and get averages
        % per condition as matrices
        nontargContrast = [1 0]; % present, absent
        for iTarget = 1:2 % for each target (1 or 2)
            for iContrast = 1:2 % for each target contrast (present, absent)
                for iValidity = 1:3 % for each precue validity (Valid, Neutral, Invalid)
                    idx = dataAll(iSub).target == iTarget & Validities{iValidity} & dataAll(iSub).nonTargetContrast == nontargContrast(iContrast) & ~dataAll(iSub).eyeSkip;
                    ntcAcc.n(iContrast, iValidity, iTarget) = size(dataAll(iSub).correct(idx),2); % denominator, number of trials per condition
                    ntcAcc.correct(iContrast, iValidity, iTarget) = size(dataAll(iSub).correct(idx & dataAll(iSub).correct==1),2); % numerator, number of trials that meet a certain rule (correct, seen, correctDis, RT)
                    ntcAcc.prop(iContrast, iValidity, iTarget) = ntcAcc.correct(iContrast, iValidity, iTarget)/ntcAcc.n(iContrast, iValidity, iTarget);
                end
            end
        end
    


        dataAll(iSub).nonTargetContrast_means = ntcAcc.prop*100; % save each participant's mean data in dataAll
          %% det accuracy

    % sort data by contrast condition, validity, and target and get averages
    % per condition as matrices

    for iTarget = 1:2 % for each target (1 or 2)
        for iContrastCond = 1:4 % for each contrast condition (PP, PA, AP, AA)
            for iValidity = 1:3 % for each precue validity (Valid, Neutral, Invalid)
                pIdx = dataAll(iSub).target == iTarget & Validities{iValidity} & contrastConds{iContrastCond} & dataAll(iSub).targetContrast == 1 & ~dataAll(iSub).eyeSkip; % index for finding relevant trials for the denominator of each condition
                dAcc.pN(iContrastCond, iValidity, iTarget) = size(find(pIdx),2); % denominator, number of trials per condition
                dAcc.pSeen(iContrastCond, iValidity, iTarget) = size(dataAll(iSub).seen(pIdx & dataAll(iSub).seen==1),2); % numerator, number of trials that meet a certain rule (correct, seen, correctDis, RT)
                dAcc.pProp(iContrastCond, iValidity, iTarget) = dAcc.pSeen(iContrastCond, iValidity, iTarget)/dAcc.pN(iContrastCond, iValidity, iTarget);

                aIdx = dataAll(iSub).target == iTarget & Validities{iValidity} & contrastConds{iContrastCond} & dataAll(iSub).targetContrast == 0 & ~dataAll(iSub).eyeSkip;
                dAcc.aN(iContrastCond, iValidity, iTarget) = size(find(aIdx),2); % denominator, number of trials per condition
                dAcc.aSeen(iContrastCond, iValidity, iTarget) = size(dataAll(iSub).seen(aIdx & dataAll(iSub).seen==0),2); % numerator, number of trials that meet a certain rule (correct, seen, correctDis, RT)
                dAcc.aProp(iContrastCond, iValidity, iTarget) = dAcc.aSeen(iContrastCond, iValidity, iTarget)/dAcc.aN(iContrastCond, iValidity, iTarget);
            end
        end
    end

    dAcc.prop = [dAcc.pProp(1,:,:); dAcc.pProp(3,:,:);dAcc.aProp(2,:,:);dAcc.aProp(4,:,:)]; % combines arrays that show accuracy for detecting target when present (tp/np, tp/na) and when absent (ta/np, ta/na) to give a 4 x 3 x 2 array
    NP = mean([dAcc.pProp(1,:,:);dAcc.aProp(2,:,:)]);
    NA = mean([dAcc.pProp(3,:,:);dAcc.aProp(4,:,:)]);
    dAccNT.prop = [NP; NA];

    dataAll(iSub).meansDet = dAcc.prop*100; % save each participant's mean data in dataAll
    dataAll(iSub).meansDetNT = dAccNT.prop*100;


         %% det accuracy with on target present trials

    % sort data by contrast condition, validity, and target and get averages
    % per condition as matrices

    for iTarget = 1:2 % for each target (1 or 2)
        for iContrastCond = 1:3 % for each contrast condition (PP, PA)
            for iValidity = 1:3 % for each precue validity (Valid, Neutral, Invalid)
                pIdx = dataAll(iSub).target == iTarget & Validities{iValidity} & contrastConds{iContrastCond} & dataAll(iSub).targetContrast == 1 & ~dataAll(iSub).eyeSkip; % index for finding relevant trials for the denominator of each condition
                dtpAcc.N(iContrastCond, iValidity, iTarget) = size(find(pIdx),2); % denominator, number of trials per condition
                dtpAcc.Seen(iContrastCond, iValidity, iTarget) = size(dataAll(iSub).seen(pIdx & dataAll(iSub).seen==1),2); % numerator, number of trials that meet a certain rule (correct, seen, correctDis, RT)
                dtpAcc.Prop(iContrastCond, iValidity, iTarget) = dtpAcc.Seen(iContrastCond, iValidity, iTarget)/dtpAcc.N(iContrastCond, iValidity, iTarget);
            end
        end
    end

    dtpAccNT.prop = [dtpAcc.Prop(1,:,:); dtpAcc.Prop(3,:,:)];
    dataAll(iSub).meansDetTPNT = dtpAccNT.prop*100;

      %% RT

        % sort data by contrast condition, validity, and target and get averages
        % per condition as matrices
        for iTarget = 1:2 % for each target (1 or 2)
            for iContrastCond = 1:4 % for each contrast condition (PP, PA, AP, AA)
                for iValidity = 1:3 % for each precue validity (Valid, Neutral, Invalid)
                    idx = dataAll(iSub).target == iTarget & Validities{iValidity} & contrastConds{iContrastCond} & ~dataAll(iSub).eyeSkip;
                    RT.n(iContrastCond, iValidity, iTarget) = size(dataAll(iSub).timeTargetRT(idx),2); % denominator, number of trials per condition
                    RT.timeTargetRT(iContrastCond, iValidity, iTarget) = mean(dataAll(iSub).timeTargetRT(idx)); % numerator, number of trials that meet a certain rule (correct, seen, correctDis, RT)
                end
            end
        end

    dataAll(iSub).RTmeans = RT.timeTargetRT;



        %% confusability map (all trials) for target
        % sort data by target/nontarget, stimulus (CCW, CW, absent), and response to create
        % heat maps for all conditions and one target conditions
        tilts = [-1 1 0];
        for iTarget = 1:2
            for iStimID = 1:3 % CCW absent CW
                for iResponse = 1:3
                    if tilts(iStimID)==0 % Target/nontarget absent
                        idx = dataAll(iSub).target==iTarget & ~dataAll(iSub).targetContrast & ~dataAll(iSub).eyeSkip;
                        idxNon = dataAll(iSub).nontarget==iTarget & ~dataAll(iSub).nonTargetContrast & ~dataAll(iSub).eyeSkip; %find when nontarget == iTarget and nontarget absent 
                        idxOneTarg = dataAll(iSub).target==iTarget & ~dataAll(iSub).targetContrast & ~dataAll(iSub).eyeSkip & dataAll(iSub).T1Contrast~=dataAll(iSub).T2Contrast;
                        idxNonOneTarg = dataAll(iSub).nontarget==iTarget & ~dataAll(iSub).nonTargetContrast & ~dataAll(iSub).eyeSkip & dataAll(iSub).T1Contrast~=dataAll(iSub).T2Contrast;
                    else % Target/nontarget present
                        idx = dataAll(iSub).target==iTarget & dataAll(iSub).targetTilt==tilts(iStimID) & dataAll(iSub).targetContrast & ~dataAll(iSub).eyeSkip;% & dataAll.T1Contrast~=dataAll.T2Contrast; % denominator; number of trials that meet this stimulus condition (CCW, CW, absent) and target (T1 or T2)
                        idxNon = dataAll(iSub).nontarget==iTarget & dataAll(iSub).nonTargetTilt==tilts(iStimID) & dataAll(iSub).nonTargetContrast & ~dataAll(iSub).eyeSkip; %find when nontarget == iTarget and nontarget present 
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

      % CM by validity
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




        dataAll(iSub).means = Acc.prop*100; % save each participant's mean data in dataAll
        dataAll(iSub).CM_tAllProp= CM.prop;
        dataAll(iSub).CM_nAllProp= CM.propNon;
        dataAll(iSub).CM_tOneProp= CM.propOneTarg;
        dataAll(iSub).CM_nOneProp= CM.propNonOneTarg;

        dataAll(iSub).nsignalDet = dataAll(iSub).targetContrast == 1 & ~dataAll(iSub).eyeSkip; % target present
        dataAll(iSub).nnoiseDet = dataAll(iSub).targetContrast == 0 & ~dataAll(iSub).eyeSkip; % target absent
        dataAll(iSub).nhDet = dataAll(iSub).seen==1 & dataAll(iSub).targetContrast == 1 & ~dataAll(iSub).eyeSkip; % hits (seen and present)
        dataAll(iSub).nfaDet = dataAll(iSub).seen==1 & dataAll(iSub).targetContrast == 0 & ~dataAll(iSub).eyeSkip; % false alarms (seen and absent)
        
        
    %% SDT detection nontarget - across cueing conditions
    nhDet = dataAll(iSub).seen == 1 & dataAll(iSub).targetContrast == 1; % hit: seen and present
    nfaDet = dataAll(iSub).seen == 1 & dataAll(iSub).targetContrast == 0; % fa: seen and absent
    nsignalDet = dataAll(iSub).targetContrast == 1; % signal: present
    nnoiseDet = dataAll(iSub).targetContrast == 0; % noise: absent
    Det = {nhDet nfaDet nsignalDet nnoiseDet};

    % indices for all conditions based on target, validity, SDT variable -
    % returns which contains data for all, nontarget present, non target absent. each of these contains condition data for nh nfa
    % nsignal and  nnoise 
    for iTarget =1:2
        for iValid = 1:numel(Validities)
            for iDet = 1:numel(Det)
                detAllIdx = Validities{iValid} & Det{iDet} & dataAll(iSub).target == iTarget & ~dataAll(iSub).eyeSkip; % find all T1 and T2 
                det.all(iTarget, iValid, iDet) = sum(detAllIdx);
                detNTPIdx = Validities{iValid} & Det{iDet} & dataAll(iSub).target == iTarget & dataAll(iSub).nonTargetContrast == 1 & ~dataAll(iSub).eyeSkip; % find all T1 when T2 present and all T2 when T1 present
                det.nontargetPresent(iTarget, iValid, iDet) = sum(detNTPIdx);
                detNTAIdx = Validities{iValid} & Det{iDet} & dataAll(iSub).target == iTarget & dataAll(iSub).nonTargetContrast == 0 & ~dataAll(iSub).eyeSkip; % find all T1 when T2 absent nd all T2 when T1 absent
                det.nontargetAbsent(iTarget, iValid, iDet) = sum(detNTAIdx);
            end
        end
    end

    % calculate dprime and c per condition, detd/c.all, nontargetPresent,
    % nontargetAbsent for valid, neutral, and invalid for T1 and T2 
    dp = [];
    c = [];
    Detfieldnames = fieldnames(det);
    for iTarget = 1:2
        for iValid = 1:numel(Validities)
            for iF = 1:numel(Detfieldnames)
                dataAll(iSub).detNH.(Detfieldnames{iF})(iTarget,iValid) = det.(Detfieldnames{iF})(iTarget,iValid,1);
                dataAll(iSub).detNFA.(Detfieldnames{iF})(iTarget,iValid) = det.(Detfieldnames{iF})(iTarget,iValid,2);
                dataAll(iSub).detNSignal.(Detfieldnames{iF})(iTarget,iValid) = det.(Detfieldnames{iF})(iTarget,iValid,3);
                dataAll(iSub).detNNoise.(Detfieldnames{iF})(iTarget,iValid) = det.(Detfieldnames{iF})(iTarget,iValid,4);
                [dprime, criterion] = kt_dprime2(dataAll(iSub).detNH.(Detfieldnames{iF})(iTarget,iValid), dataAll(iSub).detNFA.(Detfieldnames{iF})(iTarget,iValid), dataAll(iSub).detNSignal.(Detfieldnames{iF})(iTarget,iValid), dataAll(iSub).detNNoise.(Detfieldnames{iF})(iTarget,iValid),1);
                dataAll(iSub).detd.(Detfieldnames{iF})(iTarget,iValid) = [dp dprime]; % store d prime
                dataAll(iSub).detc.(Detfieldnames{iF})(iTarget,iValid) = [c criterion]; % store c
            end
        end
    end

    %% SDT discrimination target - across cueing conditions 
    nhDis = dataAll(iSub).correctDis == 1 & dataAll(iSub).targetTilt == 1;
    nfaDis = dataAll(iSub).correctDis == 0 & dataAll(iSub).targetTilt == -1;
    nsignalDis = dataAll(iSub).targetContrast == 1 & dataAll(iSub).seen == 1 & dataAll(iSub).targetTilt == 1;
    nnoiseDis = dataAll(iSub).targetContrast == 1 & dataAll(iSub).seen == 1 & dataAll(iSub).targetTilt == -1;
    Dis = {nhDis nfaDis nsignalDis nnoiseDis};
    %indices for all conditions based on target, validity, SDT variable
    for iTarget =1:2
        for iValid = 1:numel(Validities)
            for iDis = 1:numel(Dis)
                disAllIdx = Validities{iValid} & Dis{iDis} & dataAll(iSub).target == iTarget & ~dataAll(iSub).eyeSkip; % find all T1 and T2
                dis.all(iTarget, iValid, iDis) = sum(disAllIdx);
                disNTPIdx = Validities{iValid} & Dis{iDis} & dataAll(iSub).target == iTarget & dataAll(iSub).nonTargetContrast == 1 & ~dataAll(iSub).eyeSkip; % find all T1 when T2 present and all T2 when T1 present
                dis.nontargetPresent(iTarget, iValid, iDis) = sum(disNTPIdx);
                disNTAIdx = Validities{iValid} & Dis{iDis} & dataAll(iSub).target == iTarget & dataAll(iSub).nonTargetContrast == 0 & ~dataAll(iSub).eyeSkip; % find all T1 when T2 absent nd all T2 when T1 absent
                dis.nontargetAbsent(iTarget, iValid, iDis) = sum(disNTAIdx);
            end
        end
    end

    % calculate dprime and c per condition
    dp = [];
    c = [];
    Disfieldnames = fieldnames(dis);
    for iTarget = 1:2
        for iValid = 1:numel(Validities)
            for iF = 1:numel(Disfieldnames)
                dataAll(iSub).nhDis.(Disfieldnames{iF})(iTarget,iValid) = dis.(Disfieldnames{iF})(iTarget,iValid,1);
                dataAll(iSub).nfaDis.(Disfieldnames{iF})(iTarget,iValid) = dis.(Disfieldnames{iF})(iTarget,iValid,2);
                dataAll(iSub).nsignalDis.(Disfieldnames{iF})(iTarget,iValid) = dis.(Disfieldnames{iF})(iTarget,iValid,3);
                dataAll(iSub).nnoiseDis.(Disfieldnames{iF})(iTarget,iValid) = dis.(Disfieldnames{iF})(iTarget,iValid,4);
                [dprime, criterion] = kt_dprime2(dataAll(iSub).nhDis.(Disfieldnames{iF})(iTarget,iValid), dataAll(iSub).nfaDis.(Disfieldnames{iF})(iTarget,iValid), dataAll(iSub).nsignalDis.(Disfieldnames{iF})(iTarget,iValid), dataAll(iSub).nnoiseDis.(Disfieldnames{iF})(iTarget,iValid),1);
                dataAll(iSub).disd.(Disfieldnames{iF})(iTarget,iValid) = [dp dprime]; % store d prime
                dataAll(iSub).disc.(Disfieldnames{iF})(iTarget,iValid) = [c criterion]; % store c
            end
        end
    end

      %% SDT detection nontarget VARIABLES
    nhDet = dataAll(iSub).seen == 1 & dataAll(iSub).targetContrast == 1; % hit: seen and present
    nfaDet = dataAll(iSub).seen == 1 & dataAll(iSub).targetContrast == 0; % fa: seen and absent
    nsignalDet = dataAll(iSub).targetContrast == 1; % signal: present
    nnoiseDet = dataAll(iSub).targetContrast == 0; % noise: absent
    % Det = {nhDet nfaDet nsignalDet nnoiseDet};

    % indices for all conditions based on target, validity, SDT variable -
    % returns which contains data for all, nontarget present, non target absent. each of these contains condition data for nh nfa
    % nsignal and  nnoise
    for iContrast = 1:numel(contrastConds)
        for iTarget =1:2
            for iValid = 1:numel(Validities)
                    detNHIdx = Validities{iValid} & nhDet & dataAll(iSub).target == iTarget & contrastConds{iContrast} & ~dataAll(iSub).eyeSkip; % find all T1 and T2
                    dataAll(iSub).detnh(iContrast, iValid, iTarget) = sum(detNHIdx);
                    detNFAIdx = Validities{iValid} & nfaDet & dataAll(iSub).target == iTarget & contrastConds{iContrast} & ~dataAll(iSub).eyeSkip; % find all T1 and T2
                    dataAll(iSub).detnfa(iContrast, iValid, iTarget) = sum(detNFAIdx);
                    detNSignalIdx = Validities{iValid} & nsignalDet & dataAll(iSub).target == iTarget & contrastConds{iContrast} & ~dataAll(iSub).eyeSkip; % find all T1 and T2
                    dataAll(iSub).detnsignal(iContrast, iValid, iTarget) = sum(detNSignalIdx);
                    detNNoiseIdx = Validities{iValid} & nnoiseDet & dataAll(iSub).target == iTarget & contrastConds{iContrast} & ~dataAll(iSub).eyeSkip; % find all T1 and T2
                    dataAll(iSub).detnnoise(iContrast, iValid, iTarget) = sum(detNNoiseIdx);
            end
        end
    end
    %% detection nontarget - collapsed cueing conditions
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
            detColl.all(iTarget, iDet) = sum(detAllIdx);
            detNTPIdx = Det{iDet} & dataAll(iSub).target == iTarget & dataAll(iSub).nonTargetContrast == 1 & ~dataAll(iSub).eyeSkip; % find all T1 when T2 present and all T2 when T1 present
            detColl.nontargetPresent(iTarget, iDet) = sum(detNTPIdx);
            detNTAIdx = Det{iDet} & dataAll(iSub).target == iTarget & dataAll(iSub).nonTargetContrast == 0 & ~dataAll(iSub).eyeSkip; % find all T1 when T2 absent nd all T2 when T1 absent
            detColl.nontargetAbsent(iTarget, iDet) = sum(detNTAIdx);
        end
    end

    % calculate dprime and c per condition, detd/c.all, nontargetPresent,
    % nontargetAbsent for valid, neutral, and invalid for T1 and T2
    dp = [];
    c = [];
    Detfieldnames = fieldnames(det);
    for iTarget = 1:2
        for iF = 1:numel(Detfieldnames)
            dataAll(iSub).detNHColl.(Detfieldnames{iF})(1, iTarget) = detColl.(Detfieldnames{iF})(iTarget,1);
            dataAll(iSub).detNFAColl.(Detfieldnames{iF})(1, iTarget) = detColl.(Detfieldnames{iF})(iTarget,2);
            dataAll(iSub).detNSignalColl.(Detfieldnames{iF})(1, iTarget) = detColl.(Detfieldnames{iF})(iTarget,3);
            dataAll(iSub).detNNoiseColl.(Detfieldnames{iF})(1, iTarget) = detColl.(Detfieldnames{iF})(iTarget,4);
            [dprime, criterion] = kt_dprime2(dataAll(iSub).detNHColl.(Detfieldnames{iF})(1, iTarget), dataAll(iSub).detNFAColl.(Detfieldnames{iF})(1, iTarget), dataAll(iSub).detNSignalColl.(Detfieldnames{iF})(1, iTarget), dataAll(iSub).detNNoiseColl.(Detfieldnames{iF})(1, iTarget),1);
            dataAll(iSub).detdColl.(Detfieldnames{iF})(1, iTarget) = [dp dprime]; % store d prime
            dataAll(iSub).detcColl.(Detfieldnames{iF})(1, iTarget) = [c criterion]; % store c
        end
    end

    %% discrimination nontarget- collapsed cueing conditions
    nhDis = dataAll(iSub).correctDis == 1 & dataAll(iSub).targetTilt == 1;
    nfaDis = dataAll(iSub).correctDis == 0 & dataAll(iSub).targetTilt == -1;
    nsignalDis = dataAll(iSub).targetContrast == 1 & dataAll(iSub).seen == 1 & dataAll(iSub).targetTilt == 1;
    nnoiseDis = dataAll(iSub).targetContrast == 1 & dataAll(iSub).seen == 1 & dataAll(iSub).targetTilt == -1;
    Dis = {nhDis nfaDis nsignalDis nnoiseDis};
    %indices for all conditions based on target, validity, SDT variable
    for iTarget =1:2
        for iDis = 1:numel(Dis)
            disAllIdx =Dis{iDis} & dataAll(iSub).target == iTarget & ~dataAll(iSub).eyeSkip; % find all T1 and T2
            disColl.all(iTarget, iDis) = sum(disAllIdx);
            disNTPIdx = Dis{iDis} & dataAll(iSub).target == iTarget & dataAll(iSub).nonTargetContrast == 1 & ~dataAll(iSub).eyeSkip; % find all T1 when T2 present and all T2 when T1 present
            disColl.nontargetPresent(iTarget, iDis) = sum(disNTPIdx);
            disNTAIdx = Dis{iDis} & dataAll(iSub).target == iTarget & dataAll(iSub).nonTargetContrast == 0 & ~dataAll(iSub).eyeSkip; % find all T1 when T2 absent nd all T2 when T1 absent
            disColl.nontargetAbsent(iTarget, iDis) = sum(disNTAIdx);
        end
    end

    % calculate dprime and c per condition
    dp = [];
    c = [];
    Disfieldnames = fieldnames(dis);
    for iTarget = 1:2
        for iF = 1:numel(Disfieldnames)
            dataAll(iSub).nhDisColl.(Disfieldnames{iF})(1,iTarget) = disColl.(Disfieldnames{iF})(iTarget,1);
            dataAll(iSub).nfaDisColl.(Disfieldnames{iF})(1,iTarget) = disColl.(Disfieldnames{iF})(iTarget,2);
            dataAll(iSub).nsignalDisColl.(Disfieldnames{iF})(1,iTarget) = disColl.(Disfieldnames{iF})(iTarget,3);
            dataAll(iSub).nnoiseDisColl.(Disfieldnames{iF})(1,iTarget) = disColl.(Disfieldnames{iF})(iTarget,4);
            [dprime, criterion] = kt_dprime2(dataAll(iSub).nhDisColl.(Disfieldnames{iF})(1,iTarget), dataAll(iSub).nfaDisColl.(Disfieldnames{iF})(1,iTarget), dataAll(iSub).nsignalDisColl.(Disfieldnames{iF})(1,iTarget), dataAll(iSub).nnoiseDisColl.(Disfieldnames{iF})(1,iTarget),1);
            dataAll(iSub).disdColl.(Disfieldnames{iF})(1,iTarget) = [dp dprime]; % store d prime
            dataAll(iSub).discColl.(Disfieldnames{iF})(1,iTarget) = [c criterion]; % store c
        end
    end
end % subject end 

%% get means and standard error

accIdx = []; % used to collect each position of the matrix (each condition) by participant into a list to perform std and mean, then create new matrices for std, mean, and error
cmTIdx = []; % used to collect proportion of response to condition for all and one target conditions by T1, T2, and both targets collpased
cmNIdx = [];
cm1TIdx = [];
cm1NIdx = [];
contrasts = [{'PP'}, {'AP'}, {'PA'}, {'AA'}];
for iContrast = 1:numel(contrastConds)
    for iValid = 1:numel(Validities)
        for iTarget = 1:2
            for iSub = 1:length(subs)
                accIdx = [accIdx dataAll(iSub).means(iContrast,iValid,iTarget)]; % collects the accuracy of each condition by each participant into a list so can do group analysis 
                Acc_scatterplot.(contrasts{iContrast})(iValid,iSub,iTarget) = dataAll(iSub).means(iContrast,iValid,iTarget);
            end
            Acc.std(iContrast,iValid,iTarget) = std(accIdx); % finds std of the accuracy of each condition for each participant
            Acc.mean(iContrast, iValid, iTarget) = mean(accIdx); % finds means of accuracy for each condition for each participant
            Acc.err(iContrast,iValid,iTarget) = Acc.std(iContrast,iValid,iTarget)/sqrt(size(dataAll,2)); % calculate error for each condition 
            accIdx = [];
        end
    end
end


% matrix
T1x = repmat([0.7778 1 1.2222],4,1);
T2x = repmat([1.7778 2 2.2222],4,1);
xcoords = cat(3, T1x,T2x);
T1x_scatter = repmat([0.7778; 1; 1.2222], 1, 15);
T2x_scatter = repmat([1.7778; 2; 2.2222], 1, 15);
xcoords_scatter = cat(3, T1x_scatter, T2x_scatter);

%% get means and standard error - accuracy collasped across contrasts 

accIdx = []; % used to collect each position of the matrix (each condition) by participant into a list to perform std and mean, then create new matrices for std, mean, and error
for iValidity = 1:numel(Validities)
    for iTarget = 1:2
        for iSub = 1:length(subs)
            accIdx = [accIdx dataAll(iSub).meansAll(iTarget, iValidity)]; % collects the accuracy of each condition by each participant into a list so can do group analysis
            % Acc_scatterplot(iTarget, iValidity) = dataAll(iSub).meansAll(iTarget, iValidity);
        end
        AccAll.std(iTarget, iValidity) = std(accIdx); % finds std of the accuracy of each condition for each participant
        AccAll.mean(iTarget, iValidity) = mean(accIdx); % finds means of accuracy for each condition for each participant
        AccAll.err(iTarget, iValidity) = AccAll.std(iTarget, iValidity)/sqrt(size(dataAll,2)); % calculate error for each condition
        accIdx = [];
    end
end


%% accuracy of nontarget (swapping)

accIdx = []; % used to collect each position of the matrix (each condition) by participant into a list to perform std and mean, then create new matrices for std, mean, and error
contrasts = [{'PP'}, {'AP'}, {'PA'}, {'AA'}];
for iContrast = 1:numel(contrastConds)
    for iValid = 1:numel(Validities)
        for inonTarget = 1:2
            for iSub = 1:length(subs)
                accIdx = [accIdx dataAll(iSub).NTAccmeans(iContrast,iValid,inonTarget)]; % collects the accuracy of each condition by each participant into a list so can do group analysis 
                Acc_scatterplot.(contrasts{iContrast})(iValid,iSub,inonTarget) = dataAll(iSub).NTAccmeans(iContrast,iValid,inonTarget);
            end
            Acc.NTstd(iContrast,iValid,inonTarget) = std(accIdx); % finds std of the accuracy of each condition for each participant
            Acc.NTmean(iContrast, iValid, inonTarget) = mean(accIdx); % finds means of accuracy for each condition for each participant
            Acc.NTerr(iContrast,iValid,inonTarget) = Acc.NTstd(iContrast,iValid,inonTarget)/sqrt(size(dataAll,2)); % calculate error for each condition 
            accIdx = [];
        end
    end
end


%% percent swapping error - what percent of error is due to swapping

accIdx = []; % used to collect each position of the matrix (each condition) by participant into a list to perform std and mean, then create new matrices for std, mean, and error
error = [];
accNTIdx = [];
swapError = [];
for iTarget = 1:2
    for iContrast = 1:4
        for iValidity = 1:3
            for iSub = 1:15
                accIdx = [accIdx 100-dataAll(iSub).means(iContrast, iValidity, iTarget)]; % get each participant's accuracy to target for each condition, subtract it from 100 to get % error
                accNTIdx = [accNTIdx dataAll(iSub).NTAccmeans(iContrast,iValidity,iTarget)]; % get each participant's accuracy to nontarget for each condition
                swapError = [swapError ((accNTIdx(iSub)/accIdx(iSub))*100)]; % find what percent of error is due to swap for each participant for each condition
                if isnan(swapError(iSub))
                    swapError(iSub) = 0;
                end 
            end
            Err.std(iContrast, iValidity, iTarget) = std(swapError);
            Err.mean(iContrast, iValidity, iTarget) = mean(swapError);
            Err.err(iContrast, iValidity, iTarget) = Err.std(iContrast, iValidity, iTarget)/sqrt(size(dataAll,2));
            accIdx = []; 
            error = [];
            accNTIdx = [];
            swapError = [];
        end
    end
end

%% target contrast accuracy means and error
accIdx = []; % used to collect each position of the matrix (each condition) by participant into a list to perform std and mean, then create new matrices for std, mean, and error
for iContrast = 1:2
    for iValid = 1:numel(Validities)
        for iTarget = 1:2
            for iSub = 1:length(subs)
                accIdx = [accIdx dataAll(iSub).targetContrast_means(iContrast,iValid,iTarget)]; % collects the accuracy of each condition by each participant into a list so can do group analysis 
                % tcAcc_scatterplot(iValid,iSub,iTarget) = dataAll(iSub).targetContrast_means(iContrast,iValid,iTarget);
            end
            tcAcc.std(iContrast,iValid,iTarget) = std(accIdx); % finds std of the accuracy of each condition for each participant
            tcAcc.mean(iContrast, iValid, iTarget) = mean(accIdx); % finds means of accuracy for each condition for each participant
            tcAcc.err(iContrast,iValid,iTarget) = tcAcc.std(iContrast,iValid,iTarget)/sqrt(size(dataAll,2)); % calculate error for each condition 
            accIdx = [];
        end
    end
end

%% nontarget contrast accuracy means and error
accIdx = []; % used to collect each position of the matrix (each condition) by participant into a list to perform std and mean, then create new matrices for std, mean, and error
for iContrast = 1:2
    for iValid = 1:numel(Validities)
        for iTarget = 1:2
            for iSub = 1:length(subs)
                accIdx = [accIdx dataAll(iSub).nonTargetContrast_means(iContrast,iValid,iTarget)]; % collects the accuracy of each condition by each participant into a list so can do group analysis 
                % tcAcc_scatterplot(iValid,iSub,iTarget) = dataAll(iSub).targetContrast_means(iContrast,iValid,iTarget);
            end
            ntcAcc.std(iContrast,iValid,iTarget) = std(accIdx); % finds std of the accuracy of each condition for each participant
            ntcAcc.mean(iContrast, iValid, iTarget) = mean(accIdx); % finds means of accuracy for each condition for each participant
            ntcAcc.err(iContrast,iValid,iTarget) = ntcAcc.std(iContrast,iValid,iTarget)/sqrt(size(dataAll,2)); % calculate error for each condition 
            accIdx = [];
        end
    end
end


%% RT means

rtIdx = []; % used to collect each position of the matrix (each condition) by participant into a list to perform std and mean, then create new matrices for std, mean, and error

for iContrast = 1:numel(contrastConds)
    for iValid = 1:numel(Validities)
        for iTarget = 1:2
            for iSub = 1:length(subs)
                rtIdx = [rtIdx dataAll(iSub).RTmeans(iContrast,iValid,iTarget)]; % collects the accuracy of each condition by each participant into a list so can do group analysis 
                RT_scatterplot.(contrasts{iContrast})(iValid,iSub,iTarget) = dataAll(iSub).RTmeans(iContrast,iValid,iTarget);
            end
            RT.std(iContrast,iValid,iTarget) = std(rtIdx); % finds std of the accuracy of each condition for each participant
            RT.mean(iContrast, iValid, iTarget) = mean(rtIdx); % finds means of accuracy for each condition for each participant
            RT.err(iContrast,iValid,iTarget) = RT.std(iContrast,iValid,iTarget)/sqrt(size(dataAll,2)); % calculate error for each condition 
            rtIdx = [];
        end
    end
end


%% find mean for CM by target for all contrast conditions and one target
% conditions
for iStimID = 1:3
    for iResponse = 1:3
        for iTarget = 1:2
            for iSub = 1:length(subs)
                cmTIdx = [cmTIdx dataAll(iSub).CM_tAllProp(iStimID, iResponse, iTarget)]; % all contrasts, target
                cmNIdx = [cmNIdx dataAll(iSub).CM_nAllProp(iStimID, iResponse, iTarget)]; % all contrast, nontarget
                cm1TIdx = [cm1TIdx dataAll(iSub).CM_tOneProp(iStimID, iResponse, iTarget)]; % one target, target
                cm1NIdx = [cm1NIdx dataAll(iSub).CM_nOneProp(iStimID, iResponse, iTarget)]; % one target, nontarget
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

%% det accuracy 
 dAccIdx = []; % used to collect each position of the matrix (each condition) by participant into a list to perform std and mean, then create new matrices for std, mean, and error
for iContrast = 1:4
    for iValid = 1:3
        for iTarget = 1:2
            for iSub = 1:length(subs)
                dAccIdx = [dAccIdx dataAll(iSub).meansDet(iContrast,iValid,iTarget)]; % collects the accuracy of each condition by each participant into a list so can do group analysis
            end
            dAcc.std(iContrast,iValid,iTarget) = std(dAccIdx); % finds std of the accuracy of each condition for each participant
            dAcc.mean(iContrast, iValid, iTarget) = mean(dAccIdx); % finds means of accuracy for each condition for each participant
            dAcc.err(iContrast,iValid,iTarget) = dAcc.std(iContrast,iValid,iTarget)/sqrt(size(dataAll,2)); % calculate error for each condition
            dAccIdx = [];
        end
    end
end

dAccNTIdx = [];
for iValid = 1:3
    for iTarget = 1:2
        for iPresence = 1:2
            for iSub = 1:length(subs)
                dAccNTIdx = [dAccNTIdx dataAll(iSub).meansDetNT(iPresence,iValid,iTarget)]; % collects the accuracy of each condition by each participant into a list so can do group analysis
            end
            dAccNT.std(iPresence,iValid,iTarget) = std(dAccNTIdx); % finds std of the accuracy of each condition for each participant
            dAccNT.mean(iPresence,iValid,iTarget)= mean(dAccNTIdx); % finds means of accuracy for each condition for each participant
            dAccNT.err(iPresence,iValid,iTarget) = dAccNT.std(iPresence,iValid,iTarget)/sqrt(size(dataAll,2)); % calculate error for each condition
            dAccNTIdx = [];
        end
    end
end

%% det accuracy with target present trials only

dtpAccNTIdx = [];
for iValid = 1:3
    for iTarget = 1:2
        for iPresence = 1:2
            for iSub = 1:length(subs)
                dtpAccNTIdx = [dtpAccNTIdx dataAll(iSub).meansDetTPNT(iPresence,iValid,iTarget)]; % collects the accuracy of each condition by each participant into a list so can do group analysis
            end
            dtpAccNT.std(iPresence,iValid,iTarget) = std(dtpAccNTIdx); % finds std of the accuracy of each condition for each participant
            dtpAccNT.mean(iPresence,iValid,iTarget)= mean(dtpAccNTIdx); % finds means of accuracy for each condition for each participant
            dtpAccNT.err(iPresence,iValid,iTarget) = dtpAccNT.std(iPresence,iValid,iTarget)/sqrt(size(dataAll,2)); % calculate error for each condition
            dtpAccNTIdx = [];
        end
    end
end
 
 %% SDT across cueing conditions
 % mean, std, err for dprime and c for dis and det
 dprimeDetIdx = [];
 cDetIdx = [];
 dprimeDisIdx = [];
 cDisIdx = [];
 for iTarget = 1:2
     for iF = 1:numel(Detfieldnames)
         for iValid = 1:numel(Validities)
             for iSub = 1:length(subs)
                 dprimeDetIdx = [dprimeDetIdx dataAll(iSub).detd.(Detfieldnames{iF})(iTarget,iValid)];
                 detd_scatterplot.(Detfieldnames{iF})(iValid, iSub, iTarget) = dataAll(iSub).detd.(Detfieldnames{iF})(iTarget,iValid);
                 cDetIdx = [cDetIdx dataAll(iSub).detc.(Detfieldnames{iF})(iTarget,iValid)];
                 detc_scatterplot.(Detfieldnames{iF})(iValid, iSub, iTarget) = dataAll(iSub).detc.(Detfieldnames{iF})(iTarget,iValid);
                 dprimeDisIdx = [dprimeDisIdx dataAll(iSub).disd.(Detfieldnames{iF})(iTarget,iValid)];
                 disd_scatterplot.(Detfieldnames{iF})(iValid, iSub, iTarget) = dataAll(iSub).disd.(Detfieldnames{iF})(iTarget,iValid);
                 cDisIdx = [cDisIdx dataAll(iSub).disc.(Detfieldnames{iF})(iTarget,iValid)];
                 disc_scatterplot.(Detfieldnames{iF})(iValid, iSub, iTarget) = dataAll(iSub).disc.(Detfieldnames{iF})(iTarget,iValid);

             end
             detdStd.(Detfieldnames{iF})(iTarget, iValid) = std(dprimeDetIdx);
             detd.(Detfieldnames{iF})(iTarget, iValid) = mean(dprimeDetIdx);
             detdErr.(Detfieldnames{iF})(iTarget, iValid) = detdStd.(Detfieldnames{iF})(iTarget,iValid)/sqrt(length(subs));
             detcStd.(Detfieldnames{iF})(iTarget, iValid) = std(cDetIdx);
             detc.(Detfieldnames{iF})(iTarget, iValid) = mean(cDetIdx);
             detcErr.(Detfieldnames{iF})(iTarget, iValid) = detcStd.(Detfieldnames{iF})(iTarget,iValid)/sqrt(length(subs));

             disdStd.(Disfieldnames{iF})(iTarget, iValid) = std(dprimeDisIdx);
             disd.(Disfieldnames{iF})(iTarget, iValid) = mean(dprimeDisIdx);
             disdErr.(Disfieldnames{iF})(iTarget, iValid) = disdStd.(Disfieldnames{iF})(iTarget,iValid)/sqrt(length(subs));
             discStd.(Disfieldnames{iF})(iTarget, iValid) = std(cDisIdx);
             disc.(Disfieldnames{iF})(iTarget, iValid) = mean(cDisIdx);
             discErr.(Disfieldnames{iF})(iTarget, iValid) = discStd.(Disfieldnames{iF})(iTarget,iValid)/sqrt(length(subs));

             dprimeDetIdx = [];
             cDetIdx = [];
             dprimeDisIdx = [];
             cDisIdx = [];
         end
     end
 end

  xcoords_SDT = [0.7778 1 1.2222; 1.7778 2 2.22222];
%% SDT - detection + discrimination collapsed cueing conditions
% mean, std, err for dprime and c for dis and det
dprimeDetCollIdx = [];
cDetCollIdx = [];
dprimeDisCollIdx = [];
cDisCollIdx = [];
for iF = 1:numel(Detfieldnames)
    for iTarget = 1:2
        for iSub = 1:length(subs)
            dprimeDetCollIdx = [dprimeDetCollIdx dataAll(iSub).detdColl.(Detfieldnames{iF})(1,iTarget)];
            cDetCollIdx = [cDetCollIdx dataAll(iSub).detcColl.(Detfieldnames{iF})(1,iTarget)];
            dprimeDisCollIdx = [dprimeDisCollIdx dataAll(iSub).disdColl.(Detfieldnames{iF})(1,iTarget)];
            cDisCollIdx = [cDisCollIdx dataAll(iSub).discColl.(Detfieldnames{iF})(1,iTarget)];
        end

        detdStdColl.(Detfieldnames{iF})(1,iTarget) = std(dprimeDetCollIdx);
        detdColl.(Detfieldnames{iF})(1,iTarget) = mean(dprimeDetCollIdx);
        detdErrColl.(Detfieldnames{iF})(1,iTarget) = detdStdColl.(Detfieldnames{iF})(1,iTarget)/sqrt(length(subs));
        detcStdColl.(Detfieldnames{iF})(1,iTarget) = std(cDetCollIdx);
        detcColl.(Detfieldnames{iF})(1,iTarget) = mean(cDetCollIdx);
        detcErrColl.(Detfieldnames{iF})(1,iTarget) = detcStdColl.(Detfieldnames{iF})(1,iTarget)/sqrt(length(subs));


        disdStdColl.(Detfieldnames{iF})(1,iTarget) = std(dprimeDisCollIdx);
        disdColl.(Detfieldnames{iF})(1,iTarget) = mean(dprimeDisCollIdx);
        disdErrColl.(Detfieldnames{iF})(1,iTarget) = detdStdColl.(Detfieldnames{iF})(1,iTarget)/sqrt(length(subs));
        discStdColl.(Detfieldnames{iF})(1,iTarget) = std(cDisCollIdx);
        discColl.(Detfieldnames{iF})(1,iTarget) = mean(cDisCollIdx);
        discErrColl.(Detfieldnames{iF})(1,iTarget) = detcStdColl.(Detfieldnames{iF})(1,iTarget)/sqrt(length(subs));

        dprimeDetCollIdx = [];
        cDetIdx = [];
        dprimeDisIdx = [];
        cDisIdx = [];
    end
end

%% SDT variables
detNHIdx = [];
detNFAIdx = [];
detNSignalIdx = [];
detNNoiseIdx = [];
for iTarget = 1:2
    for iContrast = 1:4
        for iValid = 1:numel(Validities)
            for iSub = 1:length(subs)
                detNHIdx = [detNHIdx  dataAll(iSub).detnh(iContrast, iValid, iTarget)];
                detNFAIdx = [detNFAIdx dataAll(iSub).detnfa(iContrast, iValid, iTarget)];
                detNSignalIdx = [detNSignalIdx dataAll(iSub).detnsignal(iContrast, iValid, iTarget)];
                detNNoiseIdx = [detNNoiseIdx dataAll(iSub).detnnoise(iContrast, iValid, iTarget)];
            end
            detnhStd(iContrast, iValid, iTarget) = std(detNHIdx);
            detnh(iContrast, iValid, iTarget) = mean(detNHIdx);
            detnhErr(iContrast, iValid, iTarget) = detnhStd(iContrast, iValid, iTarget)/sqrt(length(subs));

            detnfaStd(iContrast, iValid, iTarget) = std(detNFAIdx);
            detnfa(iContrast, iValid, iTarget) = mean(detNFAIdx);
            detnfaErr(iContrast, iValid, iTarget) = detnfaStd(iContrast, iValid, iTarget)/sqrt(length(subs));

            detnsignalStd(iContrast, iValid, iTarget) = std(detNSignalIdx);
            detnsignal(iContrast, iValid, iTarget) = mean(detNSignalIdx);
            detnsignalErr(iContrast, iValid, iTarget) =   detnsignalStd(iContrast, iValid, iTarget)/sqrt(length(subs));

            detnnoiseStd(iContrast, iValid, iTarget) = std(detNNoiseIdx);
            detnnoise(iContrast, iValid, iTarget) = mean(detNNoiseIdx);
            detnnoiseErr(iContrast, iValid, iTarget) =   detnnoiseStd(iContrast, iValid, iTarget)/sqrt(length(subs));

            detNHIdx = [];
            detNFAIdx = [];
            detNSignalIdx = [];
            detNNoiseIdx = [];
        end
    end
end


%% accuracy
%% figure 1 - target presence x validity x target

figure();
set(gcf,'Position',[100 100 500 400])
shade_scatter = [.6 .5 .25];
shade = [1, .6, .35];
for iContrast = 1:numel(contrastConds)
    subplot(2,2,iContrast)
    for iTarget = 1:2

        for iValid = 1:3
            b = bar(xcoords(iContrast, iValid, iTarget), Acc.mean(iContrast, iValid, iTarget));
            hold on 
            % for iSub = 1:15
            %     s = scatter(xcoords_scatter(iValid, iSub, iTarget), Acc_scatterplot.(contrasts{iContrast})(iValid,iSub,iTarget));
            %         s.MarkerEdgeColor = [1 1 1];
            %         if iTarget == 1
            %             s.MarkerFaceColor = fp.blue;
            %         elseif iTarget == 2
            %             s.MarkerFaceColor= fp.orange;
            %         end
            %          s.MarkerFaceAlpha = shade_scatter(iValid);
            % end
            
            kt_figureStyle();
            errorbar(xcoords(iContrast, iValid, iTarget),Acc.mean(iContrast, iValid, iTarget),Acc.err(iContrast, iValid, iTarget), '.k', 'MarkerSize', 0.01, 'CapSize', 0, 'LineWidth', 1.75)
            if iContrast == 1 || iContrast == 3
                if iTarget == 1
                    b.FaceColor = fp.blue;
                    b.EdgeColor = fp.blue;
                elseif iTarget == 2
                    b.FaceColor= fp.orange;
                    b.EdgeColor = fp.orange;
                end
                b.FaceAlpha = shade(iValid);
                b.EdgeAlpha = shade(iValid);
                b.BarWidth = 0.2;
            elseif iContrast == 2 || iContrast == 4
                b.FaceColor = [1 1 1];
                b.EdgeAlpha = shade(iValid);
                if iTarget == 1
                    b.EdgeColor = fp.blue;
                elseif iTarget == 2
                    b.EdgeColor = fp.orange;
                end
                b.LineWidth = 2;
                b.BarWidth = 0.18;
                b.EdgeAlpha = shade(iValid);
            end
        end


       % for iSub = 1:15
       %      plot(xcoords_scatter(:, iSub, iTarget), Acc_scatterplot.(contrasts{iContrast})(:,iSub,iTarget),'Color',[0.45 0.45 0.45])
       %  end
    end
    hold on
    if iContrast==1
        kt_annotateStats(1,86,'**');
        kt_drawBracket(.7778, 1.2222, .84)
        % kt_annotateStats(2,94,'~');
        % kt_drawBracket(1.7778, 2.2222, .9)

        kt_annotateStats(1,94,'_______');
        kt_annotateStats(1,95,'* Validity');

        kt_annotateStats(1.5,102,'___________________');
        kt_annotateStats(1.5,104,'*** Target');
        kt_annotateStats(1.5,109,'** Validity');

    end

    if iContrast == 3
        kt_annotateStats(1,88,'***');
        kt_drawBracket(.7778, 1.2222, .88)
        kt_annotateStats(1.1111,83,'*');
        kt_drawBracket(1, 1.2222, .83)
        kt_annotateStats(2,92,'*');
        kt_drawBracket(1.7778, 2.2222, .92)

        kt_annotateStats(1,96,'_______');
        kt_annotateStats(1,97,'*** Validity');

        kt_annotateStats(1.5,102,'___________________');
        kt_annotateStats(1.5,104,'*** Target');
        kt_annotateStats(1.5,109,'*** Validity');
    end

    if iContrast == 2
        kt_annotateStats(1,92.8,'*');
        kt_drawBracket(.7778, 1.2222, .925)

        kt_annotateStats(1,100,'_______');
        kt_annotateStats(1,101,'* Validity');
    end

    if iContrast == 4
        kt_annotateStats(1.8889,99,'**');
        kt_drawBracket(1.7778, 2, .98)
    end

    hold off
    ylabel('Accuracy (%)')
    ylim([50 105])
    ax = gca;
    set(gca, 'ytick', 50:10:100)
    hold on
    xlim([0.5 2.5])
    xticks([0.7778 1 1.222 1.7778 2 2.2222])
    set(gca, 'xticklabel', {'V', 'N', 'I'})

    hold on
    ax = gca;
    ax.XGrid = 'off';
    ax.YGrid = 'off';

    
end 
[ax1, h1] = suplabel('Non-target Present', 'y', [0.08 0.08 .84 1.325]);
[ax2, h2] = suplabel('Non-target Absent', 'y', [0.08 0.08 .84 0.375]);
[ax3, h3] = suplabel('Target Absent', 't', [0.08 0.08 1.3 .90]);
[ax4, h4] = suplabel('Target Present', 't', [0.08 0.08 .45 .90]);
[ax5, h5] = suplabel('T1', 'tt', [0.08 0.08 .27 0.86]);
[ax6, h6] = suplabel('T2', 'tt', [0.08 0.08 .6 0.86]);
[ax7, h7] = suplabel('T1', 'tt', [0.08 0.08 1.15 0.86]);
[ax8, h8] = suplabel('T2', 'tt', [0.08 0.08 1.47 0.86]);
% 
% if saveplots
%     figTitle = sprintf('%s_%s',...
%         'beh_acc',datestr(now,'yymmdd'));
%     saveas(gcf,sprintf('%s/%s.png', figDir, figTitle))
% end



 %% acc by validity, collapsed contrast

 figure();
 set(gcf,'Position',[100 100 500 400])
 % shade_scatter = [.6 .5 .25];
 shade = [1, .6, .35];
 % for iContrast = 1:numel(contrastConds)
 % subplot(2,1,iContrast)
 for iTarget = 1:2
     % subplot(1,2,iTarget)

     for iValid = 1:3
         b = bar(xcoords_SDT(iTarget, iValid), AccAll.mean(iTarget, iValid));
         hold on
         % for iSub = 1:15
         %     s = scatter(xcoords_scatter(iValid, iSub, iTarget), Acc_scatterplot.(contrasts{iContrast})(iValid,iSub,iTarget));
         %         s.MarkerEdgeColor = [1 1 1];
         %         if iTarget == 1
         %             s.MarkerFaceColor = fp.blue;
         %         elseif iTarget == 2
         %             s.MarkerFaceColor= fp.orange;
         %         end
         %          s.MarkerFaceAlpha = shade_scatter(iValid);
         % end

         kt_figureStyle();
         errorbar(xcoords_SDT(iTarget, iValid),AccAll.mean(iTarget, iValid),AccAll.err(iTarget, iValid), '.k', 'MarkerSize', 0.01, 'CapSize', 0, 'LineWidth', 1.75)
         % if iContrast == 1 || iContrast == 3
         if iTarget == 1
             b.FaceColor = fp.blue;
             b.EdgeColor = fp.blue;
         elseif iTarget == 2
             b.FaceColor= fp.orange;
             b.EdgeColor = fp.orange;
         end
         b.FaceAlpha = shade(iValid);
         b.EdgeAlpha = shade(iValid);
         b.BarWidth = 0.2;

     end

     hold on
     if iTarget == 1
     kt_annotateStats(1,93,'**');
     kt_drawBracket(.7778, 1.2222, .99)

     kt_annotateStats(1, 95.75,'______________');
     kt_annotateStats(1,96,'* Validity');
     elseif iTarget == 2
     % T2
     kt_annotateStats(2,95,'*');
     kt_drawBracket(1.7778, 2.2222, .90)

     kt_annotateStats(1.5, 97.5,'____________________________________________');
     kt_annotateStats(1.5, 98,'** Target');
     kt_annotateStats(1.5,99,'** Validity');
     end 




 hold off
 ylabel('Accuracy (%)')
 ylim([50 100])
 ax = gca;
 set(gca, 'ytick', 50:10:100)
 hold on
 xlim([0.5 2.5])
 xticks([0.7778 1 1.222 1.7778 2 2.2222])
 set(gca, 'xticklabel', {'V', 'N', 'I'})

 hold on
 ax = gca;
 ax.XGrid = 'off';
 ax.YGrid = 'off';

 end
 % end
 [ax1, h1] = suplabel('T1', 't', [0.08 0.08 .5 .90]);
 [ax2, h2] = suplabel('T2', 't', [0.08 0.08 1.255 .90]);
 % % [ax3, h3] = suplabel('Target Absent', 't', [0.08 0.08 1.3 .90]);
 % [ax4, h4] = suplabel('Target Present', 't', [0.08 0.08 .45 .90]);
 % [ax5, h5] = suplabel('T1', 'tt', [0.08 0.08 0.5 0.86]);
 % [ax6, h6] = suplabel('T2', 'tt', [0.08 0.08 1.255 0.86]);
 % [ax7, h7] = suplabel('T1', 'tt', [0.08 0.08 1.15 0.86]);
 % [ax8, h8] = suplabel('T2', 'tt', [0.08 0.08 1.47 0.86]);
 % %
 % if saveplots
 %     figTitle = sprintf('%s_%s',...
 %         'beh_acc',datestr(now,'yymmdd'));
 %     saveas(gcf,sprintf('%s/%s.png', figDir, figTitle))
 % end

%% accuracy of nontarget swapping

figure();
set(gcf,'Position',[100 100 500 400])
shade_scatter = [.6 .5 .25];
shade = [1, .6, .35];
for iContrast = 1:numel(contrastConds)
    subplot(2,2,iContrast)
    for iTarget = 1:2
        for iValid = 1:3
            b = bar(xcoords(iContrast, iValid, iTarget), Acc.NTmean(iContrast, iValid, iTarget));
            hold on 
            % for iSub = 1:15
            %     s = scatter(xcoords_scatter(iValid, iSub, iTarget), Acc_scatterplot.(contrasts{iContrast})(iValid,iSub,iTarget));
            %         s.MarkerEdgeColor = [1 1 1];
            %         if iTarget == 1
            %             s.MarkerFaceColor = fp.blue;
            %         elseif iTarget == 2
            %             s.MarkerFaceColor= fp.orange;
            %         end
            %          s.MarkerFaceAlpha = shade_scatter(iValid);
            % end
            
            kt_figureStyle();
            errorbar(xcoords(iContrast, iValid, iTarget),Acc.NTmean(iContrast, iValid, iTarget),Acc.NTerr(iContrast, iValid, iTarget), '.k', 'MarkerSize', 0.01, 'CapSize', 0, 'LineWidth', 1.75)
            if iContrast == 1 || iContrast == 3
                if iTarget == 1
                    b.FaceColor = fp.blue;
                    b.EdgeColor = fp.blue;
                elseif iTarget == 2
                    b.FaceColor= fp.orange;
                    b.EdgeColor = fp.orange;
                end
                b.FaceAlpha = shade(iValid);
                b.EdgeAlpha = shade(iValid);
                b.BarWidth = 0.2;
            elseif iContrast == 2 || iContrast == 4
                b.FaceColor = [1 1 1];
                b.EdgeAlpha = shade(iValid);
                if iTarget == 1
                    b.EdgeColor = fp.blue;
                elseif iTarget == 2
                    b.EdgeColor = fp.orange;
                end
                b.LineWidth = 2;
                b.BarWidth = 0.18;
                b.EdgeAlpha = shade(iValid);
            end
        end


       % for iSub = 1:15
       %      plot(xcoords_scatter(:, iSub, iTarget), Acc_scatterplot.(contrasts{iContrast})(:,iSub,iTarget),'Color',[0.45 0.45 0.45])
       %  end
    end
    hold on
    % if iContrast==1
    %     kt_annotateStats(1,86,'**');
    %     kt_drawBracket(.7778, 1.2222, .84)
    %     % kt_annotateStats(2,94,'~');
    %     % kt_drawBracket(1.7778, 2.2222, .9)
    % 
    %     kt_annotateStats(1,94,'_______');
    %     kt_annotateStats(1,95,'* Validity');
    % 
    %     kt_annotateStats(1.5,102,'___________________');
    %     kt_annotateStats(1.5,104,'*** Target');
    %     kt_annotateStats(1.5,109,'** Validity');
    % 
    % end
    % 
    % if iContrast == 3
    %     kt_annotateStats(1,88,'***');
    %     kt_drawBracket(.7778, 1.2222, .88)
    %     kt_annotateStats(1.1111,83,'*');
    %     kt_drawBracket(1, 1.2222, .83)
    %     kt_annotateStats(2,92,'*');
    %     kt_drawBracket(1.7778, 2.2222, .92)
    % 
    %     kt_annotateStats(1,96,'_______');
    %     kt_annotateStats(1,97,'*** Validity');
    % 
    %     kt_annotateStats(1.5,102,'___________________');
    %     kt_annotateStats(1.5,104,'*** Target');
    %     kt_annotateStats(1.5,109,'*** Validity');
    % end
    % 
    % if iContrast == 2
    %     kt_annotateStats(1,92.8,'*');
    %     kt_drawBracket(.7778, 1.2222, .925)
    % 
    %     kt_annotateStats(1,100,'_______');
    %     kt_annotateStats(1,101,'* Validity');
    % end
    % 
    % if iContrast == 4
    %     kt_annotateStats(1.8889,99,'**');
    %     kt_drawBracket(1.7778, 2, .98)
    % end

    hold off
    ylabel('Non-target swapping (%)')
    ylim([0 20])
    ax = gca;
    set(gca, 'ytick', 0:5:20)
    hold on
    xlim([0.5 2.5])
    xticks([0.7778 1 1.222 1.7778 2 2.2222])
    set(gca, 'xticklabel', {'V', 'N', 'I'})

    hold on
    ax = gca;
    ax.XGrid = 'off';
    ax.YGrid = 'off';

    
end 
[ax1, h1] = suplabel('Non-target Present', 'y', [0.08 0.08 .84 1.325]);
[ax2, h2] = suplabel('Non-target Absent', 'y', [0.08 0.08 .84 0.375]);
[ax3, h3] = suplabel('Target Absent', 't', [0.08 0.08 1.3 .90]);
[ax4, h4] = suplabel('Target Present', 't', [0.08 0.08 .45 .90]);
[ax5, h5] = suplabel('T1', 'tt', [0.08 0.08 .27 0.86]);
[ax6, h6] = suplabel('T2', 'tt', [0.08 0.08 .6 0.86]);
[ax7, h7] = suplabel('T1', 'tt', [0.08 0.08 1.15 0.86]);
[ax8, h8] = suplabel('T2', 'tt', [0.08 0.08 1.47 0.86]);
% 
% if saveplots
%     figTitle = sprintf('%s_%s',...
%         'beh_acc',datestr(now,'yymmdd'));
%     saveas(gcf,sprintf('%s/%s.png', figDir, figTitle))
% end

%% percentage of error due to swapping

figure();
set(gcf,'Position',[100 100 500 400])
shade_scatter = [.6 .5 .25];
shade = [1, .6, .35];
for iContrast = 1:numel(contrastConds)
    subplot(2,2,iContrast)
    for iTarget = 1:2
        for iValid = 1:3
            b = bar(xcoords(iContrast, iValid, iTarget), Err.mean(iContrast, iValid, iTarget));
            hold on 
            % for iSub = 1:15
            %     s = scatter(xcoords_scatter(iValid, iSub, iTarget), Acc_scatterplot.(contrasts{iContrast})(iValid,iSub,iTarget));
            %         s.MarkerEdgeColor = [1 1 1];
            %         if iTarget == 1
            %             s.MarkerFaceColor = fp.blue;
            %         elseif iTarget == 2
            %             s.MarkerFaceColor= fp.orange;
            %         end
            %          s.MarkerFaceAlpha = shade_scatter(iValid);
            % end
            
            kt_figureStyle();
            errorbar(xcoords(iContrast, iValid, iTarget),Err.mean(iContrast, iValid, iTarget),Err.err(iContrast, iValid, iTarget), '.k', 'MarkerSize', 0.01, 'CapSize', 0, 'LineWidth', 1.75)
            if iContrast == 1 || iContrast == 3
                if iTarget == 1
                    b.FaceColor = fp.blue;
                    b.EdgeColor = fp.blue;
                elseif iTarget == 2
                    b.FaceColor= fp.orange;
                    b.EdgeColor = fp.orange;
                end
                b.FaceAlpha = shade(iValid);
                b.EdgeAlpha = shade(iValid);
                b.BarWidth = 0.2;
            elseif iContrast == 2 || iContrast == 4
                b.FaceColor = [1 1 1];
                b.EdgeAlpha = shade(iValid);
                if iTarget == 1
                    b.EdgeColor = fp.blue;
                elseif iTarget == 2
                    b.EdgeColor = fp.orange;
                end
                b.LineWidth = 2;
                b.BarWidth = 0.18;
                b.EdgeAlpha = shade(iValid);
            end
        end


       % for iSub = 1:15
       %      plot(xcoords_scatter(:, iSub, iTarget), Acc_scatterplot.(contrasts{iContrast})(:,iSub,iTarget),'Color',[0.45 0.45 0.45])
       %  end
    end
    hold on
    % if iContrast==1
    %     kt_annotateStats(1,86,'**');
    %     kt_drawBracket(.7778, 1.2222, .84)
    %     % kt_annotateStats(2,94,'~');
    %     % kt_drawBracket(1.7778, 2.2222, .9)
    % 
    %     kt_annotateStats(1,94,'_______');
    %     kt_annotateStats(1,95,'* Validity');
    % 
    %     kt_annotateStats(1.5,102,'___________________');
    %     kt_annotateStats(1.5,104,'*** Target');
    %     kt_annotateStats(1.5,109,'** Validity');
    % 
    % end
    % 
    % if iContrast == 3
    %     kt_annotateStats(1,88,'***');
    %     kt_drawBracket(.7778, 1.2222, .88)
    %     kt_annotateStats(1.1111,83,'*');
    %     kt_drawBracket(1, 1.2222, .83)
    %     kt_annotateStats(2,92,'*');
    %     kt_drawBracket(1.7778, 2.2222, .92)
    % 
    %     kt_annotateStats(1,96,'_______');
    %     kt_annotateStats(1,97,'*** Validity');
    % 
    %     kt_annotateStats(1.5,102,'___________________');
    %     kt_annotateStats(1.5,104,'*** Target');
    %     kt_annotateStats(1.5,109,'*** Validity');
    % end
    % 
    % if iContrast == 2
    %     kt_annotateStats(1,92.8,'*');
    %     kt_drawBracket(.7778, 1.2222, .925)
    % 
    %     kt_annotateStats(1,100,'_______');
    %     kt_annotateStats(1,101,'* Validity');
    % end
    % 
    % if iContrast == 4
    %     kt_annotateStats(1.8889,99,'**');
    %     kt_drawBracket(1.7778, 2, .98)
    % end

    hold off
    ylabel('% error due to swapping')
    ylim([0 100])
    ax = gca;
    set(gca, 'ytick', 0:10:100)
    hold on
    xlim([0.5 2.5])
    xticks([0.7778 1 1.222 1.7778 2 2.2222])
    set(gca, 'xticklabel', {'V', 'N', 'I'})

    hold on
    ax = gca;
    ax.XGrid = 'off';
    ax.YGrid = 'off';

    
end 
[ax1, h1] = suplabel('Non-target Present', 'y', [0.08 0.08 .84 1.325]);
[ax2, h2] = suplabel('Non-target Absent', 'y', [0.08 0.08 .84 0.375]);
[ax3, h3] = suplabel('Target Absent', 't', [0.08 0.08 1.3 .90]);
[ax4, h4] = suplabel('Target Present', 't', [0.08 0.08 .45 .90]);
[ax5, h5] = suplabel('T1', 'tt', [0.08 0.08 .27 0.86]);
[ax6, h6] = suplabel('T2', 'tt', [0.08 0.08 .6 0.86]);
[ax7, h7] = suplabel('T1', 'tt', [0.08 0.08 1.15 0.86]);
[ax8, h8] = suplabel('T2', 'tt', [0.08 0.08 1.47 0.86]);
% 
% if saveplots
%     figTitle = sprintf('%s_%s',...
%         'beh_acc',datestr(now,'yymmdd'));
%     saveas(gcf,sprintf('%s/%s.png', figDir, figTitle))
% end



%% acc by nontarget contrast

figure;
set(gcf,'Position',[100 100 600 300])
% shade_scatter = [.6 .5 .25];
shade = [1, .6, .35];
for iContrast = 1:2
    subplot(1,2,iContrast)
    kt_figureStyle();

    for iTarget = 1:2

        for iValid = 1:3
            b = bar(xcoords(iContrast, iValid, iTarget), ntcAcc.mean(iContrast, iValid, iTarget));
            hold on
            % for iSub = 1:15
            %     s = scatter(xcoords_scatter(iValid, iSub, iTarget), Acc_scatterplot.(contrasts{iContrast})(iValid,iSub,iTarget));
            %         s.MarkerEdgeColor = [1 1 1];
            %         if iTarget == 1
            %             s.MarkerFaceColor = fp.blue;
            %         elseif iTarget == 2
            %             s.MarkerFaceColor= fp.orange;
            %         end
            %          s.MarkerFaceAlpha = shade_scatter(iValid);
            % end

            errorbar(xcoords(iContrast, iValid, iTarget),ntcAcc.mean(iContrast, iValid, iTarget),ntcAcc.err(iContrast, iValid, iTarget), '.k', 'MarkerSize', 0.01, 'CapSize', 0, 'LineWidth', 1.75)
            % if iContrast == 1
                if iTarget == 1
                    b.FaceColor = fp.blue;
                    b.EdgeColor = fp.blue;
                elseif iTarget == 2
                    b.FaceColor= fp.orange;
                    b.EdgeColor = fp.orange;
                end
                b.FaceAlpha = shade(iValid);
                b.EdgeAlpha = shade(iValid);
                b.BarWidth = 0.2;
        %     elseif iContrast == 2
        %         b.FaceColor = [1 1 1];
        %         b.EdgeAlpha = shade(iValid);
        %         if iTarget == 1
        %             b.EdgeColor = fp.blue;
        %         elseif iTarget == 2
        %             b.EdgeColor = fp.orange;
        %         end
        %         b.LineWidth = 2;
        %         b.BarWidth = 0.18;
        %         b.EdgeAlpha = shade(iValid);
        %     end
        end


       % for iSub = 1:15
       %      plot(xcoords_scatter(:, iSub, iTarget), Acc_scatterplot.(contrasts{iContrast})(:,iSub,iTarget),'Color',[0.45 0.45 0.45])
       %  end
    end
    hold on
    if iContrast==1
        % kt_annotateStats(1,87,'***');
        % kt_drawBracket(.7778, 1.2222, .83)
        % kt_annotateStats(1.1111,83,'**');
        % kt_drawBracket(1, 1.2222, .79)
        % %  kt_annotateStats(.89999,86,'~');
        % % kt_drawBracket(.7778, 1, .82)
        % 
        % kt_annotateStats(2,94.5,'**');
        % kt_drawBracket(1.7778, 2.2222, .91)
        % kt_annotateStats(2.111,91,'*');
        % kt_drawBracket(2, 2.2222, .875)
        % 
        % kt_annotateStats(1,98,'________');
        % kt_annotateStats(1,99,'*** Validity');
        % 
        %  kt_annotateStats(2,98,'________');
        % kt_annotateStats(2,99,'* Validity');
        % 
        % kt_annotateStats(1.5,103,'___________________');
        % kt_annotateStats(1.5,103.5,'*** Target');
        % kt_annotateStats(1.5,105,'*** Validity');
        % 

    elseif iContrast == 2
        % kt_annotateStats(1,98,'*');
        % kt_drawBracket(.7778, 1.2222, .945)
        % 
        % 
        % kt_annotateStats(1,101,'________');
        % kt_annotateStats(1,102,'*** Nontarget Contrast');
        % 
        % kt_annotateStats(2,98,'________');
        % kt_annotateStats(2,102,'*** Nontarget Contrast');
        % 
        % kt_annotateStats(1.5,104,'___________________');
        % kt_annotateStats(1.5,104.5,'*** Nontarget Contrast');
        % 

      
    end

    
    hold off
    ylabel('Accuracy (%)')
    ylim([50 105])
    ax = gca;
    set(gca, 'ytick', 50:10:100)
    hold on
    xlim([0.5 2.5])
    xticks([0.7778 1 1.222 1.7778 2 2.2222])
    set(gca, 'xticklabel', {'V', 'N', 'I'})

    hold on
    ax = gca;
    ax.XGrid = 'off';
    ax.YGrid = 'off';

    
end 
% [ax1, h1] = suplabel('Non-target Present', 'y', [0.08 0.08 .84 1.325]);
% [ax2, h2] = suplabel('Non-target Absent', 'y', [0.08 0.08 .84 0.375]);
[ax3, h3] = suplabel('Non-target Absent', 't', [0.08 0.08 1.3 .90]);
[ax4, h4] = suplabel('Non-target Present', 't', [0.08 0.08 .45 .90]);
[ax5, h5] = suplabel('T1', 'tt', [0.08 0.08 .27 0.86]);
[ax6, h6] = suplabel('T2', 'tt', [0.08 0.08 .6 0.86]);
[ax7, h7] = suplabel('T1', 'tt', [0.08 0.08 1.15 0.86]);
[ax8, h8] = suplabel('T2', 'tt', [0.08 0.08 1.47 0.86]);
% 
% if saveplots
%     figTitle = sprintf('%s_%s',...
%         'beh_acc',datestr(now,'yymmdd'));
%     saveas(gcf,sprintf('%s/%s.png', figDir, figTitle))
% end

%% acc by target contrast

figure;
set(gcf,'Position',[100 100 600 300])
% shade_scatter = [.6 .5 .25];
shade = [1, .6, .35];
for iContrast = 1:2
    subplot(1,2,iContrast)
    kt_figureStyle();

    for iTarget = 1:2

        for iValid = 1:3
            b = bar(xcoords(iContrast, iValid, iTarget), tcAcc.mean(iContrast, iValid, iTarget));
            hold on
            % for iSub = 1:15
            %     s = scatter(xcoords_scatter(iValid, iSub, iTarget), Acc_scatterplot.(contrasts{iContrast})(iValid,iSub,iTarget));
            %         s.MarkerEdgeColor = [1 1 1];
            %         if iTarget == 1
            %             s.MarkerFaceColor = fp.blue;
            %         elseif iTarget == 2
            %             s.MarkerFaceColor= fp.orange;
            %         end
            %          s.MarkerFaceAlpha = shade_scatter(iValid);
            % end

            errorbar(xcoords(iContrast, iValid, iTarget),tcAcc.mean(iContrast, iValid, iTarget),tcAcc.err(iContrast, iValid, iTarget), '.k', 'MarkerSize', 0.01, 'CapSize', 0, 'LineWidth', 1.75)
            if iContrast == 1
                if iTarget == 1
                    b.FaceColor = fp.blue;
                    b.EdgeColor = fp.blue;
                elseif iTarget == 2
                    b.FaceColor= fp.orange;
                    b.EdgeColor = fp.orange;
                end
                b.FaceAlpha = shade(iValid);
                b.EdgeAlpha = shade(iValid);
                b.BarWidth = 0.2;
            elseif iContrast == 2
                b.FaceColor = [1 1 1];
                b.EdgeAlpha = shade(iValid);
                if iTarget == 1
                    b.EdgeColor = fp.blue;
                elseif iTarget == 2
                    b.EdgeColor = fp.orange;
                end
                b.LineWidth = 2;
                b.BarWidth = 0.18;
                b.EdgeAlpha = shade(iValid);
            end
        end


       % for iSub = 1:15
       %      plot(xcoords_scatter(:, iSub, iTarget), Acc_scatterplot.(contrasts{iContrast})(:,iSub,iTarget),'Color',[0.45 0.45 0.45])
       %  end
    end
    hold on
    if iContrast==1
        kt_annotateStats(1,87,'***');
        kt_drawBracket(.7778, 1.2222, .83)
        kt_annotateStats(1.1111,83,'**');
        kt_drawBracket(1, 1.2222, .79)
        %  kt_annotateStats(.89999,86,'~');
        % kt_drawBracket(.7778, 1, .82)

        kt_annotateStats(2,94.5,'**');
        kt_drawBracket(1.7778, 2.2222, .91)
        kt_annotateStats(2.111,91,'*');
        kt_drawBracket(2, 2.2222, .875)

        kt_annotateStats(1,98,'________');
        kt_annotateStats(1,99,'*** Validity');

         kt_annotateStats(2,98,'________');
        kt_annotateStats(2,99,'* Validity');

        kt_annotateStats(1.5,103,'___________________');
        kt_annotateStats(1.5,103.5,'*** Target');
        kt_annotateStats(1.5,105,'*** Validity');


    elseif iContrast == 2
        kt_annotateStats(1,98,'*');
        kt_drawBracket(.7778, 1.2222, .945)


        kt_annotateStats(1,101,'________');
        kt_annotateStats(1,102,'*** Nontarget Contrast');

        kt_annotateStats(2,98,'________');
        kt_annotateStats(2,102,'*** Nontarget Contrast');

        kt_annotateStats(1.5,104,'___________________');
        kt_annotateStats(1.5,104.5,'*** Nontarget Contrast');


      
    end

    
    hold off
    ylabel('Accuracy (%)')
    ylim([50 105])
    ax = gca;
    set(gca, 'ytick', 50:10:100)
    hold on
    xlim([0.5 2.5])
    xticks([0.7778 1 1.222 1.7778 2 2.2222])
    set(gca, 'xticklabel', {'V', 'N', 'I'})

    hold on
    ax = gca;
    ax.XGrid = 'off';
    ax.YGrid = 'off';

    
end 
% [ax1, h1] = suplabel('Non-target Present', 'y', [0.08 0.08 .84 1.325]);
% [ax2, h2] = suplabel('Non-target Absent', 'y', [0.08 0.08 .84 0.375]);
[ax3, h3] = suplabel('Target Absent', 't', [0.08 0.08 1.3 .90]);
[ax4, h4] = suplabel('Target Present', 't', [0.08 0.08 .45 .90]);
[ax5, h5] = suplabel('T1', 'tt', [0.08 0.08 .27 0.86]);
[ax6, h6] = suplabel('T2', 'tt', [0.08 0.08 .6 0.86]);
[ax7, h7] = suplabel('T1', 'tt', [0.08 0.08 1.15 0.86]);
[ax8, h8] = suplabel('T2', 'tt', [0.08 0.08 1.47 0.86]);
% 
% if saveplots
%     figTitle = sprintf('%s_%s',...
%         'beh_acc',datestr(now,'yymmdd'));
%     saveas(gcf,sprintf('%s/%s.png', figDir, figTitle))
% end


%% acc by target contrast collapsed across att conds


%% det acc
figure();
sgtitle('ga det accuracy')
for iF = 1:numel(contrastConds)
    subplot(2,2,iF)
    b = bar([dAcc.mean(iF,:,1); dAcc.mean(iF,:,2)]);
    hold on
    for k = 1:numel(b)      % code to align error bars to grouped subplot bar coordinate, revised from stack exchange   % Recent MATLAB Versions
        xtips = b(k).XEndPoints;
        ytips = b(k).YEndPoints;
        errorbar(xtips,ytips,dAcc.err(iF,k), '.k', 'MarkerSize',0.1)
    end
    hold off
    condTitle = [{'target present/nontarget present'} {'target present/nontarget absent'} {'target absent/nontarget present'} {'target absent/nontarget absent'}];
    title([condTitle{iF}])
    ylabel('det accuracy %')
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

figure();
sgtitle('ga det acc by nontarget')
for iF = 1:2
    subplot(1,2,iF)
    b = bar([dAccNT.mean(iF,:,1); dAccNT.mean(iF,:,2)]);
    hold on
    for k = 1:numel(b)      % code to align error bars to grouped subplot bar coordinate, revised from stack exchange   % Recent MATLAB Versions
        xtips = b(k).XEndPoints;
        ytips = b(k).YEndPoints;
        errorbar(xtips,ytips,dAccNT.err(iF,k), '.k', 'MarkerSize',0.1)
    end
    hold off
    condTitle = [{'nontarget present'} {'nontarget absent'}];
    title([condTitle{iF}])
    ylabel('det accuracy %')
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

%% det acc target present trials only

figure();
sgtitle('ga det acc by nontarget - target present trials only')
for iF = 1:2
    subplot(1,2,iF)
    b = bar([dtpAccNT.mean(iF,:,1); dtpAccNT.mean(iF,:,2)]);
    hold on
    for k = 1:numel(b)      % code to align error bars to grouped subplot bar coordinate, revised from stack exchange   % Recent MATLAB Versions
        xtips = b(k).XEndPoints;
        ytips = b(k).YEndPoints;
        errorbar(xtips,ytips,dtpAccNT.err(iF,k), '.k', 'MarkerSize',0.1)
    end
    hold off
    condTitle = [{'nontarget present'} {'nontarget absent'}];
    title([condTitle{iF}])
    ylabel('det accuracy %')
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


%% RT plot 

figure();
set(gcf,'Position',[100 100 500 400])
shade_scatter = [.6 .5 .25];
shade = [1, .6, .35];
for iContrast = 1:numel(contrastConds)
    subplot(2,2,iContrast)
    for iTarget = 1:2
        for iValid = 1:3
            b = bar(xcoords(iContrast, iValid, iTarget), RT.mean(iContrast, iValid, iTarget));
            hold on 
            % for iSub = 1:15
            %     s = scatter(xcoords_scatter(iValid, iSub, iTarget), RT_scatterplot.(contrasts{iContrast})(iValid,iSub,iTarget));
            %         s.MarkerEdgeColor = [1 1 1];
            %         if iTarget == 1
            %             s.MarkerFaceColor = fp.blue;
            %         elseif iTarget == 2
            %             s.MarkerFaceColor= fp.orange;
            %         end
            %          s.MarkerFaceAlpha = shade_scatter(iValid);
            % end
            kt_figureStyle();
            errorbar(xcoords(iContrast, iValid, iTarget),RT.mean(iContrast, iValid, iTarget),RT.err(iContrast, iValid, iTarget), '.k', 'MarkerSize', 0.01, 'CapSize', 0, 'LineWidth', 1.75)
            if iContrast == 1 || iContrast == 3
                if iTarget == 1
                    b.FaceColor = fp.blue;
                    b.EdgeColor = fp.blue;
                elseif iTarget == 2
                    b.FaceColor= fp.orange;
                    b.EdgeColor = fp.orange;
                end
                b.FaceAlpha = shade(iValid);
                b.EdgeAlpha = shade(iValid);
                b.BarWidth = 0.2;
            elseif iContrast == 2 || iContrast == 4
                b.FaceColor = [1 1 1];
                b.EdgeAlpha = shade(iValid);
                if iTarget == 1
                    b.EdgeColor = fp.blue;
                elseif iTarget == 2
                    b.EdgeColor = fp.orange;
                end
                b.LineWidth = 2;
                b.BarWidth = 0.18;
                b.EdgeAlpha = shade(iValid);
            end
        end
    end
    hold on
    if iContrast==1
        kt_annotateStats(1,.6,'***');
        kt_drawBracket(.7778, 1.2222, 1.08)
        kt_annotateStats(.89,.52,'**');
        kt_drawBracket(.7778, 1, .78)
        % kt_annotateStats(1.1111,.58,'~');
        % kt_drawBracket(1, 1.2222, .85)

        kt_annotateStats(2.1,.5,'**');
        kt_drawBracket(2, 2.2222, .76)
        % kt_annotateStats(2,.55,'~');
        % kt_drawBracket(1.7778, 2.2222, .78)

        kt_annotateStats(1,.85,'_______');
        kt_annotateStats(1,.87,'*** Validity');

        kt_annotateStats(2, .85,'_______');
        kt_annotateStats(2,.87,'* Validity');

        kt_annotateStats(1.5, 1,'___________________');
        kt_annotateStats(1.5, 1.02,'** Target');
        kt_annotateStats(1.5,1.1,'*** Validity');
    end

    if iContrast == 3
        kt_annotateStats(1,.62,'***');
        kt_drawBracket(.7778, 1.2222, 1.1)
        kt_annotateStats(1.1111,.54,'*');
        kt_drawBracket(1, 1.2222, .82)

        kt_annotateStats(2,.49,'**');
        kt_drawBracket(1.7778, 2.2222, .75)
        kt_annotateStats(2.1111,.42,'*');
        kt_drawBracket(2, 2.2222, .65)

        kt_annotateStats(1,.85,'_______');
        kt_annotateStats(1,.87,'** Validity');

        kt_annotateStats(2, .85,'_______');
        kt_annotateStats(2,.87,'*** Validity');

        kt_annotateStats(1.5, 1,'___________________');
        kt_annotateStats(1.5, 1.02,'** Target');
        kt_annotateStats(1.5,1.1,'*** Validity');
    end

    if iContrast == 2
        kt_annotateStats(1,.425,'*');
        kt_drawBracket(.7778, 1.2222, .85)
        % kt_annotateStats(.89,.38,'~');
        % kt_drawBracket(.7778, 1, .8)


        kt_annotateStats(2,.47,'**');
        kt_drawBracket(1.7778, 2.2222, .98)
        kt_annotateStats(2.12,.38,'*');
        kt_drawBracket(2.02, 2.2222, .70)
        % kt_annotateStats(1.89,.27,'~');
        % kt_drawBracket(1.7778, 1.98, .55)

        kt_annotateStats(2, .85,'_______');
        kt_annotateStats(2,.87,'*** Validity');

        kt_annotateStats(1.5, 1,'___________________');
        kt_annotateStats(1.5, 1.02,'** Target');
        kt_annotateStats(1.5,1.1,'** Validity');
    end

    hold off
    ylabel('RT (s)')
    ylim([0 1.2])
    ax = gca;
    set(gca, 'ytick', 0:.10:1.2)
    hold on
    xlim([0.5 2.5])
    xticks([0.7778 1 1.222 1.7778 2 2.2222])
    set(gca, 'xticklabel', {'V', 'N', 'I'})

    hold on
    ax = gca;
    ax.XGrid = 'off';
    ax.YGrid = 'off';

    
end
[ax1, h1] = suplabel('Non-target Present', 'y', [0.08 0.08 .84 1.325]);
[ax2, h2] = suplabel('Non-target Absent', 'y', [0.08 0.08 .84 0.375]);
[ax3, h3] = suplabel('Target Absent', 't', [0.08 0.08 1.3 0.9]);
[ax4, h4] = suplabel('Target Present', 't', [0.08 0.08 .45 0.9]);
[ax5, h5] = suplabel('T1', 'tt', [0.08 0.08 .27 0.86]);
[ax6, h6] = suplabel('T2', 'tt', [0.08 0.08 .6 0.86]);
[ax7, h7] = suplabel('T1', 'tt', [0.08 0.08 1.15 0.86]);
[ax8, h8] = suplabel('T2', 'tt', [0.08 0.08 1.47 0.86]);

if saveplots
    figTitle = sprintf('%s_%s',...
        'beh_acc',datestr(now,'yymmdd'));
    saveas(gcf,sprintf('%s/%s.png', figDir, figTitle))
end

 %% plot detection
 %dprime
 dprimefieldnames = fieldnames(dataAll(iSub).detd);
 critfieldnames = fieldnames(dataAll(iSub).detc);
 shade_scatter = [.6 .5 .25];
 shade = [1, .6, .35];
 figure();
 for iDet = 2:numel(dprimefieldnames) % for each condition (all, nontarget present, nontarget absent), 2: numel(dprimefieldnames) to remove all
     subplot(2,2,iDet-1) % need to subtract one to remove all and start at right subplot
     for iTarget = 1:2
         for iValid = 1:3
             b = bar(xcoords_SDT(iTarget, iValid), detd.(dprimefieldnames{iDet})(iTarget, iValid));
             hold on 
             for iSub = 1:15
                s = scatter(xcoords_scatter(iValid, iSub, iTarget), detd_scatterplot.(Detfieldnames{iDet})(iValid, iSub, iTarget));
                    s.MarkerEdgeColor = [1 1 1];
                    if iTarget == 1
                        s.MarkerFaceColor = fp.blue;
                    elseif iTarget == 2
                        s.MarkerFaceColor= fp.orange;
                    end
                     s.MarkerFaceAlpha = shade_scatter(iValid);
            end
            kt_figureStyle();
             errorbar(xcoords_SDT(iTarget, iValid),detd.(dprimefieldnames{iDet})(iTarget, iValid),detdErr.(dprimefieldnames{iDet})(iTarget, iValid), '.k', 'MarkerSize',0.1, 'CapSize', 0, 'LineWidth', 1.75)
             % if iDet == 2
                 if iTarget == 1
                     b.FaceColor = fp.blue;
                     b.EdgeColor = fp.blue;
                 elseif iTarget == 2
                     b.FaceColor= fp.orange;
                     b.EdgeColor = fp.orange;
                 end
                 b.FaceAlpha = shade(iValid);
                 b.EdgeAlpha = shade(iValid);
                 b.BarWidth = 0.2;
         end
     end

     hold on
     if iDet == 2
         kt_annotateStats(.89,4,'*');
         kt_drawBracket(.7778, .98, .65)
         % kt_annotateStats(1.1111,3.84,'~');
         % kt_drawBracket(1.02, 1.2222, .75)

         % kt_annotateStats(2,4.6,'~');
         % kt_drawBracket(1.7778, 2.2222, .89)
         % kt_annotateStats(1.89,4.1,'~');
         % kt_drawBracket(1.7778, 2, .8)

        kt_annotateStats(1,5.5,'_______');
        kt_annotateStats(1,5.55,'* Validity');


        kt_annotateStats(1.5, 6.1,'___________________');
        kt_annotateStats(1.5, 6.3,'** Validity');
        % kt_annotateStats(1.5,6.6,'* Validity');

     elseif iDet == 3
         kt_annotateStats(.89,4.2,'**');
         kt_drawBracket(.7778, 1, .70)
         kt_annotateStats(1,4.7,'***');
         kt_drawBracket(.7778, 1.2222, .80)

         kt_annotateStats(1.89,4.4,'*');
         kt_drawBracket(1.7778, 1.98, .73)
         kt_annotateStats(2.1111,4.1,'*');
         kt_drawBracket(2.02, 2.2222, .70)
         kt_annotateStats(2,4.85,'***');
         kt_drawBracket(1.7778, 2.2222, .82)

        kt_annotateStats(1,5.5,'_______');
        kt_annotateStats(1,5.55,'*** Validity');

        kt_annotateStats(2,5.5,'_______');
        kt_annotateStats(2,5.55,'*** Validity');

        kt_annotateStats(1.5, 6.1,'___________________');
        kt_annotateStats(1.5, 6.2,'** Target');
        kt_annotateStats(1.5,6.6,'*** Validity');
     end

     ylabel("target detection d'")
     ylim([0 7])
     ax = gca;
     set(gca, 'ytick', 0:1:7)
     hold on
     xlim([0.5 2.5])
     xticks([0.7778 1 1.222 1.7778 2 2.2222])
     set(gca, 'xticklabel', {'V', 'N', 'I'})

     hold on
     ax = gca;
     ax.XGrid = 'off';
     ax.YGrid = 'off';
 end

% criterion
  for iDet = 2:numel(dprimefieldnames) % for each condition (all, nontarget present, nontarget absent)
     subplot(2,2,iDet+1)
     for iTarget = 1:2
         for iValid = 1:3
             b = bar(xcoords_SDT(iTarget, iValid), detc.(dprimefieldnames{iDet})(iTarget, iValid));
             hold on 
             for iSub = 1:15
                s = scatter(xcoords_scatter(iValid, iSub, iTarget), detc_scatterplot.(Detfieldnames{iDet})(iValid, iSub, iTarget));
                    s.MarkerEdgeColor = [1 1 1];
                    if iTarget == 1
                        s.MarkerFaceColor = fp.blue;
                    elseif iTarget == 2
                        s.MarkerFaceColor= fp.orange;
                    end
                     s.MarkerFaceAlpha = shade_scatter(iValid);
            end
              kt_figureStyle();
             errorbar(xcoords_SDT(iTarget, iValid),detc.(dprimefieldnames{iDet})(iTarget, iValid),detcErr.(dprimefieldnames{iDet})(iTarget, iValid), '.k', 'MarkerSize',0.1, 'CapSize', 0, 'LineWidth', 1.75)
             % if iDet == 2
                 if iTarget == 1
                     b.FaceColor = fp.blue;
                     b.EdgeColor = fp.blue;
                 elseif iTarget == 2
                     b.FaceColor= fp.orange;
                     b.EdgeColor = fp.orange;
                 end
                 b.FaceAlpha = shade(iValid);
                 b.EdgeAlpha = shade(iValid);
                 b.BarWidth = 0.2;
             % elseif iDet == 3
             %     b.FaceColor = [1 1 1];
             %     b.EdgeAlpha = shade(iValid);
             %     if iTarget == 1
             %         b.EdgeColor = fp.blue;
             %     elseif iTarget == 2
             %         b.EdgeColor = fp.orange;
             %     end
             %     b.LineWidth = 2;
             %     b.BarWidth = 0.18;
             %     b.EdgeAlpha = shade(iValid);
             % end

         end
     end

     hold on
      ylim([-2 2])
     if iDet == 2
         kt_annotateStats(1,.25,'***');
         kt_drawBracket(.7778, 1.2222, .175)

         kt_annotateStats(1.89,.25,'*');
         kt_drawBracket(1.7778, 2, .175)
         % kt_annotateStats(2,.27,'~');
         % kt_drawBracket(1.7778, 2.2222, .38)

         kt_annotateStats(1,1.1,'_______');
        kt_annotateStats(1,1.15,'** Validity');

        kt_annotateStats(1.5, 1.6,'___________________');
        kt_annotateStats(1.5, 1.65,'** Validity');

     elseif iDet == 3
         kt_annotateStats(1.1111,.5,'*');
         kt_drawBracket(1, 1.2222, 0.275)

           kt_annotateStats(1.5, 1.6,'___________________');
        kt_annotateStats(1.5, 1.65,'*** Target');
    
     end

     ylabel('target detection c')
     % ylim([-0.75 0.75])
     ax = gca;
     set(gca, 'ytick', -2:1:2)
     hold on
     xlim([0.5 2.5])
     xticks([0.7778 1 1.222 1.7778 2 2.2222])
     set(gca, 'xticklabel', {'V', 'N', 'I'})

     hold on
     ax = gca;
     ax.XGrid = 'off';
     ax.YGrid = 'off';
  end

%    shade_scatter = [.6 .5 .25];
% for iDet = 2:numel(Detfieldnames)
%     subplot(2,2,iDet+1)
%     for iTarget = 1:2
%         for iValid = 1:3
%             for iSub = 1:15
%                 s = scatter(xcoords_scatter(iValid, iSub, iTarget), detc_scatterplot.(Detfieldnames{iDet})(iValid, iSub, iTarget));
%                     s.MarkerEdgeColor = [1 1 1];
%                     if iTarget == 1
%                         s.MarkerFaceColor = fp.blue;
%                     elseif iTarget == 2
%                         s.MarkerFaceColor= fp.orange;
%                     end
%                      s.MarkerFaceAlpha = shade_scatter(iValid);
%             end
%         end
%     end
% end 

% 
% [ax1, h1] = suplabel('Non-target Present', 'y', [0.08 0.08 .84 1.325]);
% [ax2, h2] = suplabel('Non-target Absent', 'y', [0.08 0.08 .84 0.375]);
[ax3, h3] = suplabel('Non-target Absent', 't', [0.08 0.08 1.3 0.9]);
[ax4, h4] = suplabel('Non-target Present', 't', [0.08 0.08 .45 0.9]);
[ax5, h5] = suplabel('T1', 'tt', [0.08 0.08 .27 0.86]);
[ax6, h6] = suplabel('T2', 'tt', [0.08 0.08 .6 0.86]);
[ax7, h7] = suplabel('T1', 'tt', [0.08 0.08 1.16 0.86]);
[ax8, h8] = suplabel('T2', 'tt', [0.08 0.08 1.49 0.86]);

%% plot discrimination
% dprime
dprimefieldnames = fieldnames(dataAll(iSub).disd);
critfieldnames = fieldnames(dataAll(iSub).disc);
shade_scatter = [.6 .5 .25];
shade = [1, .6, .35];
figure();
for iDis = 2:numel(dprimefieldnames) % for each condition (all, nontarget present, nontarget absent)
    subplot(2,2,iDis-1)
    kt_figureStyle();

    for iTarget = 1:2
        for iValid = 1:3
            b = bar(xcoords_SDT(iTarget, iValid), disd.(dprimefieldnames{iDis})(iTarget, iValid));
            hold on
            for iSub = 1:15
                s = scatter(xcoords_scatter(iValid, iSub, iTarget), disd_scatterplot.(Detfieldnames{iDis})(iValid, iSub, iTarget));
                s.MarkerEdgeColor = [1 1 1];
                if iTarget == 1
                    s.MarkerFaceColor = fp.blue;
                elseif iTarget == 2
                    s.MarkerFaceColor= fp.orange;
                    end
                     s.MarkerFaceAlpha = shade_scatter(iValid);
            end
             errorbar(xcoords_SDT(iTarget, iValid),disd.(dprimefieldnames{iDis})(iTarget, iValid),disdErr.(dprimefieldnames{iDis})(iTarget, iValid), '.k', 'MarkerSize',0.1, 'CapSize', 0, 'LineWidth', 1.75)
             % if iDis == 2
                 if iTarget == 1
                     b.FaceColor = fp.blue;
                     b.EdgeColor = fp.blue;
                 elseif iTarget == 2
                     b.FaceColor= fp.orange;
                     b.EdgeColor = fp.orange;
                 end
                 b.FaceAlpha = shade(iValid);
                 b.EdgeAlpha = shade(iValid);
                 b.BarWidth = 0.2;

         end
     end

     hold on
     if iDis == 2
         kt_annotateStats(1,2.2,'**');
         kt_drawBracket(.7778, 1.2222, .60)

         kt_annotateStats(2,3.02,'*');
         kt_drawBracket(1.7778, 2.2222, .80)
         % kt_annotateStats(2.1111,2.9,'~');
         % kt_drawBracket(2, 2.2222, .85)

         kt_annotateStats(1,5.5,'_______');
        kt_annotateStats(1,5.55,'* Validity');


         kt_annotateStats(2,5.5,'_______');
        kt_annotateStats(2,5.55,'* Validity');

        kt_annotateStats(1.5, 6.1,'___________________');
        kt_annotateStats(1.5, 6.2,'*** Target');
        kt_annotateStats(1.5,6.6,'** Validity');
      elseif iDis == 3
         kt_annotateStats(1,2.98,'*');
         kt_drawBracket(.7778, 1.2222, .60)

         kt_annotateStats(2,3.7,'*');
         kt_drawBracket(1.7778, 2.2222, .75)
         kt_annotateStats(1.89,3.2,'*');
         kt_drawBracket(1.7778, 2, .65)


         kt_annotateStats(1,5.5,'_______');
        kt_annotateStats(1,5.55,'* Validity');


         kt_annotateStats(2,5.5,'_______');
        kt_annotateStats(2,5.55,'* Validity');

        kt_annotateStats(1.5, 6.1,'___________________');
        kt_annotateStats(1.5, 6.2,'* Target');
        kt_annotateStats(1.5,6.6,'*** Validity');

     end

     ylabel("target discrimination d'")
     ylim([0 7])
     ax = gca;
     set(gca, 'ytick', 0:1:7)
     hold on
     xlim([0.5 2.5])
     xticks([0.7778 1 1.222 1.7778 2 2.2222])
     set(gca, 'xticklabel', {'V', 'N', 'I'})

     hold on
     ax = gca;
     ax.XGrid = 'off';
     ax.YGrid = 'off';
 end

% criterion
  for iDis = 2:numel(dprimefieldnames) % for each condition (all, nontarget present, nontarget absent)
     subplot(2,2,iDis+1)
     kt_figureStyle();
     for iTarget = 1:2
         for iValid = 1:3
             b = bar(xcoords_SDT(iTarget, iValid), disc.(dprimefieldnames{iDis})(iTarget, iValid));
             hold on 
              for iSub = 1:15
                s = scatter(xcoords_scatter(iValid, iSub, iTarget), disc_scatterplot.(Detfieldnames{iDis})(iValid, iSub, iTarget));
                    s.MarkerEdgeColor = [1 1 1];
                    if iTarget == 1
                        s.MarkerFaceColor = fp.blue;
                    elseif iTarget == 2
                        s.MarkerFaceColor= fp.orange;
                    end
                     s.MarkerFaceAlpha = shade_scatter(iValid);
              end
             errorbar(xcoords_SDT(iTarget, iValid),disc.(dprimefieldnames{iDis})(iTarget, iValid),discErr.(dprimefieldnames{iDis})(iTarget, iValid), '.k', 'MarkerSize',0.1, 'CapSize', 0, 'LineWidth', 1.75)
                 if iTarget == 1
                     b.FaceColor = fp.blue;
                     b.EdgeColor = fp.blue;
                 elseif iTarget == 2
                     b.FaceColor= fp.orange;
                     b.EdgeColor = fp.orange;
                 end
                 b.FaceAlpha = shade(iValid);
                 b.EdgeAlpha = shade(iValid);
                 b.BarWidth = 0.2;
         end
     end

     hold on
     ylim([-2 2])
     if iDis == 2
         kt_annotateStats(2.1111,.4,'**');
         kt_drawBracket(2, 2.2222, 0.25)

         kt_annotateStats(2,1.1,'_______');
        kt_annotateStats(2,1.15,'** Validity');

         kt_annotateStats(1.5, 1.6,'___________________');
         kt_annotateStats(1.5, 1.65,'*** Target:Validity');
     end

     ylabel('target discrimination c')
     ax = gca;
     set(gca, 'ytick', -2:1:2)
     hold on
     xlim([0.5 2.5])
     xticks([0.7778 1 1.222 1.7778 2 2.2222])
     set(gca, 'xticklabel', {'V', 'N', 'I'})

     hold on
     ax = gca;
     ax.XGrid = 'off';
     ax.YGrid = 'off';
  end

% [ax1, h1] = suplabel('Non-target Present', 'y', [0.08 0.08 .84 1.325]);
% [ax2, h2] = suplabel('Non-target Absent', 'y', [0.08 0.08 .84 0.375]);
[ax3, h3] = suplabel('Non-target Absent', 't', [0.08 0.08 1.3 0.9]);
[ax4, h4] = suplabel('Non-target Present', 't', [0.08 0.08 .45 0.9]);
[ax5, h5] = suplabel('T1', 'tt', [0.08 0.08 .27 0.86]);
[ax6, h6] = suplabel('T2', 'tt', [0.08 0.08 .6 0.86]);
[ax7, h7] = suplabel('T1', 'tt', [0.08 0.08 1.16 0.86]);
[ax8, h8] = suplabel('T2', 'tt', [0.08 0.08 1.49 0.86]);

%% SDT variables - detection
for iContrast = 1:numel(contrastConds)
    contrastNames = {'target present/nontarget present', 'target present/nontarget absent', 'target absent/nontarget present', 'target absent/nontarget absent'};
    figure;
    sgtitle([contrastNames{iContrast} ' ga' ])
    subplot(3,2,1)
    b = bar([detnh(iContrast,:,1); detnh(iContrast,:,2)]);
    title('hits')
    ylabel('# hit trials')
    set(gca, 'xticklabel', {'T1', 'T2'})
    subplot(3,2,2)
    b = bar([detnfa(iContrast,:,1); detnfa(iContrast,:,2)]);
    title('false alarms')
    ylabel('# false alarm trials')
    set(gca, 'xticklabel', {'T1', 'T2'})
    subplot(3,2,5)
    b = bar([((detnfa(iContrast,:,1)./detnnoise(iContrast,:,1)))*100; ((detnfa(iContrast,:,2)./detnnoise(iContrast,:,2))*100)]);
    title('false alarms rate')
    ylabel('% false alarm')
    set(gca, 'xticklabel', {'T1', 'T2'})
    ylim([0 15])
    subplot(3,2,3)
    b = bar([detnsignal(iContrast,:,1); detnsignal(iContrast,:,2)]);
    title('signal')
    ylabel('# signal trials')
    set(gca, 'xticklabel', {'T1', 'T2'})
    subplot(3,2,4)
    b = bar([detnnoise(iContrast,:,1); detnnoise(iContrast,:,2)]);
    title('noise')
    ylabel('# noise trials')
    set(gca, 'xticklabel', {'T1', 'T2'})
end
%% SDT collpased cueing cond 
%% plot detection
dprimefieldnames = fieldnames(dataAll(iSub).detd);
critfieldnames = fieldnames(dataAll(iSub).detc);
figure();
sgtitle('ga SDT collapsed acrossed cueing conds')
subplot(2,2,1)
for iF = 1:numel(dprimefieldnames)
    b = bar([detdColl.all; detdColl.nontargetPresent; detdColl.nontargetAbsent]);
    hold on
    for k = 1:numel(b)      % code to align error bars to grouped subplot bar coordinate, revised from stack exchange   % Recent MATLAB Versions
        xtips = b(k).XEndPoints;
        ytips = b(k).YEndPoints;
        errorbar(xtips,ytips,detdErrColl.(dprimefieldnames{iF})(1,k), '.k', 'MarkerSize',0.1)
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
    b = bar([detcColl.all; detcColl.nontargetPresent; detcColl.nontargetAbsent]);
    hold on
    for k = 1:numel(b)      % code to align error bars to grouped subplot bar coordinate, revised from stack exchange   % Recent MATLAB Versions
        xtips = b(k).XEndPoints;
        ytips = b(k).YEndPoints;
        errorbar(xtips,ytips,detcErrColl.(dprimefieldnames{iF})(1,k), '.k', 'MarkerSize',0.1)
    end
    hold off
    title('detection c')
    ylabel('c')
    ylim([-0.75 0.75])
    set(gca, 'xticklabel', {'all', 'ntp', 'nta'})
end


hold on

dprimefieldnames = fieldnames(dataAll(iSub).disd);
critfieldnames = fieldnames(dataAll(iSub).detc);
for iF = 1:numel(dprimefieldnames) % for each condition (all, nontarget present, nontarget absent)
    subplot(2,2,2)
    b = bar([disdColl.all; disdColl.nontargetPresent; disdColl.nontargetAbsent]);
    hold on
    for k = 1:numel(b)      % code to align error bars to grouped subplot bar coordinate, revised from stack exchange   % Recent MATLAB Versions
        xtips = b(k).XEndPoints;
        ytips = b(k).YEndPoints;
        errorbar(xtips,ytips,disdErrColl.(dprimefieldnames{iF})(:,k), '.k', 'MarkerSize',0.1) 
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
    b = bar([discColl.all; discColl.nontargetPresent; discColl.nontargetAbsent]);
     hold on
    for k = 1:numel(b)      % code to align error bars to grouped subplot bar coordinate, revised from stack exchange   % Recent MATLAB Versions
        xtips = b(k).XEndPoints;
        ytips = b(k).YEndPoints;
        errorbar(xtips,ytips,discErrColl.(dprimefieldnames{iF})(:,k), '.k', 'MarkerSize',0.1)
    end
    hold off
    title('discrimination c')
    ylabel('c')
    ylim([-0.75 0.75])
    set(gca, 'xticklabel', {'all', 'ntp', 'nta'})
end
legend('T1', 'T2')
legend('Location', 'best')
ax = gca;
ax.XGrid = 'off';
ax.YGrid = 'off';



%% confusability maps for all conditions and one target conditions
% % get proportions for all conditions by T1, T2, and both targets collapsed
CMAll.TargetT1 = CM.allTprop(:,:,1); 
CMAll.TargetT2 = CM.allTprop(:,:,2); 
CMAll.TargetAll = (CMAll.TargetT1 + CMAll.TargetT2) / 2;
CMAll.NontargetT2 = CM.allNprop(:,:,2); 
CMAll.NontargetT1 = CM.allNprop(:,:,1); 
CMAll.NontargetAll = (CMAll.NontargetT1 + CMAll.NontargetT2) / 2;

% get proportions for one target conditions by T1, T2, and both targets collapsed
CMOneT.TargetT1 = CM.oneTprop(:,:,1); 
CMOneT.TargetT2 = CM.oneTprop(:,:,2); 
CMOneT.TargetAll = (CMOneT.TargetT1 + CMOneT.TargetT2) / 2;
CMOneT.NontargetT2 = CM.oneNprop(:,:,2); 
CMOneT.NontargetT1 = CM.oneNprop(:,:,1); 
CMOneT.NontargetAll = (CMOneT.NontargetT1 + CMOneT.NontargetT2) / 2;

% CM all conditions
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

% CM one target
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

% plot CM by attention
CMVfieldnames = fieldnames(TCMV.all);
for iCond = 1:2
    for iValidity = 1:numel(CMVfieldnames) % for validity
        CMVAll.TargetT1 = TCMV.(validfieldnames{iCond}).(validityNames{iValidity})(:,:,1);
        CMVAll.TargetT2 = TCMV.(validfieldnames{iCond}).(validityNames{iValidity})(:,:,2);
        CMVAll.TargetAll = (CMVAll.TargetT1 + CMVAll.TargetT2) / 2;
        CMVAll.NontargetT2 = NCMV.(validfieldnames{iCond}).(validityNames{iValidity})(:,:,2);
        CMVAll.NontargetT1 = NCMV.(validfieldnames{iCond}).(validityNames{iValidity})(:,:,1);
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

     for iCond = 1:2
         TCMV_diff.(validfieldnames{iCond}).diff = TCMV.(validfieldnames{iCond}).valid - TCMV.(validfieldnames{iCond}).invalid;
         NCMV_diff.(validfieldnames{iCond}).diff = NCMV.(validfieldnames{iCond}).valid - NCMV.(validfieldnames{iCond}).invalid;
     end


      % plot valid-invalid by contrast condition
     for iCond = 1:2
         CMVAll.TargetT1 = TCMV_diff.(validfieldnames{iCond}).diff(:,:,1); % difference for target all/one condition for T1
         CMVAll.TargetT2 = TCMV_diff.(validfieldnames{iCond}).diff(:,:,2); % difference for target all/one condition for T2
         CMVAll.TargetAll = (CMVAll.TargetT1 + CMVAll.TargetT2) / 2; % difference for target all/one condition for all targets
         CMVAll.NontargetT2 = NCMV_diff.(validfieldnames{iCond}).diff(:,:,2);% difference for nontarget all/one condition for T2
         CMVAll.NontargetT1 = NCMV_diff.(validfieldnames{iCond}).diff(:,:,1);% difference for nontarget all/one condition for T1
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


