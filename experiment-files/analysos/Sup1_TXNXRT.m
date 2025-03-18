function Sup1_TXNXRT % please name the function 
% Fig2a_TXAcc plots accuracy by target presence/absence 

%% Settings (things that can be changed) 
user = 'jenny'; % 'jenny'
saveplots = 1; 
plotStats = 1; 
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

% /// Define your xVals once. Then, they can be used throughout.
% /// Would be even better to define in figureparams once to be used across all figures. 
% xVals = [0.7778 1 1.222;... % T1 (
%     1.7778 2 2.2222]; % T2
xVals = fp.xVals; 

% /// Also define colors just once (see changes to figure params). Make use of logical indexing rather
% than if loops.
% /// Same comment for bar widths (see changes to figure params). 
% /// size of figure should also be just defined once in figureparams. 
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
    % ax = gca;
    % ax.Position=ax.Position.*[1 1 1 0.85]; % makes more space above fig

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
            % kt_annotateStats(2,.55,'~');
            % kt_drawBracket(1.7778, 2.2222, .78)

            %T1 main V
            % kt_annotateStats(1,1.15,'_______');
            % kt_annotateStats(1,1.175,'*** Validity');
            % T2 main V
            % kt_annotateStats(2, 1.15,'_______');
            % kt_annotateStats(2,1.175,'* Validity');
            % overall main V and T
            % kt_annotateStats(1.5, 1.3,'___________________');
            % kt_annotateStats(1.5, 1.35,'** Target');
            % kt_annotateStats(1.5,1.45,'*** Validity');
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
            
            %T1 main V
            % kt_annotateStats(1,1.15,'_______');
            % kt_annotateStats(1,1.175,'** Validity');
            % T2 main V
            % kt_annotateStats(2, 1.15,'_______');
            % kt_annotateStats(2,1.175,'*** Validity');
            % overall main V and T
            % kt_annotateStats(1.5, 1.3,'___________________');
            % kt_annotateStats(1.5, 1.35,'** Target');
            % kt_annotateStats(1.5,1.45,'*** Validity');
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

            %T2 main V
            % kt_annotateStats(2, 1.15,'_______');
            % kt_annotateStats(2,1.175,'*** Validity');
            %overall main V and T
            % kt_annotateStats(1.5, 1.3,'___________________');
            %   kt_annotateStats(1.5, 1.35,'** Target');
            %   kt_annotateStats(1.5,1.45,'*** Validity');
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
    % print(gcf, '-dpdf', '/Users/jennymotzer/Documents/GitHub/ZOOT/experiment-files/groupFigs/TXNX_RT.pdf')
end
