function Fig2a_TXAcc % please name the function 
% Fig2a_TXAcc plots accuracy by target presence/absence 

%% Settings (things that can be changed) 
user = 'karen'; % 'jenny'
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
xVals = fp.xVals; 

%% FIGURE 2A: Acc by target contrast
figure
set(gcf,'Position',[100 100 500 180])

tcl = tiledlayout(1,2,'TileSpacing','compact','OuterPosition',[0 0 1 0.85]);
tcl.YLabel.String = 'Accuracy (%)';
for iC = 1:2
    nexttile
    zoot_figureStyle
    ylim([30 115])
    yticks(30:10:100)
    xlim([0.5 2.5])
    xticks([xVals(1,:) xVals(2,:)])
    xticklabels({'V','N','I','V','N','I'})
    for iT = 1:2
        for iV = 1:3
            bar(xVals(iT,iV), tcAcc.mean(iC, iV, iT),...
                'LineWidth',fp.bar.lineWidth(iC),'BarWidth',fp.bar.barWidth(iC),...
                'EdgeColor',fp.colorsTargets(iT,iV,:),'FaceColor',fp.bar.FaceColor(iC,iT,iV,:)); 
           
            swarmchart( xVals(iT,iV), squeeze(tcAcc_scatterplot.(targ_contrasts{iC})(iV,:,iT)),'filled',...
                'SizeData',fp.scatter.size,'XJitterWidth',100,'MarkerFaceColor',fp.colorsTargets(iT,iV,:),'MarkerEdgeColor',fp.scatter.edgeColor,'MarkerFaceAlpha',fp.scatter.alpha(iV) ); 
            
            errorbar(xcoords(iC,iV,iT),tcAcc.mean(iC,iV,iT),tcAcc.err(iC,iV,iT), '.k', 'CapSize', fp.CapSize, 'LineWidth', fp.ErrorBarLineWidth)
        end     
    end

    if plotStats
        xPairs = [1 3; 1 2; 2 3]; % invalid-valid, invalid-neutral, neutral-valid
        yMax = 0.93; yDiff = 0.04;
        yBracket = [yMax yMax-yDiff yMax-2*yDiff]; % pairwise brackets y position 
        yMain = 115; % significace text y position
        yMax = 107; yDiff = 5; 
        yPairs = [yMax yMax-yDiff yMax-yDiff*2]; % y position for significant text 
        
        clear stats % structure with stats information
        % stats.pairwise{1} = {'***','**',''; '**','',''}; 
        stats.pairwise{1} = {'***','**','*'; '**','***','*'}; % target by pair
        stats.main{1} = {'***','*'}; 
        for iT = 1:2 % two targets
            % pairwise comparisons
            for iP = 1:3 
                txt = twcf_annotateStats( (xVals(iT,xPairs(iP,2)) + xVals(iT,xPairs(iP,1)))/2, yPairs(iP), stats.pairwise{1}{iT,iP});
                txt.FontSize = 14;
                zoot_drawBracket(xVals(iT,xPairs(iP,1)),xVals(iT,xPairs(iP,2)),yBracket(iP),0.5)
            end
            % main effect
            txt = twcf_annotateStats(xVals(iT,2),yMain,stats.pairwise{1}{iT});
            txt.FontSize = 14;
        end
    end
end

figTitle = 'TX_Acc';
if saveplots
    export_fig(gcf,sprintf('%s/%s.%s', figDir, figTitle, figType), '-transparent','-p10')
    % print(gcf, '-dpdf', '/Users/jennymotzer/Documents/GitHub/ZOOT/experiment-files/groupFigs/TX_Acc.pdf') % needed or else background turns black, do not erase
end

%% Side labels
% [ax3, h3] = suplabel('Target Absent', 't', [0.08 0.08 1.3 .88]);
% [ax4, h4] = suplabel('Target Present', 't', [0.08 0.08 .45 .88]);
% [ax5, h5] = suplabel('T1', 'tt', [0.08 0.08 .27 0.8]);
% [ax6, h6] = suplabel('T2', 'tt', [0.08 0.08 .6 0.8]);
% [ax7, h7] = suplabel('T1', 'tt', [0.08 0.08 1.15 0.8]);
% [ax8, h8] = suplabel('T2', 'tt', [0.08 0.08 1.47 0.8]);
