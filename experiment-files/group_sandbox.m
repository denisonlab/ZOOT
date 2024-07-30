clear all

saveplots = 0;

fp = figureparams;

addpath('/Users/jennymotzer/Documents/GitHub/ZOOT/experiment-files/functions/')

%% compile
subs = {'S0004', 'S0005', 'S0007', 'S0013', 'S0015', 'S0018', 'S0019', 'S0070', 'S0071', 'S0085', 'S0105','S0108', 'S0122', 'S0133'};
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

     
end % subject




