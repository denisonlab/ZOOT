function Fig2_TXAccRT % please name the function 
% Fig2_TXAccRT plots a 2x2 graph with accuracy and RT by target presence/absence 

%% Settings  
user = 'jenny'; % 'jenny'
saveplots =0; 
plotStats = 1; 
target_ANOVA = 0; % to plot individual target (T1/T2) ANOVAs main ANOVAs
big_ANOVA = 0; % to plot across target ANOVAs
figType = 'pdf';

%% Setup
% Directories
switch user
    case {'karen'}
        pathToZoot = '/Users/kantian/Dropbox/github/ZOOT';
    case {'jenny'}
        pathToZoot = '/Users/jennymotzer/Documents/GitHub/ZOOT';
end
addpath(genpath(pathToZoot))
figDir = sprintf('%s/groupFigs',pathToZoot); 

% Load the data
datafile = sprintf('%s/experiment-files/zoot_dataAll.mat',pathToZoot); 
load(datafile)

% Figure styling
fp = zoot_figureparams;

% x values
xVals = fp.xVals; 

%% Fig 2
% FIGURE 2A: Acc by target contrast
figure
set(gcf,'Position',[100 100 500 400])

for iContrast = 1:2
    subplot(2,2,iContrast)
    zoot_figureStyle; hold on
    for iTarget = 1:2
        for iValid = 1:3
            b = bar(xVals(iTarget,iValid), tcAcc.mean(iContrast, iValid, iTarget),...
                'LineWidth',fp.bar.lineWidth(iContrast),'BarWidth',fp.bar.barWidth(iContrast),...
                'EdgeColor',fp.colorsTargets(iTarget,iValid,:),'FaceColor',fp.bar.FaceColor(iContrast,iTarget,iValid,:)); 
            
            % scatter 
            swarmchart( xVals(iTarget,iValid), squeeze(tcAcc_scatterplot.(targ_contrasts{iContrast})(iValid,:,iTarget)),'filled',...
                'SizeData',fp.scatter.size,'XJitterWidth',100,'MarkerFaceColor',fp.colorsTargets(iTarget,iValid,:),'MarkerEdgeColor',fp.scatter.edgeColor,'MarkerFaceAlpha',fp.scatter.alpha(iValid) ); 
            
            errorbar(xcoords(iContrast, iValid, iTarget),tcAcc.mean(iContrast, iValid, iTarget),tcAcc.err(iContrast, iValid, iTarget), '.k', 'CapSize', fp.CapSize, 'LineWidth', fp.ErrorBarLineWidth)
        end

    end
    
    %axis labels and limits
    ylabel('Accuracy (%)    ')
    ylim([30 115])
    set(gca, 'ytick', 30:10:100)
    xlim([0.5 2.5])
    xticks([xVals(1,:) xVals(2,:)])
    set(gca, 'xticklabel', {'V', 'N','I','V','N','I'})

    if plotStats
        if iContrast==1 %TP
            % T1 V-I
            zoot_annotateStats(1,(115*0.87)+1.5,'***');
            zoot_drawBracket(fp.xVals(1,1), fp.xVals(1,3), 0.86)

            % T1 N-I
            zoot_annotateStats(1.1111,(115*0.83)+1.5,'**');
            zoot_drawBracket(fp.xVals(1,2), fp.xVals(1,3), 0.82)

            % T2 V-I
            zoot_annotateStats(2,(115*0.87)+1.5,'**');
            zoot_drawBracket(fp.xVals(2,1), fp.xVals(2,3), 0.85)

            % T2 N-I
            zoot_annotateStats(2.111,(115*0.82)+1.5,'*');
            zoot_drawBracket(fp.xVals(2,2), fp.xVals(2,3), 0.80)

            if target_ANOVA
                % T1 main V
                zoot_annotateStats(1,107,'________');
                zoot_annotateStats(1,109,'*** Validity');
                % T2 main V
                zoot_annotateStats(2,107,'________');
                zoot_annotateStats(2,109,'* Validity');
            end

            if big_ANOVA
                % overall main effects of V and T
                zoot_annotateStats(1.5,115,'____________________');
                zoot_annotateStats(1.5,121,'* Validity');
                zoot_annotateStats(1.5,116,'*** Target');
            end

        elseif iContrast == 2 %TA
            % T1 V-I
            zoot_annotateStats(1,(115*.92)+1.5,'*');
            zoot_drawBracket(fp.xVals(1,1), fp.xVals(1,3), 0.9)
        end
    end

end

% FIGURE 2B: RT by target contrast
for iContrast = 1:2
    subplot(2,2,iContrast+2)
    zoot_figureStyle; hold on
    for iTarget = 1:2
        for iValid = 1:3
            scatter(xVals(iTarget,iValid), TPTA_RT.mean(iContrast, iValid, iTarget),...
             fp.gm_scatter.size, 'MarkerEdgeColor', fp.colorsTargets(iTarget,iValid,:), 'MarkerFaceColor', fp.s.MarkerFaceColor(iContrast,iTarget,iValid,:), 'LineWidth', fp.s.lineWidth(iContrast)); 
            
            % scatter 
            swarmchart( xVals(iTarget,iValid), squeeze(TPTA_RT_scatterplot.(targ_contrasts{iContrast})(iValid,:,iTarget)),'filled',...
                'SizeData',fp.scatter.size,'XJitterWidth',100,'MarkerFaceColor',fp.colorsTargets(iTarget,iValid,:),'MarkerEdgeColor',fp.scatter.edgeColor,'MarkerFaceAlpha',fp.scatter.alpha(iValid) ); 
            
             errorbar(xcoords(iContrast, iValid, iTarget),TPTA_RT.mean(iContrast, iValid, iTarget),TPTA_RT.err(iContrast, iValid, iTarget), '.k', 'CapSize', fp.CapSize, 'LineWidth', fp.ErrorBarLineWidth)
        end

    end

    %axis labels and limits
    ylabel('Reaction time (s)    ')
    ylim([0 1.25])
    set(gca, 'ytick', 0:0.5:1)
    xlim([0.5 2.5])
    xticks([xVals(1,:) xVals(2,:)])
    set(gca, 'xticklabel', {'V', 'N','I','V','N','I'})

    if plotStats
        if iContrast==1 % TP
            % T1 V-I
            zoot_annotateStats(1,0.8,'***');
            zoot_drawBracket(fp.xVals(1,1), fp.xVals(1,3), 0.61) 

           % T1 V-N
            zoot_annotateStats(0.89999,0.72,'**');
            zoot_drawBracket(fp.xVals(1,1), fp.xVals(1,2), 0.55)
            
            % T1 N-I
            zoot_annotateStats(1.1111,0.65,'**');
            zoot_drawBracket(fp.xVals(1,2), fp.xVals(1,3), 0.50)
            
            % T2 V-I
            zoot_annotateStats(2, 0.74,'***');
            zoot_drawBracket(fp.xVals(2,1), fp.xVals(2,3), 0.56)

            % T2 N-I
            zoot_annotateStats(2.1111,0.6,'*');
            zoot_drawBracket(fp.xVals(2,2), fp.xVals(2,3), 0.47)
            
            if target_ANOVA
            % T1 main V
            zoot_annotateStats(1,1.01,'________');
            zoot_annotateStats(1,1.02,'*** Validity');
    
            % T2 main V
            zoot_annotateStats(2,1.01,'________');
            zoot_annotateStats(2,1.02,'** Validity');
            end 

            if big_ANOVA
            % overall main effects of V and T
            zoot_annotateStats(1.5,1.15,'____________________');
            zoot_annotateStats(1.5,1.24,'*** Validity');
             zoot_annotateStats(1.5,1.17,'** Target');
            end 
            
        elseif iContrast == 2 %TA
            % T2 V-I
            zoot_annotateStats(2,.55,'*');
            zoot_drawBracket(fp.xVals(2,1), fp.xVals(2,3), 0.4)

            % T2 N-I
            zoot_annotateStats(2.1111,.47,'*');
            zoot_drawBracket(fp.xVals(2,2), fp.xVals(2,3), 0.35)

            if target_ANOVA
            %T2 main V
            zoot_annotateStats(2,1.01,'________');
            zoot_annotateStats(2,1.02,'** Validity');
            end 

            if big_ANOVA
            % overall main effects of V and T
            zoot_annotateStats(1.5,1.15,'____________________');
            zoot_annotateStats(1.5,1.24,'* Validity');
             zoot_annotateStats(1.5,1.17,'*** Target');
            end 
        end
    end

end


% [ax3, h3] = suplabel('Target Absent', 't', [0.08 0.08 1.3 .88]);
% [ax4, h4] = suplabel('Target Present', 't', [0.08 0.08 .45 .88]);
% [ax5, h5] = suplabel('T1', 'tt', [0.08 0.08 .27 0.8]);
% [ax6, h6] = suplabel('T2', 'tt', [0.08 0.08 .6 0.8]);
% [ax7, h7] = suplabel('T1', 'tt', [0.08 0.08 1.15 0.8]);
% [ax8, h8] = suplabel('T2', 'tt', [0.08 0.08 1.47 0.8]);

figTitle = 'TX_AccRT';
if saveplots
    export_fig(gcf,sprintf('%s/%s.%s', figDir, figTitle, figType), '-transparent','-p10')
end