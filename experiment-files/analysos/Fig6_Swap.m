function Fig6_Swap % please name the function 
% Fig2a_TXAcc plots accuracy by target presence/absence 

%% Settings (things that can be changed) 
user = 'jenny'; % 'jenny'
saveplots = 0; 
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
%% FIGURE 6: accuracy of nontarget swapping overall trials (except where target and non-target features are the same)
figure();
set(gcf,'Position',[100 100 500 400])
set(gcf, 'Renderer', 'painters')
for iContrast = 1:3 % did not include TANA because all zeroes, cannot swap if neither target nor non-target are present
    subplot(2,2,iContrast)
    zoot_figureStyle; hold on
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
            % 
            % kt_annotateStats(1,33,'_______');
            % kt_annotateStats(1,33.25,'* Validity');

            % kt_annotateStats(1.5,37.25,'___________________');
            % kt_annotateStats(1.5,37.5,'*** Target');
            % kt_annotateStats(1.5,40.75,'* Validity'); %adobe

        elseif iContrast == 3 %TPNA
            %T1 V-I
            zoot_annotateStats(1,25,'***');
            zoot_drawBracket(fp.xVals(1,1), fp.xVals(1,3), .40)

            % kt_annotateStats(1,25.5,'_______');
            % kt_annotateStats(1,25.75,'** Validity');
            % 
            % kt_annotateStats(1.5,35.25,'___________________');
            % kt_annotateStats(1.5,38.75,'** Target');
            % kt_annotateStats(1.5,41.5,'*** Validity');
            % kt_annotateStats(1.5,35.5,'** Target:Validity'); % adobe

        elseif iContrast == 2 %TANP
            %T1 V-I
            zoot_annotateStats(1,35,'**');
            zoot_drawBracket(fp.xVals(1,1), fp.xVals(1,3), .52)
            % 
            % kt_annotateStats(1,25,'_______');
            % kt_annotateStats(1,25.25,'* Validity');
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
    print(gcf, '-dpdf', '/Users/jennymotzer/Documents/GitHub/ZOOT/experiment-files/groupFigs/Swap.pdf')
end