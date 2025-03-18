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

% /// Define your xVals once. Then, they can be used throughout.
% /// Would be even better to define in figureparams once to be used across all figures. 
% xVals = [0.7778 1 1.222;... % T1 (
%     1.7778 2 2.2222]; % T2
xVals = fp.xVals; 

% /// Also define colors just once (see changes to figure params). Make use of logical indexing rather
% than if loops.
% /// Same comment for bar widths (see changes to figure params). 
% /// size of figure should also be just defined once in figureparams. 

%% FIGURE 2A: Acc by target contrast
figure
set(gcf,'Position',[100 100 500 160])

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
    end

end

% [ax3, h3] = suplabel('Target Absent', 't', [0.08 0.08 1.3 .88]);
% [ax4, h4] = suplabel('Target Present', 't', [0.08 0.08 .45 .88]);
% [ax5, h5] = suplabel('T1', 'tt', [0.08 0.08 .27 0.8]);
% [ax6, h6] = suplabel('T2', 'tt', [0.08 0.08 .6 0.8]);
% [ax7, h7] = suplabel('T1', 'tt', [0.08 0.08 1.15 0.8]);
% [ax8, h8] = suplabel('T2', 'tt', [0.08 0.08 1.47 0.8]);

figTitle = 'TX_RT';
if saveplots
    export_fig(gcf,sprintf('%s/%s.%s', figDir, figTitle, figType), '-transparent','-p10')
    % print(gcf, '-dpdf', '/Users/jennymotzer/Documents/GitHub/ZOOT/experiment-files/groupFigs/TX_Acc.pdf') % needed or else background turns black, do not erase
    % /// The second print will override the first statement.
    % so then, can just stick to one, either first or second. The second is
    % not fixing the first, it's overriding the first. 
end
