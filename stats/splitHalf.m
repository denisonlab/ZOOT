load('zoot_dataAll.mat')
%% accuracy 
TXNX = [{'PP'},{'AP'},{'PA'},{'AA'}];

%finds overall accuracy per participant
Acc_scatter_splitHalf_overAttTarg = [];
for i=1:numel(TXNX)  
    firstAverage = mean(Acc_scatterplot.(TXNX{i}),3); % takes average across targets (T1 and T2) per participant
    Acc_scatter_splitHalf_overAttTarg = [Acc_scatter_splitHalf_overAttTarg; mean(firstAverage,1)]; % takes average across attention conditions (VNI) 
    firstAverage = [];
end 
Acc_scatter_splitHalf_overall = mean(Acc_scatter_splitHalf_overAttTarg,1); % takes average across TXNX conditions to get one overall mean accuracy per participant

[sorted_array, original_indices] = sort(Acc_scatter_splitHalf_overall); % sorts participant mean averages from lowest to highest

%sort SIDs from lowest to highest to find bottom and top half of
%participants
sortedSubs_overall = [];
for i=1:numel(subs)
    sortedSubs_overall = [sortedSubs_overall subs(original_indices(i))];
end 

%split participants into bottom and top half based on overall mean accuracy
acc_bottomHalf = sortedSubs_overall(1:9);
acc_bottomHalf_indices = original_indices(1:9);
acc_topHalf = sortedSubs_overall(10:end);
acc_topHalf_indices = original_indices(10:end);

 %finds overall T2 accuracy
Acc_scatter_splitHalf_T2 = [];
for i=1:numel(TXNX)  
    avg = mean(Acc_scatterplot.(TXNX{i}),1);
    T2avg = avg(:,:,2);
    Acc_scatter_splitHalf_T2 = [Acc_scatter_splitHalf_T2; T2avg];
    avg = [];
end 
Acc_scatter_splitHalf_T2_overall = mean(Acc_scatter_splitHalf_T2,1);

[sorted_array_T2, original_indices_T2] = sort(Acc_scatter_splitHalf_T2_overall);

sortedSubs_T2_overall = [];
for i=1:numel(subs)
    sortedSubs_T2_overall = [sortedSubs_T2_overall subs(original_indices_T2(i))];
end 

acc_bottomHalf_T2 = sortedSubs_T2_overall(1:9);
acc_bottomHalf_T2_indices = original_indices_T2(1:9);
acc_topHalf_T2 = sortedSubs_T2_overall(10:end);
acc_topHalf_T2_indices = original_indices_T2(10:end);
% get group means for bottom half
txnx_contrasts = [{'PP'}, {'AP'}, {'PA'}, {'AA'}];
accIdx = [];
for iContrast = 1:numel(contrastConds)
    for iValid = 1:numel(Validities)
        for iTarget = 1:2
            for iSub = 1:length(acc_bottomHalf_indices)
                accIdx = [accIdx dataAll(acc_bottomHalf_indices(iSub)).means(iContrast,iValid,iTarget)]; % collects the accuracy of each condition by each participant into a list so can do group analysis
                Acc_bottom_scatterplot.(txnx_contrasts{iContrast})(iValid,iSub,iTarget) = dataAll(acc_bottomHalf_indices(iSub)).means(iContrast,iValid,iTarget);
            end
            Acc_bottom.std(iContrast,iValid,iTarget) = std(accIdx); % finds std of the accuracy of each condition for each participant
            Acc_bottom.mean(iContrast, iValid, iTarget) = mean(accIdx); % finds means of accuracy for each condition for each participant
            Acc_bottom.err(iContrast,iValid,iTarget) = Acc.std(iContrast,iValid,iTarget)/sqrt(size(dataAll,2)); % calculate error for each condition
            accIdx = [];
        end
    end
end

%% plot bottom half - accuracy
% Figure styling
fp = zoot_figureparams;
xVals = fp.xVals; 
clear panel 
figure
set(gcf,'Position',fp.rect)

count = 1;
tcl = tiledlayout(2,2,'TileSpacing','compact','OuterPosition',fp.OuterPosition); % adds y height
    for iC = 1:4 % 1 is TPNP; 2 is TANP; 3 is TPNA; 4 is TANA
        panel(count).info = nexttile;
        zoot_figureStyle
        xticklabels('')
        ylim([30 100]) % min changed to 30 there is an individual data point below 50 for TANP T1 V
        yticks(30:10:100)
        switch count
            case {3,4}
                xticklabels({'V','N','I','V','N','I'})
        end
        switch count
            case {1}
                ylabel('Accuracy (%)')
                title(sprintf('Target present\n'),'FontWeight','normal','FontSize',14)
                % [ax1, h1] = suplabel('Non-target Present', 'y', [0.08 0.08 .84 1.0]);
                % [ax2, h2] = suplabel('Non-target Absent', 'y', [0.08 0.08 .84 0.3]);
            case {2}
                title(sprintf('Target absent\n'),'FontWeight','normal','FontSize',14)
            case{3}
                ylabel('Accuracy (%)')
        end
        for iT = 1:2
            for iV = 1:3
                b = zoot_bar(xVals(iT,iV),squeeze(Acc_bottom_scatterplot.(contrasts{iC})(iV,:,iT)),...
                    iC,iV,iT,1,Acc.err(iC,iV,iT), 3);
            end
        end

      

        count = count+1;
    end
%% discrimination - subsampled over2N correction
NX = [{'nontargetPresent'}, {'nontargetAbsent'}];
%finds overall accuracy
dis_scatter_splitHalf_overAttTarg = [];
for i=1:numel(NX)  
    firstAverage = mean(disd_sub_over2N_scatterplot.(NX{i}),3); %averages across targets (T1, T2)
    dis_scatter_splitHalf_overAttTarg = [dis_scatter_splitHalf_overAttTarg; mean(firstAverage,1)]; % averages across attention conditions (VNI)
    firstAverage = [];
end 
dis_scatter_splitHalf_overall = mean(dis_scatter_splitHalf_overAttTarg,1); % averages across TXNX conditions

[dis_sorted_array, dis_original_indices] = sort(dis_scatter_splitHalf_overall); % sorts dis d' from lowest to highest

dis_sortedSubs_overall = [];
for i=1:numel(subs)
    dis_sortedSubs_overall = [dis_sortedSubs_overall subs(dis_original_indices(i))];
end 

dis_bottomHalf = dis_sortedSubs_overall(1:9);
dis_bottomHalf_indices = dis_original_indices(1:9);
dis_topHalf = dis_sortedSubs_overall(10:end);
dis_topHalf_indices = dis_original_indices(10:end);

% get group means for bottom half
disIdx = [];
for iTarget = 1:2
    for iContrast = 1:numel(NX)
        for iValid = 1:numel(Validities)
            for iSub = 1:length(dis_bottomHalf_indices)
                disIdx = [disIdx dataAll(dis_bottomHalf_indices(iSub)).disd_sub_over2N.(NX{iContrast})(iTarget,iValid)]; % collects the dis d' of each condition by each participant into a list so can do group analysis
                dis_bottom_scatterplot.(NX{iContrast})(iValid,iSub,iTarget) = dataAll(dis_bottomHalf_indices(iSub)).disd_sub_over2N.(NX{iContrast})(iTarget,iValid);
            end
            dis_bottom.std.(NX{iContrast})(iTarget,iValid) = std(disIdx); % finds std of the dis d' of each condition for each participant
            dis_bottom.mean.(NX{iContrast})(iTarget, iValid) = mean(disIdx); % finds means of dis d' for each condition for each participant
            dis_bottom.err.(NX{iContrast})(iTarget,iValid) = dis_bottom.std.(NX{iContrast})(iTarget,iValid)/sqrt(size(dataAll,2)); % calculate error for each condition
            disIdx = [];
        end
    end
end

%finds overall T2 accuracy
dis_scatter_splitHalf_T2 = [];
for i=1:numel(NX)  
    avg = mean(disd_sub_over2N_scatterplot.(NX{i}),1);
    T2avg = avg(:,:,2);
    dis_scatter_splitHalf_T2 = [dis_scatter_splitHalf_T2; T2avg];
    avg = [];
end 
dis_scatter_splitHalf_T2_overall = mean(dis_scatter_splitHalf_T2,1);

[dis_sorted_array_T2, dis_original_indices_T2] = sort(dis_scatter_splitHalf_T2_overall);

dis_sortedSubs_T2_overall = [];
for i=1:numel(subs)
    dis_sortedSubs_T2_overall = [dis_sortedSubs_T2_overall subs(dis_original_indices_T2(i))];
end 

dis_bottomHalf_T2 = dis_sortedSubs_T2_overall(1:9);
dis_bottomHalf_T2_indices = dis_original_indices_T2(1:9);
dis_topHalf_T2 = dis_sortedSubs_T2_overall(10:end);
dis_topHalf_T2_indices = dis_original_indices_T2(10:end);

%% plot discrimination
fp = zoot_figureparams;
xVals = fp.xVals;

%% FIGURE 2A: Dis d' and c by non-target presence subsampled with over2N corrections
clear panel
figure
set(gcf,'Position',fp.rect)

count = 1;
tcl = tiledlayout(2,2,'TileSpacing','compact','OuterPosition',fp.OuterPosition); % adds y height
for iRep = 1:1 % 1 is d'; 2 is c
    for iC = 2:3 % 2 is non-target present; 3 is non-target absent
        panel(count).info = nexttile;
        zoot_figureStyle()
        switch count
            case {1,2} % d'
                xticklabels('')
                ylim([0 4.5])
                yticks(0:1:4.5)
        
        end
        switch count
            case {1}
                ylabel('Discrimination {\itd''}')
                title(sprintf('Non-target present\n'),'FontWeight','normal','FontSize',14)
            case {2}
                title(sprintf('Non-target absent\n'),'FontWeight','normal','FontSize',14)
       
        end
        for iT = 1:2
            for iV = 1:3
                  
                        b = zoot_bar(xVals(iT,iV),squeeze(dis_bottom_scatterplot.(Detfieldnames{iC})(iV,:,iT)),...
                            iC,iV,iT,1,disdErr_sub_over2N.(Detfieldnames{iC})(iT, iV), 4);
                
            end
        end

        % if plotStats
        %     zoot_plotStats
        % end

        count = count+1;
    end
end
