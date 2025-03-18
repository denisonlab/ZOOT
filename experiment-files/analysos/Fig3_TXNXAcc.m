function Fig3_TXNXAcc % please name the function 
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
    % ax = gca;
    % ax.Position=ax.Position.*[1 1 1 0.85]; % makes more space above fig

    hold on
    if plotStats
        if iContrast==1
            % T1 V-I
            zoot_annotateStats(1,(115*.84)+1.5,'**');
            zoot_drawBracket(fp.xVals(1,1), fp.xVals(1,3), .84)
            % kt_annotateStats(2,94,'~');
            % kt_drawBracket(1.7778, 2.2222, .9)    

            % %T1 main V
            % zoot_annotateStats(1,(115*.95)+1.5,'_______');
            % zoot_annotateStats(1,(115*.96)+1.5,'* Validity');

            % kt_annotateStats(1.5,102,'___________________');
            % kt_annotateStats(1.5,103,'*** Target');
            % kt_annotateStats(1.5,107,'** Validity');

        end

        if iContrast == 3
            %T1 V-I
            zoot_annotateStats(1,(115*.88)+1.5,'***');
            zoot_drawBracket(fp.xVals(1,1), fp.xVals(1,3), .87)
            %T1 N-I
            zoot_annotateStats(1.1111,(115*.78)+1.5,'*');
            zoot_drawBracket(fp.xVals(1,2), fp.xVals(1,3), .81)
            % T1 main V
            % zoot_annotateStats(1,(115*1.01)+1.5,'_________');
            % zoot_annotateStats(1,(115*1.02)+1.5,'*** Validity');
            %T2 V-N
            zoot_annotateStats(2,(115*.92)+1.5,'*');
            zoot_drawBracket(fp.xVals(2,1), fp.xVals(2,3), .92)
            

            % kt_annotateStats(1.5,102,'___________________');
            % kt_annotateStats(1.5,104,'*** Target');
            % kt_annotateStats(1.5,108,'*** Validity');
        end

        if iContrast == 2
            %T1 V-I
            zoot_annotateStats(1,(115*.93)+1.5,'*');
            zoot_drawBracket(fp.xVals(1,1), fp.xVals(1,3), .91)

            % kt_annotateStats(1,100,'_______'); % incorrect!
            % kt_annotateStats(1,101,'* Validity');
        end

        if iContrast == 4
            %T2 V-N
            zoot_annotateStats(1.8889,(115*.93)+1.5,'**');
            zoot_drawBracket(fp.xVals(2,1), fp.xVals(2,2), .94)
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
    print(gcf, '-dpdf','/Users/jennymotzer/Documents/GitHub/ZOOT/experiment-files/groupFigs/TXNX_Acc.pdf') %do not erase
end
