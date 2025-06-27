function Fig2_TXAccRT 
% Fig2_TXAccRT plots accuracy and RT by target presence vs. absence 
% for zoot

%% Settings 
user = 'jenny'; % 'jenny' 'karenlab' 'karen'

% Fig saving
savePlots = 1; 
figType = 'pdf';
figTitle = 'Fig2_TXAccRT';
figNum=2;

% Fig plotting
plotStats = 0; 
plotSubjects = 1;

%% Setup
[zootDir,figDir] = pathToZoot(user); 

% Load the data
datafile = sprintf('%s/experiment-files/zoot_dataAll.mat',zootDir); 
load(datafile)

% Figure styling
fp = zoot_figureparams;
xVals = fp.xVals; 

[zootDir,figDir] = pathToZoot(user); % run again bc dataall overwrites fig dir 

%% FIGURE 2A: Acc and RT by target presence
clear panel 
figure
set(gcf,'Position',fp.rect)

count = 1;
tcl = tiledlayout(2,2,'TileSpacing','compact','OuterPosition',fp.OuterPosition); % adds y height
for iRep = 1:2 % 1 is accuracy; 2 is RT
    for iC = 1:2 % 1 is target present; 2 target absent
        panel(count).info = nexttile;
        zoot_figureStyle
        switch count
            case {1,2} % Accuracy
                xticklabels('')
                ylim([30 100]) % y min be 30 to match TXNX acc plot or 50 to better show effect
                yticks(30:10:100)
            case {3,4} % RT
                xticklabels({'V','N','I','V','N','I'})
                ylim([0 .85])
                yticks(0:0.2:0.8)
        end
        switch count
            case {1}
                ylabel('Accuracy (%)')
                title(sprintf('Target present\n'),'FontWeight','normal','FontSize',14)
            case {2}
                title(sprintf('Target absent\n'),'FontWeight','normal','FontSize',14)
            case {3}
                ylabel('Reaction time (s)')        
        end
        for iT = 1:2
            for iV = 1:3
                switch count
                    case {1,2} % Accuracy      
                        b = zoot_bar(xVals(iT,iV),squeeze(tcAcc_scatterplot.(targ_contrasts{iC})(iV,:,iT)),...
                            iC,iV,iT,plotSubjects,tcAcc.err(iC,iV,iT), figNum);
                    case {3,4}  % Reaction time
                        zoot_scatter(xVals(iT,iV),squeeze(TPTA_RT_scatterplot.(targ_contrasts{iC})(iV,:,iT)),...
                            iC,iV,iT,plotSubjects,TPTA_RT.err(iC,iV,iT), figNum);
                end
            end
        end

        if plotStats
            zoot_plotStats
        end

        count = count+1;
    end
end

if savePlots
    export_fig(gcf,sprintf('%s/%s.%s', figDir, figTitle, figType), '-transparent','-p10')
    % print(gcf, '-dpdf', '/Users/jennymotzer/Documents/GitHub/ZOOT/experiment-files/groupFigs/TX_Acc.pdf') % needed or else background turns black, do not erase
end

%% Old scatter
% bar(xVals(iT,iV), tcAcc.mean(iC, iV, iT),...
%     'LineWidth',fp.bar.lineWidth(iC),'BarWidth',fp.bar.barWidth(iC),...
%     'EdgeColor',fp.colorsTargets(iT,iV,:),'FaceColor',fp.bar.FaceColor(iC,iT,iV,:));
% 
% xValS = repmat(xVals(iT,iV),[1,15]);
% scatter(xValS,squeeze(tcAcc_scatterplot.(targ_contrasts{iC})(iV,:,iT)),'filled',...
%     'SizeData',12,'XJitter','rand','XJitterWidth',0.05,...
%     'MarkerFaceColor',fp.colorsTargets(iT,iV,:),'MarkerEdgeColor',fp.scatter.edgeColor,'MarkerFaceAlpha',0.5);
% 
% errorbar(xVals(iT,iV),tcAcc.mean(iC,iV,iT),tcAcc.err(iC,iV,iT),'k','CapSize',fp.CapSize,'LineWidth',fp.ErrorBarLineWidth)
% 
% scatter(xVals(iT,iV), TPTA_RT.mean(iC, iV, iT),...
%     fp.gm_scatter.size, 'MarkerEdgeColor', fp.colorsTargets(iT,iV,:), 'MarkerFaceColor', fp.s.MarkerFaceColor(iC,iT,iV,:), 'LineWidth', fp.s.lineWidth(iC));
% 
% xValS = repmat(xVals(iT,iV),[1,15]);
% swarmchart(xValS,squeeze(TPTA_RT_scatterplot.(targ_contrasts{iC})(iV,:,iT)),'filled',...
%     'SizeData',fp.scatter.size,'XJitter','rand','XJitterWidth',0.03,'MarkerFaceColor',...
%     fp.colorsTargets(iT,iV,:),'MarkerEdgeColor',fp.scatter.edgeColor,'MarkerFaceAlpha',0.5);
% 
% errorbar(xVals(iT,iV),TPTA_RT.mean(iC, iV, iT),TPTA_RT.err(iC, iV, iT), 'k', 'CapSize', fp.CapSize, 'LineWidth', fp.ErrorBarLineWidth)
%% Side labels
% [ax3, h3] = suplabel('Target Absent', 't', [0.08 0.08 1.3 .88]);
% [ax4, h4] = suplabel('Target Present', 't', [0.08 0.08 .45 .88]);
% [ax5, h5] = suplabel('T1', 'tt', [0.08 0.08 .27 0.8]);
% [ax6, h6] = suplabel('T2', 'tt', [0.08 0.08 .6 0.8]);
% [ax7, h7] = suplabel('T1', 'tt', [0.08 0.08 1.15 0.8]);
% [ax8, h8] = suplabel('T2', 'tt', [0.08 0.08 1.47 0.8]);


% FIGURE 2B: RT by target contrast
% for iContrast = 1:2
%     subplot(2,2,iContrast+2) 
%     zoot_figureStyle; hold on
%     for iT = 1:2
%         for iV = 1:3
%             scatter(xVals(iT,iV), TPTA_RT.mean(iContrast, iV, iT),...
%              fp.gm_scatter.size, 'MarkerEdgeColor', fp.colorsTargets(iT,iV,:), 'MarkerFaceColor', fp.s.MarkerFaceColor(iContrast,iT,iV,:), 'LineWidth', fp.s.lineWidth(iContrast)); 
% 
%             % scatter 
%             swarmchart( xVals(iT,iV), squeeze(TPTA_RT_scatterplot.(targ_contrasts{iContrast})(iV,:,iT)),'filled',...
%                 'SizeData',fp.scatter.size,'XJitterWidth',100,'MarkerFaceColor',fp.colorsTargets(iT,iV,:),'MarkerEdgeColor',fp.scatter.edgeColor,'MarkerFaceAlpha',fp.scatter.alpha(iV) ); 
% 
%              errorbar(xcoords(iContrast, iV, iT),TPTA_RT.mean(iContrast, iV, iT),TPTA_RT.err(iContrast, iV, iT), '.k', 'CapSize', fp.CapSize, 'LineWidth', fp.ErrorBarLineWidth)
%         end
% 
%     end
% 
%     %axis labels and limits
%     % ylabel('Reaction time (s)    ')
%     % ylim([0 1.25])
%     % set(gca, 'ytick', 0:0.5:1)
%     % xlim([0.5 2.5])
%     % xticks([xVals(1,:) xVals(2,:)])
%     % set(gca, 'xticklabel', {'V', 'N','I','V','N','I'})
% 
%     if plotStats
%         if iContrast==1 % TP
%             % T1 V-I
%             zoot_annotateStats(1,0.8,'***');
%             zoot_drawBracket(fp.xVals(1,1), fp.xVals(1,3), 0.61) 
% 
%            % T1 V-N
%             zoot_annotateStats(0.89999,0.72,'**');
%             zoot_drawBracket(fp.xVals(1,1), fp.xVals(1,2), 0.55)
% 
%             % T1 N-I
%             zoot_annotateStats(1.1111,0.65,'**');
%             zoot_drawBracket(fp.xVals(1,2), fp.xVals(1,3), 0.50)
% 
%             % T2 V-I
%             zoot_annotateStats(2, 0.74,'***');
%             zoot_drawBracket(fp.xVals(2,1), fp.xVals(2,3), 0.56)
% 
%             % T2 N-I
%             zoot_annotateStats(2.1111,0.6,'*');
%             zoot_drawBracket(fp.xVals(2,2), fp.xVals(2,3), 0.47)
% 
%             if target_ANOVA
%             % T1 main V
%             zoot_annotateStats(1,1.01,'________');
%             zoot_annotateStats(1,1.02,'*** Validity');
% 
%             % T2 main V
%             zoot_annotateStats(2,1.01,'________');
%             zoot_annotateStats(2,1.02,'** Validity');
%             end 
% 
%             if big_ANOVA
%             % overall main effects of V and T
%             zoot_annotateStats(1.5,1.15,'____________________');
%             zoot_annotateStats(1.5,1.24,'*** Validity');
%              zoot_annotateStats(1.5,1.17,'** Target');
%             end 
% 
%         elseif iContrast == 2 %TA
%             % T2 V-I
%             zoot_annotateStats(2,.55,'*');
%             zoot_drawBracket(fp.xVals(2,1), fp.xVals(2,3), 0.4)
% 
%             % T2 N-I
%             zoot_annotateStats(2.1111,.47,'*');
%             zoot_drawBracket(fp.xVals(2,2), fp.xVals(2,3), 0.35)
% 
%             if target_ANOVA
%             %T2 main V
%             zoot_annotateStats(2,1.01,'________');
%             zoot_annotateStats(2,1.02,'** Validity');
%             end 
% 
%             if big_ANOVA
%             % overall main effects of V and T
%             zoot_annotateStats(1.5,1.15,'____________________');
%             zoot_annotateStats(1.5,1.24,'* Validity');
%              zoot_annotateStats(1.5,1.17,'*** Target');
%             end 
%         end
%     end
% 
% end