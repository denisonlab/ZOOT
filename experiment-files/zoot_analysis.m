clear all

fp = figureparams;
%% compile 

subs = {'test'};
fields = {'precue','target', 'T1Contrast', 'T2Contrast', 'seen', 'correct', 'correctDis', 'eyeSkip'}; % fieldnames(data);
for iF = 1:numel(fields) % initialize
    dataAll.(fields{iF}) = [];
end


for iSub=1:length(subs) % for participant

    SID = subs{iSub};
    behDir = ['/Users/jennymotzer/Documents/GitHub/ZOOT/experiment-files/data/' SID '/beh/'];
    cd(behDir);
    sessions = {'no click'};
    for iSession = 1:numel(sessions) % for session
        sesNum = sessions{iSession};
        sesDir = ['/Users/jennymotzer/Documents/GitHub/ZOOT/experiment-files/data/' SID '/beh/' sesNum];
        cd(sesDir)
        findFiles = dir('*_block3_*.mat'); % for session shouldn't be hardcoded, find way to find highest block # and load it?
        for iFile = 1:length(findFiles) % for file
            fileName = findFiles(iFile).name;
            load(fileName)
            for iF = 1:numel(fields) % initialize
                if strcmp(fields{iF}, 'eyeSkip') == 1
                    data.(fields{iF}) = data.(fields{iF})';
                end
                dataAll.(fields{iF}) = [dataAll.(fields{iF}) data.(fields{iF})]; % compiles data structures from one participant
            end
        end
    end
end

%% filter  
correct = dataAll.correct == 1;
T1Contrast = dataAll.T1Contrast;
T2Contrast = dataAll.T2Contrast;
eyeSkip = dataAll.eyeSkip == 1;
precue = dataAll.precue;
target = dataAll.target;

%target presence 
PresentPresent = T1Contrast == 1 & T2Contrast == 1 & correct; %& ~eyeSkip;
PresentAbsent = T1Contrast == 1 & T2Contrast == 2 & correct ;%& ~eyeSkip;
AbsentPresent = T1Contrast == 2 & T2Contrast == 1 & correct ;%& ~eyeSkip;
AbsentAbsent = T1Contrast == 2 & T2Contrast == 2 & correct ;%& ~eyeSkip;

nPresentPresent = T1Contrast == 1 & T2Contrast == 1 ;%& ~eyeSkip;
nPresentAbsent = T1Contrast == 1 & T2Contrast == 2 ;%& ~eyeSkip;
nAbsentPresent = T1Contrast == 2 & T2Contrast == 1 ;%& ~eyeSkip;
nAbsentAbsent = T1Contrast == 2 & T2Contrast == 2 ;% ~eyeSkip;

targPresAcc = [sum(PresentPresent)/sum(nPresentPresent) sum(PresentAbsent)/sum(nPresentAbsent) sum(AbsentPresent)/sum(nAbsentPresent) sum(AbsentAbsent)/sum(nAbsentAbsent)]*100;

% validity 

Neutral = precue == 3 & correct ;%& ~eyeSkip;
Invalid = (precue == 1| precue == 2) & precue ~= target & correct ;%& ~eyeSkip;
Valid = precue == target & correct ;%& ~eyeSkip;

nValid = precue == target ;%& ~eyeSkip;
nInvalid = (precue == 1| precue == 2) & precue ~= target;% & ~eyeSkip;
nNeutral = precue == 3  ;% &~eyeSkip;

validityAcc = [sum(Valid)/sum(nValid) sum(Invalid)/sum(nInvalid) sum(Neutral)/sum(nNeutral)]*100;


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

%% figures

%target presence
figure(1);
targetPresence = bar(targPresAcc);
ylim([40 100])
title('accuracy per target presence')
ylabel('accuracy %')
set(gca, 'ytick', 40:10:100)
set(gca, 'xticklabel', {'Present/Present', 'Present/Absent', 'Absent/Present', 'Absent/Absent'})
ytickformat('percentage')
ax = gca;
ax.XGrid = 'off';
ax.YGrid = 'off';

%% validity accuracy 
figure(2);
sgtitle('attention condition accuracy per target')
subplot(1,3,3)
validity = validityAcc;
b = bar(validity);
ylim([40 100])
title('GA')
set(gca, 'ytick', 40:10:100)
set(gca, 'xticklabel', {'Valid', 'Neutral', 'Invalid'})
ytickformat('percentage')
ax = gca;
ax.XGrid = 'off';
ax.YGrid = 'off';
b.FaceColor = 'flat';
b.CData(1,:) = fp.blue;
b.CData(2,:) = fp.orange;
b.CData(3,:) = fp.gold;
subplot(1,3,1)
T1Acc = t1ValidityAcc;
b = bar(T1Acc);
ylim([40 100])
title('T1')
ylabel('accuracy %')
set(gca, 'ytick', 40:10:100)
set(gca, 'xticklabel', {'Valid', 'Neutral', 'Invalid'})
ytickformat('percentage')
ax = gca;
ax.XGrid = 'off';
ax.YGrid = 'off';
b.FaceColor = 'flat';
b.CData(1,:) = fp.blue;
b.CData(2,:) = fp.orange;
b.CData(3,:) = fp.gold;
subplot(1,3,2)
T2Acc = t2ValidityAcc;
b = bar(T2Acc);
ylim([40 100])
title('T2')
set(gca, 'ytick', 40:10:100)
set(gca, 'xticklabel', {'Valid', 'Neutral', 'Invalid'})
ytickformat('percentage')
ax = gca;
ax.XGrid = 'off';
ax.YGrid = 'off';
b.FaceColor = 'flat';
b.CData(1,:) = fp.blue;
b.CData(2,:) = fp.orange;
b.CData(3,:) = fp.gold;

%% figure 3
figure(3)
sgtitle('target presence x attention condition accuracy')
subplot(2,2,1) %two rows, two columns, first position
PrePreAcc = PrePre;
b = bar(PrePreAcc);
ylim([40 100])
title('present/present')
ylabel('accuracy %')
set(gca, 'ytick', 40:10:100)
set(gca, 'xticklabel', {'Valid', 'Neutral', 'Invalid'})
ytickformat('percentage')
b.FaceColor = 'flat';
b.CData(1,:) = fp.blue;
b.CData(2,:) = fp.orange;
b.CData(3,:) = fp.gold;

subplot(2,2,2)
PreAbsAcc = PreAbs;
b = bar(PreAbsAcc);
ylim([40 100])
title('present/absent')
set(gca, 'ytick',40:10:100)
set(gca, 'xticklabel', {'Valid', 'Neutral', 'Invalid'})
ytickformat('percentage')
b.FaceColor = 'flat';
b.CData(1,:) = fp.blue;
b.CData(2,:) = fp.orange;
b.CData(3,:) = fp.gold;

subplot(2,2,3)
AbsPreAcc = AbsPre;
b = bar(AbsPreAcc);
ylim([40 100])
title('absent/present')
ylabel('accuracy %')
set(gca, 'ytick', 40:10:100)
set(gca, 'xticklabel', {'Valid', 'Neutral', 'Invalid'})
ytickformat('percentage')
b.FaceColor = 'flat';
b.CData(1,:) = fp.blue;
b.CData(2,:) = fp.orange;
b.CData(3,:) = fp.gold;

subplot(2,2,4)
AbsAbsAcc = AbsAbs;
b = bar(AbsAbsAcc);
ylim([40 100])
title('absent/absent')
set(gca, 'ytick', 40:10:100)
set(gca, 'xticklabel', {'Valid', 'Neutral', 'Invalid'})
ytickformat('percentage')
b.FaceColor = 'flat';
b.CData(1,:) = fp.blue;
b.CData(2,:) = fp.orange;
b.CData(3,:) = fp.gold;

ax = gca;
ax.XGrid = 'off';
ax.YGrid = 'off';

%% figure 4
figure(4)
sgtitle('target presence x attention condition x target accuracy')
subplot(2,2,1) %two rows, two columns, first position
PrePreAcc = [PrePreT1; PrePreT2];
b = bar(PrePreAcc);
ylim([40 100])
title('present/present')
ylabel('accuracy %')
set(gca, 'ytick', 40:10:100)
set(gca, 'xticklabel', {'T1', 'T2'})
ytickformat('percentage')


subplot(2,2,2)
PreAbsAcc = [PreAbsT1; PreAbsT2];
b = bar(PreAbsAcc);
ylim([40 100])
title('present/absent')
set(gca, 'ytick',40:10:100)
set(gca, 'xticklabel', {'T1', 'T2'})
ytickformat('percentage')


subplot(2,2,3)
AbsPreAcc = [AbsPreT1; AbsPreT2];
b = bar(AbsPreAcc);
ylim([40 100])
title('absent/present')
ylabel('accuracy %')
set(gca, 'ytick', 40:10:100)
set(gca, 'xticklabel', {'T1', 'T2'})
ytickformat('percentage')

subplot(2,2,4)
AbsAbsAcc = [AbsAbsT1; AbsAbsT2];
b = bar(AbsAbsAcc);
ylim([40 100])
title('absent/absent')
set(gca, 'ytick', 40:10:100)
set(gca, 'xticklabel', {'T1', 'T2'})
ytickformat('percentage')

legend('Valid', 'Neutral', 'Invalid')
lgd.Layout.Tile = 'east';
ax = gca;
ax.XGrid = 'off';
ax.YGrid = 'off';


%% figure 5
figure(5)
sgtitle('target presence x attention condition x target accuracy')
subplot(2,2,1) %two rows, two columns, first position
PrePreAcc = [PrePreT1; PrePreT2];
b = bar(PrePreAcc);
ylim([40 100])
title('target present/nontarget present')
ylabel('accuracy %')
set(gca, 'ytick', 40:10:100)
set(gca, 'xticklabel', {'T1', 'T2'})
ytickformat('percentage')


subplot(2,2,2)
PreAbsAcc = [PreAbsT1; AbsPreT2];
b = bar(PreAbsAcc);
ylim([40 100])
title('target present/nontarget absent')
set(gca, 'ytick',40:10:100)
set(gca, 'xticklabel', {'T1', 'T2'})
ytickformat('percentage')


subplot(2,2,3)
AbsPreAcc = [AbsPreT1; PreAbsT2];
b = bar(AbsPreAcc);
ylim([40 100])
title('target absent/nontarget present')
ylabel('accuracy %')
set(gca, 'ytick', 40:10:100)
set(gca, 'xticklabel', {'T1', 'T2'})
ytickformat('percentage')

subplot(2,2,4)
AbsAbsAcc = [AbsAbsT1; AbsAbsT2];
b = bar(AbsAbsAcc);
ylim([40 100])
title('target absent/nontarget absent')
set(gca, 'ytick', 40:10:100)
set(gca, 'xticklabel', {'T1', 'T2'})
ytickformat('percentage')

legend('Valid', 'Neutral', 'Invalid')
lgd.Layout.Tile = 'east';
ax = gca;
ax.XGrid = 'off';
ax.YGrid = 'off';

