function Fig6_Swap % please name the function 
% Fig6_Swap plots a 2x2 graph of swap rates for all target presence/absence and
% non-target presence/absence combinations except TANA (swapping cannot
% occur if both target and non-target are absent)

%% Settings 
user = 'karen'; % 'jenny'
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

%% FIGURE 6: accuracy of nontarget swapping overall trials (except where target and non-target features are the same)
figure
set(gcf,'Position',[100 100 500 400])
for iContrast = 1:3 % did not include TANA because all zeroes, cannot swap if neither target nor non-target are present
    subplot(2,2,iContrast)
    zoot_figureStyle(fp)
    xlim([fp.xVals(1,1)-0.25 fp.xVals(1,3)+0.25])
    xticks(fp.xVals(1,:))

    for iTarget = 1:2
        for iValid = 1:3
            b = bar(xVals(iTarget,iValid), Acc.NTmean(iContrast, iValid, iTarget),...
                'LineWidth',fp.bar.lineWidth(iContrast),'BarWidth',fp.bar.barWidth(iContrast),...
                'EdgeColor',fp.grey, 'FaceColor',fp.grey); 
            
            % scatter 
            swarmchart( xVals(iTarget,iValid), squeeze(swap_Acc_scatterplot.(contrasts{iContrast})(iValid,:,iTarget)),'filled',...
                'SizeData',fp.scatter.size,'XJitterWidth',100,'MarkerFaceColor',fp.grey,'MarkerEdgeColor',fp.scatter.edgeColor,'MarkerFaceAlpha',fp.scatter.alpha(iValid) ); 
            
            errorbar(xcoords(iContrast, iValid, iTarget),Acc.NTmean(iContrast, iValid, iTarget),Acc.NTerr(iContrast, iValid, iTarget), '.k', 'CapSize', fp.CapSize, 'LineWidth', fp.ErrorBarLineWidth)
        end

    end

    label_y = ylabel(sprintf('Reports of non-target feature \n(normalized %%) \n'));
    ylim([0 60]) 
    label_y.Position(1) = 0.45;
    set(gca, 'ytick', 0:10:60) 
    xlim([0.5 2.5])
    xticks([xVals(1,:) xVals(2,:)])
    set(gca, 'xticklabel', {'V', 'N','I','V','N','I'})

    if plotStats
        if iContrast==1 %TPNP
            %T1 V-I
            zoot_annotateStats(1,35,'*');
            zoot_drawBracket(fp.xVals(1,1), fp.xVals(1,3), .55)
            if target_ANOVA
                % T1 main V
                zoot_annotateStats(1,48,'_______');
                zoot_annotateStats(1,48.25,'* Validity');
            end
            if big_ANOVA
                %overall ANOVAs
                zoot_annotateStats(1.5,55,'___________________');
                zoot_annotateStats(1.5,55.5,'*** Target');
                zoot_annotateStats(1.5,59.5,'* Validity'); %adobe
            end

        elseif iContrast == 3 %TPNA
            %T1 V-I
            zoot_annotateStats(1,25,'***');
            zoot_drawBracket(fp.xVals(1,1), fp.xVals(1,3), .40)
            if target_ANOVA
                %T1 main V
                zoot_annotateStats(1,48,'_______');
                zoot_annotateStats(1,48.25,'** Validity');
            end
            if big_ANOVA
                % overall ANOVAs
                zoot_annotateStats(1.5,55,'___________________');
                zoot_annotateStats(1.5,59.5,'** Target');
                zoot_annotateStats(1.5,63.5,'*** Validity');
                zoot_annotateStats(1.5,55.5,'** Target:Validity'); % adobe
            end

        elseif iContrast == 2 %TANP
            %T1 V-I
            zoot_annotateStats(1,35,'**');
            zoot_drawBracket(fp.xVals(1,1), fp.xVals(1,3), .52)
            if target_ANOVA
                % T1 main V
                zoot_annotateStats(1,48,'_______');
                zoot_annotateStats(1,48.25,'* Validity');
            end
        end
    end
   

end
% [ax1, h1] = suplabel('Non-target Present', 'y', [0.08 0.08 .84 1.325]);
% [ax2, h2] = suplabel('Non-target Absent', 'y', [0.08 0.08 .84 0.375]);
% [ax3, h3] = suplabel('Target Absent', 't', [0.08 0.08 1.3 .90]);
% [ax4, h4] = suplabel('Target Present', 't', [0.08 0.08 .45 .90]);
% [ax5, h5] = suplabel('T1', 'tt', [0.08 0.08 .27 0.82]);
% [ax6, h6] = suplabel('T2', 'tt', [0.08 0.08 .6 0.82]);
% [ax7, h7] = suplabel('T1', 'tt', [0.08 0.08 1.15 0.82]);
% [ax8, h8] = suplabel('T2', 'tt', [0.08 0.08 1.47 0.82]);

figTitle = 'Swap';
if saveplots
    export_fig(gcf,sprintf('%s/%s.%s', figDir, figTitle, figType), '-transparent','-p10')
end