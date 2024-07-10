clear all

saveplots = 0;

fp = figureparams;

addpath('/Users/jennymotzer/Documents/GitHub/ZOOT/experiment-files/functions/')

%% compile
subs = {'S0004', 'S0005', 'S0007', 'S0013', 'S0015', 'S0019', 'S0070', 'S0071', 'S0085', 'S0108', 'S0122', 'S0133'};
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


    %% det accuracy

    % sort data by contrast condition, validity, and target and get averages
    % per condition as matrices

    for iTarget = 1:2 % for each target (1 or 2)
        for iContrastCond = 1:4 % for each contrast condition (PP, PA, AP, AA)
            for iValidity = 1:3 % for each precue validity (Valid, Neutral, Invalid)
                pIdx = dataAll(iSub).target == iTarget & Validities{iValidity} & contrastConds{iContrastCond} & dataAll(iSub).targetContrast == 1 & ~dataAll(iSub).eyeSkip; % index for finding relevant trials for the denominator of each condition
                Acc.pN(iContrastCond, iValidity, iTarget) = size(find(pIdx),2); % denominator, number of trials per condition
                Acc.pSeen(iContrastCond, iValidity, iTarget) = size(dataAll(iSub).seen(pIdx & dataAll(iSub).seen==1),2); % numerator, number of trials that meet a certain rule (correct, seen, correctDis, RT)
                Acc.pProp(iContrastCond, iValidity, iTarget) = Acc.pSeen(iContrastCond, iValidity, iTarget)/Acc.pN(iContrastCond, iValidity, iTarget);

                aIdx = dataAll(iSub).target == iTarget & Validities{iValidity} & contrastConds{iContrastCond} & dataAll(iSub).targetContrast == 0 & ~dataAll(iSub).eyeSkip;
                Acc.aN(iContrastCond, iValidity, iTarget) = size(find(aIdx),2); % denominator, number of trials per condition
                Acc.aSeen(iContrastCond, iValidity, iTarget) = size(dataAll(iSub).seen(aIdx & dataAll(iSub).seen==0),2); % numerator, number of trials that meet a certain rule (correct, seen, correctDis, RT)
                Acc.aProp(iContrastCond, iValidity, iTarget) = Acc.aSeen(iContrastCond, iValidity, iTarget)/Acc.aN(iContrastCond, iValidity, iTarget);
            end
        end
    end

    Acc.prop = [Acc.pProp(1:2,:,:);Acc.aProp(3:4,:,:)]; % combines arrays that show accuracy for detecting target when present (tp/np, tp/na) and when absent (ta/np, ta/na) to give a 4 x 3 x 2 array
    AccNT.prop = [mean(Acc.pProp(1:2,:,:)); mean(Acc.aProp(3:4,:,:))];

    dataAll(iSub).means = Acc.prop*100; % save each participant's mean data in dataAll
    dataAll(iSub).meansNT = AccNT.prop*100;


end % subject

%% means 
accIdx = []; % used to collect each position of the matrix (each condition) by participant into a list to perform std and mean, then create new matrices for std, mean, and error
for iContrast = 1:4
    for iValid = 1:3
        for iTarget = 1:2
            for iSub = 1:length(subs)
                accIdx = [accIdx dataAll(iSub).means(iContrast,iValid,iTarget)]; % collects the accuracy of each condition by each participant into a list so can do group analysis
            end
            Acc.std(iContrast,iValid,iTarget) = std(accIdx); % finds std of the accuracy of each condition for each participant
            Acc.mean(iContrast, iValid, iTarget) = mean(accIdx); % finds means of accuracy for each condition for each participant
            Acc.err(iContrast,iValid,iTarget) = Acc.std(iContrast,iValid,iTarget)/sqrt(size(dataAll,2)); % calculate error for each condition
            accIdx = [];
        end
    end
end

accNTIdx = [];
for iValid = 1:3
    for iTarget = 1:2
        for iPresence = 1:2
            for iSub = 1:length(subs)
                accNTIdx = [accNTIdx dataAll(iSub).meansNT(iPresence,iValid,iTarget)]; % collects the accuracy of each condition by each participant into a list so can do group analysis
            end
            AccNT.std(iPresence,iValid,iTarget) = std(accNTIdx); % finds std of the accuracy of each condition for each participant
            AccNT.mean(iPresence,iValid,iTarget)= mean(accNTIdx); % finds means of accuracy for each condition for each participant
            AccNT.err(iPresence,iValid,iTarget) = AccNT.std(iPresence,iValid,iTarget)/sqrt(size(dataAll,2)); % calculate error for each condition
            accNTIdx = [];
        end
    end
end
 

%% plot
figure();
sgtitle('ga det accuracy')
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
    b = bar([AccNT.mean(iF,:,1); AccNT.mean(iF,:,2)]);
    hold on
    for k = 1:numel(b)      % code to align error bars to grouped subplot bar coordinate, revised from stack exchange   % Recent MATLAB Versions
        xtips = b(k).XEndPoints;
        ytips = b(k).YEndPoints;
        errorbar(xtips,ytips,AccNT.err(iF,k), '.k', 'MarkerSize',0.1)
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


