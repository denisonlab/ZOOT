function Fig3_TXNXAcc % please name the function 
% Fig3_TXNXAcc plots a 2x2 graph of accuracy by target presence/absence and
% non-target presence/absence

%% Settings 
user = 'jenny'; % 'jenny'
saveplots = 0; 
plotStats = 1; 
target_ANOVA = 1; % to plot individual target (T1/T2) ANOVAs main ANOVAs
big_ANOVA = 1; % to plot across target ANOVAs
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
%% FIGURE 3 - target presence x validity x target

figure
set(gcf,'Position',[100 100 500 400])

for iContrast = 1:4
    subplot(2,2,iContrast)
    zoot_figureStyle; hold on
    for iTarget = 1:2
        for iValid = 1:3
            b = bar(xVals(iTarget,iValid), Acc.mean(iContrast, iValid, iTarget),...
                'LineWidth',fp.bar.lineWidth(iContrast),'BarWidth',fp.bar.barWidth(iContrast),...
                'EdgeColor',fp.colorsTargets(iTarget,iValid,:),'FaceColor',fp.bar.FaceColor(iContrast,iTarget,iValid,:)); 
            
            % scatter 
            swarmchart( xVals(iTarget,iValid), squeeze(Acc_scatterplot.(contrasts{iContrast})(iValid,:,iTarget)),'filled',...
                'SizeData',fp.scatter.size,'XJitterWidth',100,'MarkerFaceColor',fp.colorsTargets(iTarget,iValid,:),'MarkerEdgeColor',fp.scatter.edgeColor,'MarkerFaceAlpha',fp.scatter.alpha(iValid) ); 
            
            errorbar(xcoords(iContrast, iValid, iTarget),Acc.mean(iContrast, iValid, iTarget),Acc.err(iContrast, iValid, iTarget), '.k', 'CapSize', fp.CapSize, 'LineWidth', fp.ErrorBarLineWidth)
        end

    end

    ylabel('Accuracy (%)    ')
    ylim([30 115])
    set(gca, 'ytick', 30:10:100)
    xlim([0.5 2.5])
    xticks([xVals(1,:) xVals(2,:)])
    set(gca, 'xticklabel', {'V', 'N','I','V','N','I'})

    hold on
    if plotStats
        if iContrast==1 %TPNP
            % T1 V-I
            zoot_annotateStats(1,(115*.84)+1.5,'**');
            zoot_drawBracket(fp.xVals(1,1), fp.xVals(1,3), .82)
            % kt_annotateStats(2,94,'~');
            % kt_drawBracket(1.7778, 2.2222, .9)    
            if target_ANOVA
            % %T1 main V
            zoot_annotateStats(1,(115*.9)+1.5,'_______');
            zoot_annotateStats(1,(115*.91)+1.5,'* Validity');
            end

            if big_ANOVA
            %across target ANOVA
            zoot_annotateStats(1.5,(115*.96)+1.5,'___________________');
            zoot_annotateStats(1.5,(115*.97)+1.5,'*** Target');
            zoot_annotateStats(1.5,(115*1.01)+1.5,'** Validity');
            end

        end

        if iContrast == 3 %TPNA
            %T1 V-I
            zoot_annotateStats(1,(115*.86)+1.5,'***');
            zoot_drawBracket(fp.xVals(1,1), fp.xVals(1,3), .85)
            %T1 N-I
            zoot_annotateStats(1.1111,(115*.83)+1.5,'*');
            zoot_drawBracket(fp.xVals(1,2), fp.xVals(1,3), .81)

            %T2 V-I
            zoot_annotateStats(2,(115*.88)+1.5,'*');
            zoot_drawBracket(fp.xVals(2,1), fp.xVals(2,3), .87)
            
            if target_ANOVA
            % T1 main V
            zoot_annotateStats(1,(115*.93)+1.5,'_________');
            zoot_annotateStats(1,(115*.93)+1.5,'*** Validity');
            end
            
            if big_ANOVA
            %across target ANOVAs
            zoot_annotateStats(1.5,(115*.98)+1.5,'___________________');
            zoot_annotateStats(1.5,(115*.99)+1.5,'*** Target');
            zoot_annotateStats(1.5,(115*1.03)+1.5,'*** Validity');
            end
        end

        if iContrast == 2
            %T1 V-I
            zoot_annotateStats(1,(115*.93)+1.5,'*');
            zoot_drawBracket(fp.xVals(1,1), fp.xVals(1,3), .91)
        end

        if iContrast == 4
            %T2 V-N
            zoot_annotateStats(1.8889,(115*.91)+1.5,'**');
            zoot_drawBracket(fp.xVals(2,1), fp.xVals(2,2), .9)
        end
    end
end 

% [ax1, h1] = suplabel('Non-target Present', 'y', [0.08 0.08 .84 1.325]);
% [ax2, h2] = suplabel('Non-target Absent', 'y', [0.08 0.08 .84 0.375]);
% [ax3, h3] = suplabel('Target Absent', 't', [0.08 0.08 1.3 .90]);
% [ax4, h4] = suplabel('Target Present', 't', [0.08 0.08 .45 .90]);
% [ax5, h5] = suplabel('T1', 'tt', [0.08 0.08 .27 0.86]);
% [ax6, h6] = suplabel('T2', 'tt', [0.08 0.08 .6 0.86]);
% [ax7, h7] = suplabel('T1', 'tt', [0.08 0.08 1.15 0.86]);
% [ax8, h8] = suplabel('T2', 'tt', [0.08 0.08 1.47 0.86]);

figTitle = 'TXNX_Acc';
if saveplots
    export_fig(gcf,sprintf('%s/%s.%s', figDir, figTitle, figType), '-transparent','-p10')
end
