function Sup1_TXNXRT % please name the function 
% Sup1_TXNXRT plots a 2x2 graph of RT by target presence/absence and
% non-target presence/absence

%% Settings (things that can be changed) 
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

%% SUPPLEMENTARY FIG: RT plot TXNX
figure
set(gcf,'Position',[100 100 500 400])
for iContrast = 1:4
    subplot(2,2,iContrast)
    zoot_figureStyle; hold on
    for iTarget = 1:2
        for iValid = 1:3
            s = scatter(xVals(iTarget,iValid), TXNX_RT.mean(iContrast, iValid, iTarget),...
                fp.gm_scatter.size, 'MarkerEdgeColor', fp.colorsTargets(iTarget,iValid,:), 'MarkerFaceColor', fp.s.MarkerFaceColor(iContrast,iTarget,iValid,:), 'LineWidth', fp.s.lineWidth(iContrast)); 
            
            % scatter 
            swarmchart( xVals(iTarget,iValid), squeeze(TXNX_RT_scatterplot.(contrasts{iContrast})(iValid,:,iTarget)),'filled',...
                'SizeData',fp.scatter.size,'XJitterWidth',100,'MarkerFaceColor',fp.colorsTargets(iTarget,iValid,:),'MarkerEdgeColor',fp.scatter.edgeColor,'MarkerFaceAlpha',fp.scatter.alpha(iValid) ); 
            
            errorbar(xcoords(iContrast, iValid, iTarget),TXNX_RT.mean(iContrast, iValid, iTarget),TXNX_RT.err(iContrast, iValid, iTarget), '.k', 'CapSize', fp.CapSize, 'LineWidth', fp.ErrorBarLineWidth)
        end

    end

    ylabel('Reaction time (s)')
    ylim([0 1.25])
    set(gca, 'ytick', 0:.5:1.5)
    xlim([0.5 2.5])
    xticks([xVals(1,:) xVals(2,:)])
    set(gca, 'xticklabel', {'V', 'N','I','V','N','I'})

    if plotStats
        if iContrast==1 %TPNP
            %T1 V-I
            zoot_annotateStats(1,.93,'***');
            zoot_drawBracket(fp.xVals(1,1), fp.xVals(1,3), 0.72)
            %T1 V-N
            zoot_annotateStats(.89,.82,'**');
            zoot_drawBracket(fp.xVals(1,1), fp.xVals(1,2), .63)
            % kt_annotateStats(1.1111,.58,'~');
            % kt_drawBracket(1, 1.2222, .85)

            %T2 N-I
            zoot_annotateStats(2.1,.82,'**');
            zoot_drawBracket(fp.xVals(2,2), fp.xVals(2,3), .62)
            % zoot_annotateStats(2,.55,'~');
            % kt_drawBracket(1.7778, 2.2222, .78)
            if target_ANOVA
                %T1 main V
                zoot_annotateStats(1,1.05,'_______');
                zoot_annotateStats(1,1.075,'*** Validity');

                % T2 main V
                zoot_annotateStats(2, 1.05,'_______');
                zoot_annotateStats(2,1.075,'* Validity');
            end
            if big_ANOVA
                % overall ANOVAs
                zoot_annotateStats(1.5, 1.2,'___________________');
                zoot_annotateStats(1.5, 1.25,'** Target');
                zoot_annotateStats(1.5,1.33,'*** Validity');
            end
        end

        if iContrast == 3 %TPNA
            %T1 V-N
            zoot_annotateStats(1,.79,'***');
            zoot_drawBracket(fp.xVals(1,1), fp.xVals(1,3), .6)
            %T1 N-I
            zoot_annotateStats(1.1111,.65,'*');
            zoot_drawBracket(fp.xVals(1,2), fp.xVals(1,3), .5)
            
            %T2 V-I
            zoot_annotateStats(2,.65,'**');
            zoot_drawBracket(fp.xVals(2,1), fp.xVals(2,3), .5)
            %T2 N-I
            zoot_annotateStats(2.1111,.53,'*');
            zoot_drawBracket(fp.xVals(2,2), fp.xVals(2,3), .4)
            if target_ANOVA
                %T1 main V
                zoot_annotateStats(1,1.05,'_______');
                zoot_annotateStats(1,1.075,'** Validity');
                % T2 main V
                zoot_annotateStats(2, 1.05,'_______');
                zoot_annotateStats(2,1.075,'*** Validity');
            end
            if big_ANOVA
                % overall ANOVAs
                zoot_annotateStats(1.5, 1.2,'___________________');
                zoot_annotateStats(1.5, 1.25,'** Target');
                zoot_annotateStats(1.5,1.33,'*** Validity');
            end
        end

        if iContrast == 2 %TANP
            %T1 V-I
            zoot_annotateStats(1,.72,'*');
            zoot_drawBracket(fp.xVals(1,1), fp.xVals(1,3), .55)
            % kt_annotateStats(.89,.38,'~');
            % kt_drawBracket(.7778, 1, .8)

            %T2 V-I
            zoot_annotateStats(2,.75,'**');
            zoot_drawBracket(fp.xVals(2,1), fp.xVals(2,3), .54)
            %T2 N-I
            zoot_annotateStats(2.12,.62,'*');
            zoot_drawBracket(fp.xVals(2,2), fp.xVals(2,3), .48)
            % kt_annotateStats(1.89,.27,'~');
            % kt_drawBracket(1.7778, 1.98, .55)
            if target_ANOVA
                %T2 main V
                zoot_annotateStats(2, 1.05,'_______');
                zoot_annotateStats(2,1.075,'*** Validity');
            end
            if big_ANOVA
                %overall ANOVAs
                zoot_annotateStats(1.5, 1.2,'___________________');
                zoot_annotateStats(1.5, 1.25,'** Target');
                zoot_annotateStats(1.5,1.33,'*** Validity');
            end
        end
    end
 
end
% [ax1, h1] = suplabel('Non-target Present', 'y', [0.08 0.08 .84 1.325]);
% [ax2, h2] = suplabel('Non-target Absent', 'y', [0.08 0.08 .84 0.375]);
% [ax3, h3] = suplabel('Target Absent', 't', [0.08 0.08 1.3 0.9]);
% [ax4, h4] = suplabel('Target Present', 't', [0.08 0.08 .45 0.9]);
% [ax5, h5] = suplabel('T1', 'tt', [0.08 0.08 .27 0.86]);
% [ax6, h6] = suplabel('T2', 'tt', [0.08 0.08 .6 0.86]);
% [ax7, h7] = suplabel('T1', 'tt', [0.08 0.08 1.15 0.86]);
% [ax8, h8] = suplabel('T2', 'tt', [0.08 0.08 1.47 0.86]);

figTitle = 'TXNX_RT';
if saveplots
    export_fig(gcf,sprintf('%s/%s.%s', figDir, figTitle, figType), '-transparent','-p10')
end
