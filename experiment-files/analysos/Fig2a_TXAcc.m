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
fp = figureparams;

% /// Define your xVals once. Then, they can be used throughout.
% /// Would be even better to define in figureparams once to be used across all figures. 
xVals = [0.7778 1 1.222;... % T1 (
    1.7778 2 2.2222]; % T2

% /// Also define colors just once (see changes to figure params). Make use of logical indexing rather
% than if loops.
% /// Same comment for bar widths (see changes to figure params). 
% /// size of figure should also be just defined once in figureparams. 

%% FIGURE 2A: Acc by target contrast
figure
set(gcf,'Position',[100 100 500 200])

for iContrast = 1:2
    subplot(1,2,iContrast)
    zoot_figureStyle; hold on
    for iTarget = 1:2
        for iValid = 1:3
            b = bar(xVals(iTarget,iValid), tcAcc.mean(iContrast, iValid, iTarget),...
                'LineWidth',fp.bar.lineWidth(iContrast),'BarWidth',fp.bar.barWidth(iContrast),...
                'EdgeColor',fp.colorsTargets(iTarget,iValid,:),'FaceColor',fp.bar.FaceColor(iContrast,iTarget,iValid,:)); 
            % s = scatter(xVals(iTarget,iValid), squeeze(tcAcc_scatterplot.(targ_contrasts{iContrast})(iValid,:,iTarget)));

            swarmchart( xVals(iTarget,iValid), squeeze(tcAcc_scatterplot.(targ_contrasts{iContrast})(iValid,:,iTarget)),'filled',...
                'SizeData',fp.scatter.size,'XJitterWidth',100,'MarkerFaceColor',fp.colorsTargets(iTarget,iValid,:),'MarkerEdgeColor',fp.scatter.edgeColor,'MarkerFaceAlpha',fp.scatter.alpha(iValid) ); 

            % /// subs do not need to be looped. 
            % for iSub = 1:15
            %     s = scatter(xcoords_scatter(iValid, iSub, iTarget), tcAcc_scatterplot.(targ_contrasts{iContrast})(iValid,iSub,iTarget));
            %     s.MarkerEdgeColor = [1 1 1];
            %     if iTarget == 1
            %         s.MarkerFaceColor = fp.blue(1,:);
            %     elseif iTarget == 2
            %         s.MarkerFaceColor= fp.orange(1,:);
            %     end
            %     s.MarkerFaceAlpha = fp.shade_scatter(iValid);
            % end

            errorbar(xcoords(iContrast, iValid, iTarget),tcAcc.mean(iContrast, iValid, iTarget),tcAcc.err(iContrast, iValid, iTarget), '.k', 'CapSize', fp.CapSize, 'LineWidth', fp.ErrorBarLineWidth)
            
            % if iContrast == 1      
            %     % if iTarget == 1
            %     %     b.FaceColor = fp.blue(iValid,:);
            %     %     b.EdgeColor = fp.blue(iValid,:);
            %     % elseif iTarget == 2
            %     %     b.FaceColor= fp.orange(iValid,:);
            %     %     b.EdgeColor = fp.orange(iValid,:);
            %     % end
            %     % b.BarWidth = 0.2; 
            % elseif iContrast == 2
            %     % b.FaceColor = [1 1 1];
            %     % if iTarget == 1
            %     %     b.EdgeColor = fp.blue(iValid,:);
            %     % elseif iTarget == 2
            %     %     b.EdgeColor = fp.orange(iValid,:);
            %     % end
            %     % b.LineWidth = 2;
            %     % b.BarWidth = 0.18;
            % end
   
        end

    end

    if plotStats
        if iContrast==1
            kt_annotateStats(1,92,'***');
            kt_drawBracket(.7778, 1.2222, .90)
            kt_annotateStats(1.1111,88,'**');
            kt_drawBracket(1, 1.2222, .86)

            kt_annotateStats(2,93.5,'**');
            kt_drawBracket(1.7778, 2.2222, .91)
            kt_annotateStats(2.111,89.5,'*');
            kt_drawBracket(2, 2.2222, .875)

            kt_annotateStats(1,98,'________');
            kt_annotateStats(1,99,'*** Validity');

            kt_annotateStats(2,98,'________');
            kt_annotateStats(2,99,'* Validity');
            
        elseif iContrast == 2
            kt_annotateStats(1,96.5,'*');
            kt_drawBracket(.7778, 1.2222, .945)
        end
    end

    ylabel('Accuracy (%)')
    ylim([30 100])
    set(gca, 'ytick', 30:10:100)
    xlim([0.5 2.5])
    xticks([xVals(1,:) xVals(2,:)]) 
    set(gca, 'xticklabel', {'V', 'N','I','V','N','I'})
    ax = gca;
    ax.Position=ax.Position.*[1 1 1 0.85]; % makes more space above fig
end

[ax3, h3] = suplabel('Target Absent', 't', [0.08 0.08 1.3 .88]);
[ax4, h4] = suplabel('Target Present', 't', [0.08 0.08 .45 .88]);
[ax5, h5] = suplabel('T1', 'tt', [0.08 0.08 .27 0.8]);
[ax6, h6] = suplabel('T2', 'tt', [0.08 0.08 .6 0.8]);
[ax7, h7] = suplabel('T1', 'tt', [0.08 0.08 1.15 0.8]);
[ax8, h8] = suplabel('T2', 'tt', [0.08 0.08 1.47 0.8]);

figTitle = 'TX_Acc';
if saveplots
    export_fig(gcf,sprintf('%s/%s.%s', figDir, figTitle, figType), '-transparent','-p10')
    % print(gcf, '-dpdf', '/Users/jennymotzer/Documents/GitHub/ZOOT/experiment-files/groupFigs/TX_Acc.pdf') % needed or else background turns black, do not erase
    % /// The second print will override the first statement.
    % so then, can just stick to one, either first or second. The second is
    % not fixing the first, it's overriding the first. 
end