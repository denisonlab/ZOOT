function Fig2b_TXAcc % please name the function 
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
xVals = fp.xVals; 

%% FIGURE 2A: Acc by target contrast
figure
set(gcf,'Position',[100 100 500 180])

<<<<<<< HEAD:experiment-files/analysos/Fig2a_TXAcc.m
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
=======
for iContrast = 1:2
    subplot(1,2,iContrast)
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

    ylabel('Reaction time (s)    ')
    ylim([0 1.5])
    set(gca, 'ytick', 0:0.5:1)
    xlim([0.5 2.5])
    xticks([xVals(1,:) xVals(2,:)])
    set(gca, 'xticklabel', {'V', 'N','I','V','N','I'})
    % ax = gca;
    % ax.Position=ax.Position.*[1 1 1 0.85]; % makes more space above fig

    if plotStats
        if iContrast==1 % TP
            % T1 V-I
            zoot_annotateStats(1,0.93,'***');
            zoot_drawBracket(fp.xVals(1,1), fp.xVals(1,3), 0.61) 

           % T1 V-N
            zoot_annotateStats(0.89999,0.85,'**');
            zoot_drawBracket(fp.xVals(1,1), fp.xVals(1,2), 0.55)
            
            % T1 N-I
            zoot_annotateStats(1.1111,0.78,'**');
            zoot_drawBracket(fp.xVals(1,2), fp.xVals(1,3), 0.50)
            
            % T2 V-I
            zoot_annotateStats(2, 0.87,'***');
            zoot_drawBracket(fp.xVals(2,1), fp.xVals(2,3), 0.56)

            % T2 N-I
            zoot_annotateStats(2.1111,0.75,'**');
            zoot_drawBracket(fp.xVals(2,2), fp.xVals(2,3), 0.47)

            % T1 main V
            % kt_annotateStats(1,98,'________');
            % kt_annotateStats(1,99,'*** Validity');
    
            %T2 main V
            % kt_annotateStats(2,98,'________');
            % kt_annotateStats(2,99,'*** Validity');

            % overall main effects of V and T
            % kt_annotateStats(1.5,98,'________');
            % kt_annotateStats(1.5,99,'*** Validity');
            %  kt_annotateStats(1.5,99,'** Target');
            
        elseif iContrast == 2 %TA
            % T2 V-I
            zoot_annotateStats(2,.65,'*');
            zoot_drawBracket(fp.xVals(2,1), fp.xVals(2,3), 0.4)

            % T2 N-I
            zoot_annotateStats(2.1111,.57,'*');
            zoot_drawBracket(fp.xVals(2,2), fp.xVals(2,3), 0.35)

            %T2 main V
            % kt_annotateStats(2,98,'________');
            % kt_annotateStats(2,99,'** Validity');

            % overall main effects of V and T
            % kt_annotateStats(1.5,98,'________');
            % kt_annotateStats(1.5,99,'* Validity');
            %  kt_annotateStats(1.5,99,'*** Target');
        end
>>>>>>> 604f3aecba67eb89a09dcb1f81b718627d100b28:experiment-files/analysos/old_Fig2b_TXRT.m
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
<<<<<<< HEAD:experiment-files/analysos/Fig2a_TXAcc.m
=======

figTitle = 'TX_RT';
if saveplots
    export_fig(gcf,sprintf('%s/%s.%s', figDir, figTitle, figType), '-transparent','-p10')
    % print(gcf, '-dpdf', '/Users/jennymotzer/Documents/GitHub/ZOOT/experiment-files/groupFigs/TX_Acc.pdf') % needed or else background turns black, do not erase
    % /// The second print will override the first statement.
    % so then, can just stick to one, either first or second. The second is
    % not fixing the first, it's overriding the first. 
end
>>>>>>> 604f3aecba67eb89a09dcb1f81b718627d100b28:experiment-files/analysos/old_Fig2b_TXRT.m
