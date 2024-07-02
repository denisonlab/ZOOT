clear all

saveplots = 0; % set to 1 to save figures to participant behav data 

fp = figureparams;

%% compile
subs = {'S0004'};
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

    %% variables

    %Validity
    Valid = dataAll.precue == dataAll.target;
    Neutral = dataAll.precue == 3;
    Invalid = (dataAll.precue == 1| dataAll.precue == 2) & dataAll.precue ~= dataAll.target;

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

    % target/nontarget present/absent
    PresentPresent = dataAll.targetContrast == 1 & dataAll.nonTargetContrast == 1;
    PresentAbsent = dataAll.targetContrast == 1 & dataAll.nonTargetContrast == 0;
    AbsentPresent =dataAll.targetContrast == 0 & dataAll.nonTargetContrast == 1;
    AbsentAbsent = dataAll.targetContrast == 0 & dataAll.nonTargetContrast == 0;

    Validities = {Valid Neutral Invalid};
    contrastConds = {PresentPresent PresentAbsent AbsentPresent AbsentAbsent};

%% cost benefit
%% accuracy 
   % sort data by contrast condition, validity, and target and get averages
    % per condition as matrices
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

    % calculate benefit and cost for each target and contrast condition
    for iContrastCond = 1:size(Acc.prop,1)
        for iTarget = 1:2
            benefit(iContrastCond, iTarget) = (Acc.prop(iContrastCond,1,iTarget) - Acc.prop(iContrastCond,2,iTarget)) / (Acc.prop(iContrastCond,1,iTarget) - Acc.prop(iContrastCond,3,iTarget));
            cost(iContrastCond, iTarget) = (Acc.prop(iContrastCond,2,iTarget) - Acc.prop(iContrastCond,3,iTarget)) / (Acc.prop(iContrastCond,1,iTarget) - Acc.prop(iContrastCond,3,iTarget));
        end
    end

    % organize/pair benefit and cost values per target and contrast condition (T1 benefit with T2 cost, etc)
    list = [];
    for iContrastCond = 1:size(Acc.prop,1)
        list = [list; benefit(iContrastCond, 1) cost(iContrastCond, 2) benefit(iContrastCond, 2) cost(iContrastCond, 1)] ;
    end


    figure;
    for i = 1:4
        subplot(2,2,i)
        index = [list(i,1:2); list(i,3:4)];
        b = bar(index); 
        condTitle = [{'target present/nontarget present'} {'target present/nontarget absent'} {'target absent/nontarget present'} {'target absent/nontarget absent'}];
        title([condTitle{i}])
        ylabel('cost benefit analysis')
         ylim([-5 6])
        % set(gca, 'ytick', 30:10:100)
        % set(gca, 'xticklabel', {'T1', 'T2'})
        % ytickformat('percentage')
        hold on
    end 
end 