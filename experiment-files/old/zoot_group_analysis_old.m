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
    % beh comp
    % behDir = ['/home/denisonlab-beh/Experiments/ZOOT/experiment-files/data' SID '/beh'];
    cd(behDir);
    dataAll(iSub).subjectID = SID;
    fields = {'precue','target', 'T1Contrast', 'T2Contrast', 'targetContrast', 'seen', 'correct', 'correctDis', 'session', 'eyeSkip'}; % fieldnames(data);
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
            % splitID = splitName{1};
            % splitExpt = splitName{2};
            % splitDate = splitName{3};
            % splitTime = splitName{4};
            splitBlock = splitName{5};
            % splitSesMat = splitName{6};
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

        %% filter

        correct = dataAll(iSub).correct == 1;
        T1Contrast =dataAll(iSub).T1Contrast;
        T2Contrast = dataAll(iSub).T2Contrast;
        eyeSkip = dataAll(iSub).eyeSkip;
        precue = dataAll(iSub).precue;
        target = dataAll(iSub).target;
        seen = dataAll(iSub).seen == 1 & ~eyeSkip;
        correctDis = dataAll(iSub).correctDis == 1 & ~eyeSkip;
        targetContrast = dataAll(iSub).targetContrast;

        %target presence
        PresentPresent = T1Contrast == 1 & T2Contrast == 1 & correct & ~eyeSkip;
        PresentAbsent = T1Contrast == 1 & T2Contrast == 2 & correct  & ~eyeSkip;
        AbsentPresent = T1Contrast == 2 & T2Contrast == 1 & correct & ~eyeSkip;
        AbsentAbsent = T1Contrast == 2 & T2Contrast == 2 & correct & ~eyeSkip;

        nPresentPresent = T1Contrast == 1 & T2Contrast == 1 & ~eyeSkip;
        nPresentAbsent = T1Contrast == 1 & T2Contrast == 2 & ~eyeSkip;
        nAbsentPresent = T1Contrast == 2 & T2Contrast == 1 & ~eyeSkip;
        nAbsentAbsent = T1Contrast == 2 & T2Contrast == 2 & ~eyeSkip;

        targPresAcc = [sum(PresentPresent)/sum(nPresentPresent) sum(PresentAbsent)/sum(nPresentAbsent) sum(AbsentPresent)/sum(nAbsentPresent) sum(AbsentAbsent)/sum(nAbsentAbsent)]*100;

        % validity

        Neutral = precue == 3 & correct & ~eyeSkip;
        Invalid = (precue == 1| precue == 2) & precue ~= target & correct & ~eyeSkip;
        Valid = precue == target & correct & ~eyeSkip;

        nValid = precue == target & ~eyeSkip;
        nInvalid = (precue == 1| precue == 2) & precue ~= target & ~eyeSkip;
        nNeutral = precue == 3 & ~eyeSkip;

        validityAcc = [sum(Valid)/sum(nValid) sum(Neutral)/sum(nNeutral) sum(Invalid)/sum(nInvalid)]*100;


        % validity x target
        ValidT1 = Valid & target == 1;
        InvalidT1 = Invalid & target == 1;
        NeutralT1 = Neutral & target == 1;
        ValidT2 = Valid & target == 2;
        InvalidT2 = Invalid & target == 2;
        NeutralT2 = Neutral & target == 2;

        nValidT1 = nValid & target ==1;
        nInvalidT1 = nInvalid & target == 1;
        nNeutralT1 = nNeutral & target == 1;
        nValidT2 = nValid & target == 2;
        nInvalidT2 = nInvalid & target == 2;
        nNeutralT2 = nNeutral & target == 2;

        t1ValidityAcc = [sum(ValidT1)/sum(nValidT1) sum(NeutralT1)/sum(nNeutralT1) sum(InvalidT1)/sum(nInvalidT1)]*100;
        t2ValidityAcc =[sum(ValidT2)/sum(nValidT2) sum(NeutralT2)/sum(nNeutralT2) sum(InvalidT2)/sum(nInvalidT2)]*100;

        % target presence x validity
        valPrePre = PresentPresent & Valid;
        invalPrePre = PresentPresent & Invalid;
        neutPrePre = PresentPresent & Neutral;
        valPreAbs = PresentAbsent & Valid;
        invalPreAbs = PresentAbsent & Invalid;
        neutPreAbs = PresentAbsent & Neutral;
        valAbsPre = AbsentPresent & Valid;
        invalAbsPre = AbsentPresent & Invalid;
        neutAbsPre = AbsentPresent & Neutral;
        valAbsAbs = AbsentAbsent & Valid;
        invalAbsAbs = AbsentAbsent & Invalid;
        neutAbsAbs = AbsentAbsent & Neutral;

        nValPrePre = nPresentPresent & nValid;
        nInvalPrePre = nPresentPresent & nInvalid;
        nNeutPrePre = nPresentPresent & nNeutral;
        nValPreAbs = nPresentAbsent & nValid;
        nInvalPreAbs = nPresentAbsent & nInvalid;
        nNeutPreAbs = nPresentAbsent & nNeutral;
        nValAbsPre = nAbsentPresent & nValid;
        nInvalAbsPre = nAbsentPresent & nInvalid;
        nNeutAbsPre = nAbsentPresent & nNeutral;
        nValAbsAbs = nAbsentAbsent & nValid;
        nInvalAbsAbs = nAbsentAbsent & nInvalid;
        nNeutAbsAbs = nAbsentAbsent & nNeutral;

        PrePre = [sum(valPrePre)/sum(nValPrePre) sum(neutPrePre)/sum(nNeutPrePre) sum(invalPrePre)/sum(nInvalPrePre)]*100;
        PreAbs = [sum(valPreAbs)/sum(nValPreAbs) sum(neutPreAbs)/sum(nNeutPreAbs) sum(invalPreAbs)/sum(nInvalPreAbs)]*100;
        AbsPre = [sum(valAbsPre)/sum(nValAbsPre) sum(neutAbsPre)/sum(nNeutAbsPre) sum(invalAbsPre)/sum(nInvalAbsPre)]*100;
        AbsAbs = [sum(valAbsAbs)/sum(nValAbsAbs) sum(neutAbsAbs)/sum(nNeutAbsAbs) sum(invalAbsAbs)/sum(nInvalAbsAbs)]*100;

        % target presence x attention condition x target
        valPrePreT1 = PresentPresent & ValidT1;
        invalPrePreT1 = PresentPresent & InvalidT1;
        neutPrePreT1 = PresentPresent & NeutralT1;
        valPreAbsT1 = PresentAbsent & ValidT1;
        invalPreAbsT1 = PresentAbsent & InvalidT1;
        neutPreAbsT1 = PresentAbsent & NeutralT1;
        valAbsPreT1 = AbsentPresent & ValidT1;
        invalAbsPreT1 = AbsentPresent & InvalidT1;
        neutAbsPreT1 = AbsentPresent & NeutralT1;
        valAbsAbsT1 = AbsentAbsent & ValidT1;
        invalAbsAbsT1 = AbsentAbsent & InvalidT1;
        neutAbsAbsT1 = AbsentAbsent & NeutralT1;

        valPrePreT2 = PresentPresent & ValidT2;
        invalPrePreT2 = PresentPresent & InvalidT2;
        neutPrePreT2 = PresentPresent & NeutralT2;
        valPreAbsT2 = PresentAbsent & ValidT2;
        invalPreAbsT2 = PresentAbsent & InvalidT2;
        neutPreAbsT2 = PresentAbsent & NeutralT2;
        valAbsPreT2 = AbsentPresent & ValidT2;
        invalAbsPreT2 = AbsentPresent & InvalidT2;
        neutAbsPreT2 = AbsentPresent & NeutralT2;
        valAbsAbsT2 = AbsentAbsent & ValidT2;
        invalAbsAbsT2 = AbsentAbsent & InvalidT2;
        neutAbsAbsT2 = AbsentAbsent & NeutralT2;

        nValPrePreT1 = nPresentPresent & nValidT1;
        nInvalPrePreT1 = nPresentPresent & nInvalidT1;
        nNeutPrePreT1 = nPresentPresent & nNeutralT1;
        nValPreAbsT1 = nPresentAbsent & nValidT1;
        nInvalPreAbsT1 = nPresentAbsent & nInvalidT1;
        nNeutPreAbsT1 = nPresentAbsent & nNeutralT1;
        nValAbsPreT1 = nAbsentPresent & nValidT1;
        nInvalAbsPreT1 = nAbsentPresent & nInvalidT1;
        nNeutAbsPreT1 = nAbsentPresent & nNeutralT1;
        nValAbsAbsT1 = nAbsentAbsent & nValidT1;
        nInvalAbsAbsT1 = nAbsentAbsent & nInvalidT1;
        nNeutAbsAbsT1 = nAbsentAbsent & nNeutralT1;

        nValPrePreT2 = nPresentPresent & nValidT2;
        nInvalPrePreT2 = nPresentPresent & nInvalidT2;
        nNeutPrePreT2 = nPresentPresent & nNeutralT2;
        nValPreAbsT2 = nPresentAbsent & nValidT2;
        nInvalPreAbsT2 = nPresentAbsent & nInvalidT2;
        nNeutPreAbsT2 = nPresentAbsent & nNeutralT2;
        nValAbsPreT2 = nAbsentPresent & nValidT2;
        nInvalAbsPreT2 = nAbsentPresent & nInvalidT2;
        nNeutAbsPreT2 = nAbsentPresent & nNeutralT2;
        nValAbsAbsT2 = nAbsentAbsent & nValidT2;
        nInvalAbsAbsT2 = nAbsentAbsent & nInvalidT2;
        nNeutAbsAbsT2 = nAbsentAbsent & nNeutralT2;

        PrePreT1 = [sum(valPrePreT1)/sum(nValPrePreT1) sum(neutPrePreT1)/sum(nNeutPrePreT1) sum(invalPrePreT1)/sum(nInvalPrePreT1)]*100;
        PreAbsT1 = [sum(valPreAbsT1)/sum(nValPreAbsT1) sum(neutPreAbsT1)/sum(nNeutPreAbsT1) sum(invalPreAbsT1)/sum(nInvalPreAbsT1)]*100;
        AbsPreT1 = [sum(valAbsPreT1)/sum(nValAbsPreT1) sum(neutAbsPreT1)/sum(nNeutAbsPreT1) sum(invalAbsPreT1)/sum(nInvalAbsPreT1)]*100;
        AbsAbsT1 = [sum(valAbsAbsT1)/sum(nValAbsAbsT1) sum(neutAbsAbsT1)/sum(nNeutAbsAbsT1) sum(invalAbsAbsT1)/sum(nInvalAbsAbsT1)]*100;
        PrePreT2 = [sum(valPrePreT2)/sum(nValPrePreT2) sum(neutPrePreT2)/sum(nNeutPrePreT2) sum(invalPrePreT2)/sum(nInvalPrePreT2)]*100;
        PreAbsT2 = [sum(valPreAbsT2)/sum(nValPreAbsT2) sum(neutPreAbsT2)/sum(nNeutPreAbsT2) sum(invalPreAbsT2)/sum(nInvalPreAbsT2)]*100;
        AbsPreT2 = [sum(valAbsPreT2)/sum(nValAbsPreT2) sum(neutAbsPreT2)/sum(nNeutAbsPreT2) sum(invalAbsPreT2)/sum(nInvalAbsPreT2)]*100;
        AbsAbsT2 = [sum(valAbsAbsT2)/sum(nValAbsAbsT2) sum(neutAbsAbsT2)/sum(nNeutAbsAbsT2) sum(invalAbsAbsT2)/sum(nInvalAbsAbsT2)]*100;

        dataAll(iSub).means = [PrePreT1 PrePreT2 PreAbsT1 AbsPreT2 AbsPreT1 PreAbsT2 AbsAbsT1 AbsAbsT2];

        %% seen 

% p(seen) by target presence
seenPresentPresent = T1Contrast == 1 & T2Contrast == 1 & seen & ~eyeSkip;
seenPresentAbsent = T1Contrast == 1 & T2Contrast == 2 & seen & ~eyeSkip;
seenAbsentPresent = T1Contrast == 2 & T2Contrast == 1 & seen & ~eyeSkip;
seenAbsentAbsent = T1Contrast == 2 & T2Contrast == 2 & seen  & ~eyeSkip;

seenTarget = [sum(seenPresentPresent, 'omitnan')/sum(nPresentPresent) sum(seenPresentAbsent, 'omitnan')/sum(nPresentAbsent) sum(seenAbsentPresent, 'omitnan')/sum(nAbsentPresent) sum(seenAbsentAbsent, 'omitnan')/sum(nAbsentAbsent)];

% seen x validity 
seenNeutral = precue == 3 & seen & ~eyeSkip;
seenInvalid = (precue == 1| precue == 2) & precue ~= target & seen & ~eyeSkip;
seenValid = precue == target & seen & ~eyeSkip;

% seen x validity x target 
seenValidT1 = seenValid & target == 1;
seenInvalidT1 = seenInvalid & target == 1;
seenNeutralT1 = seenNeutral & target == 1;
seenValidT2 = seenValid & target == 2;
seenInvalidT2 = seenInvalid & target == 2;
seenNeutralT2 = seenNeutral & target == 2;

% seen x validity x target x presence 
valPrePreT1seen = seenPresentPresent & seenValidT1;
invalPrePreT1seen = seenPresentPresent & seenInvalidT1;
neutPrePreT1seen = seenPresentPresent & seenNeutralT1;
valPreAbsT1seen = seenPresentAbsent & seenValidT1;
invalPreAbsT1seen = seenPresentAbsent & seenInvalidT1;
neutPreAbsT1seen = seenPresentAbsent & seenNeutralT1;
valAbsPreT1seen = seenAbsentPresent & seenValidT1;
invalAbsPreT1seen = seenAbsentPresent & seenInvalidT1;
neutAbsPreT1seen = seenAbsentPresent & seenNeutralT1;
valAbsAbsT1seen = seenAbsentAbsent & seenValidT1;
invalAbsAbsT1seen = seenAbsentAbsent & seenInvalidT1;
neutAbsAbsT1seen = seenAbsentAbsent & seenNeutralT1;

valPrePreT2seen = seenPresentPresent & seenValidT2;
invalPrePreT2seen = seenPresentPresent & seenInvalidT2;
neutPrePreT2seen = seenPresentPresent & seenNeutralT2;
valPreAbsT2seen = seenPresentAbsent & seenValidT2;
invalPreAbsT2seen = seenPresentAbsent & seenInvalidT2;
neutPreAbsT2seen = seenPresentAbsent & seenNeutralT2;
valAbsPreT2seen = seenAbsentPresent & seenValidT2;
invalAbsPreT2seen = seenAbsentPresent & seenInvalidT2;
neutAbsPreT2seen = seenAbsentPresent & seenNeutralT2;
valAbsAbsT2seen = seenAbsentAbsent & seenValidT2;
invalAbsAbsT2seen = seenAbsentAbsent & seenInvalidT2;
neutAbsAbsT2seen = seenAbsentAbsent & seenNeutralT2;


seenPrePreT1 = [sum(valPrePreT1seen)/sum(nValPrePreT1) sum(neutPrePreT1seen)/sum(nNeutPrePreT1) sum(invalPrePreT1seen)/sum(nInvalPrePreT1)]*100;
seenPreAbsT1 = [sum(valPreAbsT1seen)/sum(nValPreAbsT1) sum(neutPreAbsT1seen)/sum(nNeutPreAbsT1) sum(invalPreAbsT1seen)/sum(nInvalPreAbsT1)]*100;
seenAbsPreT1 = [sum(valAbsPreT1seen)/sum(nValAbsPreT1) sum(neutAbsPreT1seen)/sum(nNeutAbsPreT1) sum(invalAbsPreT1seen)/sum(nInvalAbsPreT1)]*100;
seenAbsAbsT1 = [sum(valAbsAbsT1seen)/sum(nValAbsAbsT1) sum(neutAbsAbsT1seen)/sum(nNeutAbsAbsT1) sum(invalAbsAbsT1seen)/sum(nInvalAbsAbsT1)]*100;
seenPrePreT2 = [sum(valPrePreT2seen)/sum(nValPrePreT2) sum(neutPrePreT2seen)/sum(nNeutPrePreT2) sum(invalPrePreT2seen)/sum(nInvalPrePreT2)]*100;
seenPreAbsT2 = [sum(valPreAbsT2seen)/sum(nValPreAbsT2) sum(neutPreAbsT2seen)/sum(nNeutPreAbsT2) sum(invalPreAbsT2seen)/sum(nInvalPreAbsT2)]*100;
seenAbsPreT2 = [sum(valAbsPreT2seen)/sum(nValAbsPreT2) sum(neutAbsPreT2seen)/sum(nNeutAbsPreT2) sum(invalAbsPreT2seen)/sum(nInvalAbsPreT2)]*100;
seenAbsAbsT2 = [sum(valAbsAbsT2seen)/sum(nValAbsAbsT2) sum(neutAbsAbsT2seen)/sum(nNeutAbsAbsT2) sum(invalAbsAbsT2seen)/sum(nInvalAbsAbsT2)]*100;


    end
end

%% get means and standard error
mean_accumulate = [];
for iSub = 1:size(dataAll, 2)
    mean_accumulate = [mean_accumulate; dataAll(iSub).means];
end

mean_group = mean(mean_accumulate, 1); 

errPPT1v = std(mean_accumulate(:,1)/sqrt(size(dataAll,2)));
errPPT1n = std(mean_accumulate(:,2)/sqrt(size(dataAll,2)));
errPPT1i = std(mean_accumulate(:,3)/sqrt(size(dataAll,2)));

errPPT2v = std(mean_accumulate(:,4)/sqrt(size(dataAll,2)));
errPPT2n = std(mean_accumulate(:,5)/sqrt(size(dataAll,2)));
errPPT2i = std(mean_accumulate(:,6)/sqrt(size(dataAll,2)));

errTPNP = [errPPT1v errPPT1n errPPT1i; errPPT2v errPPT2n errPPT2i]; % present present error

errPAT1v = std(mean_accumulate(:,7)/sqrt(size(dataAll,2)));
errPAT1n = std(mean_accumulate(:,8)/sqrt(size(dataAll,2)));
errPAT1i = std(mean_accumulate(:,9)/sqrt(size(dataAll,2)));

errAPT2v = std(mean_accumulate(:,10)/sqrt(size(dataAll,2)));
errAPT2n = std(mean_accumulate(:,11)/sqrt(size(dataAll,2)));
errAPT2i = std(mean_accumulate(:,12)/sqrt(size(dataAll,2)));

errTPNA = [errPAT1v errPAT1n errPAT1i; errAPT2v errAPT2n errAPT2i];

errAPT1v = std(mean_accumulate(:,13)/sqrt(size(dataAll,2)));
errAPT1n = std(mean_accumulate(:,14)/sqrt(size(dataAll,2)));
errAPT1i = std(mean_accumulate(:,15)/sqrt(size(dataAll,2)));

errPAT2v = std(mean_accumulate(:,16)/sqrt(size(dataAll,2)));
errPAT2n = std(mean_accumulate(:,17)/sqrt(size(dataAll,2)));
errPAT2i = std(mean_accumulate(:,18)/sqrt(size(dataAll,2)));

errTANP = [errAPT1v errAPT1n errAPT1i; errPAT2v errPAT2n errPAT2i];

errAAT1v = std(mean_accumulate(:,19)/sqrt(size(dataAll,2)));
errAAT1n = std(mean_accumulate(:,20)/sqrt(size(dataAll,2)));
errAAT1i = std(mean_accumulate(:,21)/sqrt(size(dataAll,2)));

erraAT2v = std(mean_accumulate(:,22)/sqrt(size(dataAll,2)));
errAAT2n = std(mean_accumulate(:,23)/sqrt(size(dataAll,2)));
errAAT2i = std(mean_accumulate(:,24)/sqrt(size(dataAll,2)));

errTANA = [errAAT1v errAAT1n errAAT1i; erraAT2v errAAT2n errAAT2i];


%% figures
%% figure 1 - target presence x validity x target
figure(1)
sgtitle('group analysis')
subplot(2,2,1) %two rows, two columns, first position
PrePreAcc = [mean_group(1:3); mean_group(4:6)];
b = bar(PrePreAcc, 'grouped');
hold on
for k = 1:numel(b)                                                      % Recent MATLAB Versions
    xtips = b(k).XEndPoints;
    ytips = b(k).YEndPoints;
    errorbar(xtips,ytips,errTPNP(:,k), '.k', 'MarkerSize',0.1) 
end
hold off
ylim([30 100])
title('target present/nontarget present')
ylabel('accuracy %')
set(gca, 'ytick', 30:10:100)
set(gca, 'xticklabel', {'T1', 'T2'})
ytickformat('percentage')


subplot(2,2,2)
PreAbsAcc = [mean_group(7:9); mean_group(10:12)];
b = bar(PreAbsAcc, 'grouped');
hold on
for k = 1:numel(b)                                                      % Recent MATLAB Versions
    xtips = b(k).XEndPoints;
    ytips = b(k).YEndPoints;
    errorbar(xtips,ytips,errTPNA(:,k), '.k', 'MarkerSize',0.1)
end
hold off
ylim([30 100])
title('target present/nontarget absent')
set(gca, 'ytick',30:10:100)
set(gca, 'xticklabel', {'T1', 'T2'})
ytickformat('percentage')


subplot(2,2,3)
AbsPreAcc = [mean_group(13:15); mean_group(16:18)];
b = bar(AbsPreAcc, 'grouped');
hold on
for k = 1:numel(b)                                                      % Recent MATLAB Versions
    xtips = b(k).XEndPoints;
    ytips = b(k).YEndPoints;
    errorbar(xtips,ytips,errTANP(:,k), '.k', 'MarkerSize',0.1)
end
hold off
ylim([30 100])
title('target absent/nontarget present')
ylabel('accuracy %')
set(gca, 'ytick', 30:10:100)
set(gca, 'xticklabel', {'T1', 'T2'})
ytickformat('percentage')

subplot(2,2,4)
AbsAbsAcc = [mean_group(19:21); mean_group(22:24)];
b = bar(AbsAbsAcc ,'grouped');
hold on
for k = 1:numel(b)                                                      % Recent MATLAB Versions
    xtips = b(k).XEndPoints;
    ytips = b(k).YEndPoints;
    errorbar(xtips,ytips,errTANA(:,k), '.k', 'MarkerSize',0.1)
end
hold off
ylim([30 100])
title('target absent/nontarget absent')
set(gca, 'ytick', 30:10:100)
set(gca, 'xticklabel', {'T1', 'T2'})
ytickformat('percentage')

legend('Valid', 'Neutral', 'Invalid')
lgd.Layout.Tile = 'east';
ax = gca;
ax.XGrid = 'off';
ax.YGrid = 'off';


%% p(seen) v p(corrDis)
%% p(seen) 

figure (2);
sgtitle('p(seen) x target presence')
subplot(2,2,1)
b = bar([seenPrePreT1; seenPrePreT2]);
ylim([30 100])
title('target present/nontarget present')
ylabel('p(seen)')
set(gca, 'ytick', 30:10:100)
set(gca, 'xticklabel', {'T1', 'T2'})
ytickformat('percentage')

subplot(2,2,2)
b = bar([seenPreAbsT1; seenAbsPreT2]);
ylim([30 100])
title('target present/nontarget absent')
ylabel('p(seen)')
set(gca, 'ytick', 30:10:100)
set(gca, 'xticklabel', {'T1', 'T2'})
ytickformat('percentage')


subplot(2,2,3)
b = bar([seenAbsPreT1; seenPreAbsT2]);
title('target absent/nontarget present')
ylim([30 100])
ylabel('p(seen)')
set(gca, 'ytick', 30:10:100)
set(gca, 'xticklabel', {'T1', 'T2'})
ytickformat('percentage')


subplot(2,2,4)
b = bar([seenAbsAbsT1; seenAbsAbsT2]);
title('target absent/nontarget absent')
ylim([30 100])
ylabel('p(seen)')
set(gca, 'ytick', 30:10:100)
set(gca, 'xticklabel', {'T1', 'T2'})
ytickformat('percentage')
ax = gca;
ax.XGrid = 'off';
ax.YGrid = 'off';

%% p(correct discrimination)












% %% target presence
% figure(2);
% targetPresence = bar(targPresAcc);
% ylim([40 100])
% title('accuracy per target presence')
% ylabel('accuracy %')
% set(gca, 'ytick', 40:10:100)
% set(gca, 'xticklabel', {'Present/Present', 'Present/Absent', 'Absent/Present', 'Absent/Absent'})
% ytickformat('percentage')
% ax = gca;
% ax.XGrid = 'off';
% ax.YGrid = 'off';
% 
% %% validity accuracy 
% figure(3);
% sgtitle('attention condition accuracy per target')
% subplot(1,3,3)
% validity = validityAcc;
% b = bar(validity);
% ylim([40 100])
% title('GA')
% set(gca, 'ytick', 40:10:100)
% set(gca, 'xticklabel', {'Valid', 'Neutral', 'Invalid'})
% ytickformat('percentage')
% ax = gca;
% ax.XGrid = 'off';
% ax.YGrid = 'off';
% b.FaceColor = 'flat';
% b.CData(1,:) = fp.blue;
% b.CData(2,:) = fp.orange;
% b.CData(3,:) = fp.gold;
% subplot(1,3,1)
% T1Acc = t1ValidityAcc;
% b = bar(T1Acc);
% ylim([40 100])
% title('T1')
% ylabel('accuracy %')
% set(gca, 'ytick', 40:10:100)
% set(gca, 'xticklabel', {'Valid', 'Neutral', 'Invalid'})
% ytickformat('percentage')
% ax = gca;
% ax.XGrid = 'off';
% ax.YGrid = 'off';
% b.FaceColor = 'flat';
% b.CData(1,:) = fp.blue;
% b.CData(2,:) = fp.orange;
% b.CData(3,:) = fp.gold;
% subplot(1,3,2)
% T2Acc = t2ValidityAcc;
% b = bar(T2Acc);
% ylim([40 100])
% title('T2')
% set(gca, 'ytick', 40:10:100)
% set(gca, 'xticklabel', {'Valid', 'Neutral', 'Invalid'})
% ytickformat('percentage')
% ax = gca;
% ax.XGrid = 'off';
% ax.YGrid = 'off';
% b.FaceColor = 'flat';
% b.CData(1,:) = fp.blue;
% b.CData(2,:) = fp.orange;
% b.CData(3,:) = fp.gold;
% 
% %% figure 3
% figure(4)
% sgtitle('target presence x attention condition accuracy')
% subplot(2,2,1) %two rows, two columns, first position
% PrePreAcc = PrePre;
% b = bar(PrePreAcc);
% ylim([40 100])
% title('present/present')
% ylabel('accuracy %')
% set(gca, 'ytick', 40:10:100)
% set(gca, 'xticklabel', {'Valid', 'Neutral', 'Invalid'})
% ytickformat('percentage')
% b.FaceColor = 'flat';
% b.CData(1,:) = fp.blue;
% b.CData(2,:) = fp.orange;
% b.CData(3,:) = fp.gold;
% 
% subplot(2,2,2)
% PreAbsAcc = PreAbs;
% b = bar(PreAbsAcc);
% ylim([40 100])
% title('present/absent')
% set(gca, 'ytick',40:10:100)
% set(gca, 'xticklabel', {'Valid', 'Neutral', 'Invalid'})
% ytickformat('percentage')
% b.FaceColor = 'flat';
% b.CData(1,:) = fp.blue;
% b.CData(2,:) = fp.orange;
% b.CData(3,:) = fp.gold;
% 
% subplot(2,2,3)
% AbsPreAcc = AbsPre;
% b = bar(AbsPreAcc);
% ylim([40 100])
% title('absent/present')
% ylabel('accuracy %')
% set(gca, 'ytick', 40:10:100)
% set(gca, 'xticklabel', {'Valid', 'Neutral', 'Invalid'})
% ytickformat('percentage')
% b.FaceColor = 'flat';
% b.CData(1,:) = fp.blue;
% b.CData(2,:) = fp.orange;
% b.CData(3,:) = fp.gold;
% 
% subplot(2,2,4)
% AbsAbsAcc = AbsAbs;
% b = bar(AbsAbsAcc);
% ylim([40 100])
% title('absent/absent')
% set(gca, 'ytick', 40:10:100)
% set(gca, 'xticklabel', {'Valid', 'Neutral', 'Invalid'})
% ytickformat('percentage')
% b.FaceColor = 'flat';
% b.CData(1,:) = fp.blue;
% b.CData(2,:) = fp.orange;
% b.CData(3,:) = fp.gold;
% 
% ax = gca;
% ax.XGrid = 'off';
% ax.YGrid = 'off';
% 
% %% figure 4
% figure(5)
% sgtitle('target presence x attention condition x target accuracy')
% subplot(2,2,1) %two rows, two columns, first position
% PrePreAcc = [PrePreT1; PrePreT2];
% b = bar(PrePreAcc);
% ylim([30 100])
% title('present/present')
% ylabel('accuracy %')
% set(gca, 'ytick', 30:10:100)
% set(gca, 'xticklabel', {'T1', 'T2'})
% ytickformat('percentage')
% 
% 
% subplot(2,2,2)
% PreAbsAcc = [PreAbsT1; PreAbsT2];
% b = bar(PreAbsAcc);
% ylim([30 100])
% title('present/absent')
% set(gca, 'ytick',30:10:100)
% set(gca, 'xticklabel', {'T1', 'T2'})
% ytickformat('percentage')
% 
% 
% subplot(2,2,3)
% AbsPreAcc = [AbsPreT1; AbsPreT2];
% b = bar(AbsPreAcc);
% ylim([30 100])
% title('absent/present')
% ylabel('accuracy %')
% set(gca, 'ytick', 30:10:100)
% set(gca, 'xticklabel', {'T1', 'T2'})
% ytickformat('percentage')
% 
% subplot(2,2,4)
% AbsAbsAcc = [AbsAbsT1; AbsAbsT2];
% b = bar(AbsAbsAcc);
% ylim([30 100])
% title('absent/absent')
% set(gca, 'ytick', 30:10:100)
% set(gca, 'xticklabel', {'T1', 'T2'})
% ytickformat('percentage')
% 
% legend('Valid', 'Neutral', 'Invalid')
% lgd.Layout.Tile = 'east';
% ax = gca;
% ax.XGrid = 'off';
% ax.YGrid = 'off';
% 
% 
% 
% 
