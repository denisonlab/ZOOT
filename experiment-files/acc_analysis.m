clear all


%% load data 

subs = {'pilot'};

for iSub=length(subs)
    SID = subs{iSub};
    % direc = dir(['data/' SID '/beh/']);
    % files = dir(fullfile(direc, '*.mat'));
    % for j = 1:numel(files)
    %     filename = files(j).name ;
    %     load(filename)
    files = {'pilot_mainExpt_240229_1011_block1_session1.mat', 'pilot_mainExpt_240229_1018_block2_session1.mat', 'pilot_mainExpt_240229_1023_block3_session1.mat','pilot_mainExpt_240229_1026_block4_session1.mat', 'pilot_mainExpt_240229_1029_block5_session1.mat', 'pilot_mainExpt_240229_1032_block6_session1.mat', 'pilot_mainExpt_240229_1038_block7_session1.mat', 'pilot_mainExpt_240229_1041_block8_session1.mat', 'pilot_mainExpt_240229_1051_block9_session1.mat', 'pilot_mainExpt_240229_1054_block10_session1.mat'};
    for iFile=1:numel(files)
        filename = files{iFile};
        load(filename) 
    end 
end 


%% attention condition

precue = data.precue;
target = data.target;

nTrialsCompleted = numel(precue);
findNeut = find(precue == 3);
nNeut = numel(findNeut);
findVal = find(precue == target);
nVal = numel(findVal);
nInval = nTrialsCompleted - nNeut - nVal;

nSum = 0;
vSum = 0;
iSum = 0;

for iAttCond = 1:numel(precue)
    if data.correct(iAttCond) == 1
        if precue(iAttCond) == 3 % neutral precue
            nSum = nSum + 1;
        elseif precue(iAttCond) == target(iAttCond) % valid precue
            vSum = vSum + 1;
        elseif precue(iAttCond) ~= target(iAttCond)% invalid precue
            iSum = iSum + 1;
        end
    end 
end 

nAcc = (nSum / nNeut)*100;
vAcc = (vSum / nVal)*100;
iAcc = (iSum / nInval)*100;

figure(1);
subplot(1,3,3)
vec = [vAcc nAcc iAcc];
bar(vec)
ylim([40 100])
title('GA')
ylabel('accuracy %')
set(gca, 'ytick', 50:10:100)
set(gca, 'xticklabel', {'Valid', 'Neutral', 'Invalid'})
ytickformat('percentage')
ax = gca;
ax.XGrid = 'off';
ax.YGrid = 'off';


nT1Sum = 0;
vT1Sum = 0;
iT1Sum = 0;
nT2Sum = 0;
vT2Sum = 0;
iT2Sum = 0;

for iAttCond = 1:numel(precue)
    if target(iAttCond) == 1
    if data.correct(iAttCond) == 1
        if precue(iAttCond) == 3 % neutral precue
            nT1Sum = nT1Sum + 1;
        elseif precue(iAttCond) == target(iAttCond) % valid precue
            vT1Sum = vT1Sum + 1;
        elseif precue(iAttCond) ~= target(iAttCond)% invalid precue
            iT1Sum = iT1Sum + 1;
        end
    end
    end 
    if target(iAttCond) == 2
    if data.correct(iAttCond) == 1
        if precue(iAttCond) == 3 % neutral precue
            nT2Sum = nT2Sum + 1;
        elseif precue(iAttCond) == target(iAttCond) % valid precue
            vT2Sum = vT2Sum + 1;
        elseif precue(iAttCond) ~= target(iAttCond)% invalid precue
            iT2Sum = iT2Sum + 1;
        end
    end
    end 
end 

nT1Neut = 0;
nT1Val = 0;
nT1Inval = 0;
nT2Neut = 0;
nT2Val = 0;
nT2Inval = 0;
for iAttCond = 1:numel(precue)
    if target(iAttCond) == 1
        if precue(iAttCond) == 3 % neutral precue
            nT1Neut = nT1Neut + 1;
        elseif precue(iAttCond) == target(iAttCond) % valid precue
            nT1Val = nT1Val + 1;
        elseif precue(iAttCond) ~= target(iAttCond)% invalid precue
            nT1Inval = nT1Inval + 1;
        end
    end
    if target(iAttCond) == 2
        if precue(iAttCond) == 3 % neutral precue
            nT2Neut = nT2Neut + 1;
        elseif precue(iAttCond) == target(iAttCond) % valid precue
            nT2Val = nT2Val + 1;
        elseif precue(iAttCond) ~= target(iAttCond)% invalid precue
            nT2Inval = nT2Inval + 1;
        end
    end
end


nT1Acc = (nT1Sum / nT1Neut)*100;
vT1Acc = (vT1Sum / nT1Val)*100;
iT1Acc = (iT1Sum / nT1Inval)*100;
nT2Acc = (nT2Sum / nT2Neut)*100;
vT2Acc = (vT2Sum / nT2Val)*100;
iT2Acc = (iT2Sum / nT2Inval)*100;

subplot(1,3,1)
T1Acc = [vT1Acc nT1Acc iT1Acc];
bar(T1Acc)
ylim([40 100])
title('T1')
ylabel('accuracy %')
set(gca, 'ytick', 50:10:100)
set(gca, 'xticklabel', {'Valid', 'Neutral', 'Invalid'})
ytickformat('percentage')
ax = gca;
ax.XGrid = 'off';
ax.YGrid = 'off';


subplot(1,3,2)
T2Acc = [vT2Acc nT2Acc iT2Acc];
bar(T2Acc)
ylim([40 100])
title('T2')
ylabel('accuracy %')
set(gca, 'ytick', 50:10:100)
set(gca, 'xticklabel', {'Valid', 'Neutral', 'Invalid'})
ytickformat('percentage')
ax = gca;
ax.XGrid = 'off';
ax.YGrid = 'off';

%% target presence 

T1Contrast = data.T1Contrast;
T2Contrast = data.T2Contrast;

nTrialsCompleted = numel(precue);
nTPC = nTrialsCompleted/4; % number of trials per target presence condition (evenly divided between 4)

ppSum = 0;
paSum = 0;
apSum = 0;
aaSum = 0;
for iAttCond = 1:numel(precue)
    if data.correct(iAttCond) == 1
        if T1Contrast(iAttCond) == 1 && T2Contrast(iAttCond) == 1 % neutral precue
            ppSum = ppSum + 1;
        elseif T1Contrast(iAttCond) == 1 && T2Contrast(iAttCond) == 2 % valid precue
            paSum = paSum + 1;
        elseif T1Contrast(iAttCond) == 2 && T2Contrast(iAttCond) == 1 % invalid precue
            apSum = apSum + 1;
        elseif T1Contrast(iAttCond) == 2 && T2Contrast(iAttCond) == 2 % invalid precue
            aaSum = aaSum + 1;
        end
    end
end 

ppAcc = (ppSum / nTPC)*100;
paAcc = (paSum / nTPC)*100;
apAcc = (apSum / nTPC)*100;
aaAcc = (aaSum / nTPC)*100;

figure(2);
vec = [aaAcc paAcc apAcc ppAcc];
bar(vec)
ylim([50 100])
title('accuracy per target presence')
ylabel('accuracy %')
set(gca, 'ytick', 50:10:100)
set(gca, 'xticklabel', {'Absent/Absent', 'Present/Absent', 'Absent/Present', 'Present/Present'})
ytickformat('percentage')
ax = gca;
ax.XGrid = 'off';
ax.YGrid = 'off';


%% accuracy of target presence + attention condition

nppSum = 0; %pp
vppSum = 0;
ippSum = 0;
npaSum = 0; %pa
vpaSum = 0;
ipaSum = 0;
napSum = 0; %ap
vapSum = 0;
iapSum = 0;
naaSum = 0; %aa
vaaSum = 0;
iaaSum = 0;

for iAttCond = 1:numel(precue) % for loop to find correct trials
    if data.correct(iAttCond) == 1
        if T1Contrast(iAttCond) == 1 && T2Contrast(iAttCond) == 1 % pp
            if precue(iAttCond) == 3 % neutral precue
                nppSum = nppSum + 1;
            elseif precue(iAttCond) == target(iAttCond) % valid precue
                vppSum = vppSum + 1;
            elseif precue(iAttCond) ~= target(iAttCond)% invalid precue
                ippSum = ippSum + 1;
            end
        elseif T1Contrast(iAttCond) == 1 && T2Contrast(iAttCond) == 2 % pa
            if precue(iAttCond) == 3 % neutral precue
                npaSum = npaSum + 1;
            elseif precue(iAttCond) == target(iAttCond) % valid precue
                vpaSum = vpaSum + 1;
            elseif precue(iAttCond) ~= target(iAttCond)% invalid precue
                ipaSum = ipaSum + 1;
            end
        elseif T1Contrast(iAttCond) == 2 && T2Contrast(iAttCond) == 1 % ap
            if precue(iAttCond) == 3 % neutral precue
                napSum = napSum + 1;
            elseif precue(iAttCond) == target(iAttCond) % valid precue
                vapSum = vapSum + 1;
            elseif precue(iAttCond) ~= target(iAttCond)% invalid precue
                iapSum = iapSum + 1;
            end
        elseif T1Contrast(iAttCond) == 2 && T2Contrast(iAttCond) == 2 % aa
            if precue(iAttCond) == 3 % neutral precue
                naaSum = naaSum + 1;
            elseif precue(iAttCond) == target(iAttCond) % valid precue
                vaaSum = vaaSum + 1;
            elseif precue(iAttCond) ~= target(iAttCond)% invalid precue
                iaaSum = iaaSum + 1;
            end
        end 
    end 
end 


nNPP = 0; %pp
nVPP = 0;
nIPP = 0;
nNPA = 0; %pa
nVPA = 0;
nIPA = 0;
nNAP = 0; %ap
nVAP = 0;
nIAP = 0;
nNAA = 0; %aa
nVAA = 0;
nIAA = 0;

for iAttCond = 1:numel(precue) % for loop to find num of all trials per condition
    if T1Contrast(iAttCond) == 1 && T2Contrast(iAttCond) == 1 % pp
        if precue(iAttCond) == 3 % neutral precue
            nNPP = nNPP + 1;
        elseif precue(iAttCond) == target(iAttCond) % valid precue
            nVPP = nVPP + 1;
        elseif precue(iAttCond) ~= target(iAttCond)% invalid precue
            nIPP = nIPP + 1;
        end
    elseif T1Contrast(iAttCond) == 1 && T2Contrast(iAttCond) == 2 % pa
        if precue(iAttCond) == 3 % neutral precue
            nNPA = nNPA + 1;
        elseif precue(iAttCond) == target(iAttCond) % valid precue
            nVPA = nVPA + 1;
        elseif precue(iAttCond) ~= target(iAttCond)% invalid precue
            nIPA = nIPA + 1;
        end
    elseif T1Contrast(iAttCond) == 2 && T2Contrast(iAttCond) == 1 % ap
        if precue(iAttCond) == 3 % neutral precue
            nNAP = nNAP + 1;
        elseif precue(iAttCond) == target(iAttCond) % valid precue
            nVAP = nVAP + 1;
        elseif precue(iAttCond) ~= target(iAttCond)% invalid precue
            nIAP = nIAP + 1;
        end
    elseif T1Contrast(iAttCond) == 2 && T2Contrast(iAttCond) == 2 % aa
        if precue(iAttCond) == 3 % neutral precue
            nNAA = nNAA + 1;
        elseif precue(iAttCond) == target(iAttCond) % valid precue
            nVAA = nVAA + 1;
        elseif precue(iAttCond) ~= target(iAttCond)% invalid precue
            nIAA = nIAA + 1;
        end
    end

end

nppAcc = (nppSum / nNPP)*100; % pp
vppAcc = (vppSum / nVPP)*100;
ippAcc = (ippSum / nIPP)*100;
npaAcc = (npaSum / nNPA)*100; % pa
vpaAcc = (vpaSum / nVPA)*100;
ipaAcc = (ipaSum / nIPA)*100;
napAcc = (napSum / nNAP)*100; % ap
vapAcc = (vapSum / nVAP)*100;
iapAcc = (iapSum / nIAP)*100;
naaAcc = (naaSum / nNAA)*100; % aa
vaaAcc = (vaaSum / nVAA)*100;
iaaAcc = (iaaSum / nIAA)*100;


figure(3)
subplot(2,2,1) %two rows, two columns, first position
vec1 = [vppAcc nppAcc ippAcc];
bar(vec1)
ylim([40 100])
title('present/present')
ylabel('accuracy %')
set(gca, 'ytick', 50:10:100)
set(gca, 'xticklabel', {'Valid', 'Neutral', 'Invalid'})
ytickformat('percentage')

subplot(2,2,2)
vec2 = [vpaAcc npaAcc ipaAcc];
bar(vec2)
ylim([40 100])
title('present/absent')
ylabel('accuracy %')
set(gca, 'ytick', 50:10:100)
set(gca, 'xticklabel', {'Valid', 'Neutral', 'Invalid'})
ytickformat('percentage')

subplot(2,2,3)
vec3 = [vapAcc napAcc iapAcc];
bar(vec3)
ylim([40 100])
title('absent/present')
ylabel('accuracy %')
set(gca, 'ytick', 50:10:100)
set(gca, 'xticklabel', {'Valid', 'Neutral', 'Invalid'})
ytickformat('percentage')

subplot(2,2,4)
vec4 = [vaaAcc naaAcc iaaAcc];
bar(vec4)
ylim([40 100])
title('absent/absent')
ylabel('accuracy %')
set(gca, 'ytick', 50:10:100)
set(gca, 'xticklabel', {'Valid', 'Neutral', 'Invalid'})
ytickformat('percentage')

ax = gca;
ax.XGrid = 'off';
ax.YGrid = 'off';
