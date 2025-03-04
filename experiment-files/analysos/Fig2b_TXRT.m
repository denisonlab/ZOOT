
addpath('/Users/jennymotzer/Documents/GitHub/ZOOT/experiment-files/')
addpath('/Users/jennymotzer/Documents/GitHub/ZOOT/experiment-files/functions/export_fig-master/')
% Make figure style
fp = figureparams;

saveplots = 0; 
plotStats = 1; 
figType = 'pdf';

%% FIGURE 2B: RT plot TP/TA

figure();
set(gcf,'Position',[100 100 500 200])
set(gcf, 'Renderer', 'painters')
for iContrast = 1:2
    subplot(1,2,iContrast)
    kt_figureStyle();
    for iTarget = 1:2
        for iValid = 1:3
            for iSub = 1:15
                c = scatter(xcoords_scatter(iValid, iSub, iTarget), TPTA_RT_scatterplot.(targ_contrasts{iContrast})(iValid,iSub,iTarget));
                    c.MarkerEdgeColor = [1 1 1];
                    if iTarget == 1
                        c.MarkerFaceColor = fp.blue(1,:);
                    elseif iTarget == 2
                        c.MarkerFaceColor= fp.orange(1,:);
                    end
                     c.MarkerFaceAlpha = fp.shade_scatter(iValid);
                     hold on 
            end
            s = scatter(xcoords(iContrast, iValid, iTarget), TPTA_RT.mean(iContrast, iValid, iTarget), 80, 'filled');
            errorbar(xcoords(iContrast, iValid, iTarget),TPTA_RT.mean(iContrast, iValid, iTarget),TPTA_RT.err(iContrast, iValid, iTarget), '.k', 'CapSize', fp.CapSize, 'LineWidth', fp.ErrorBarLineWidth)
            if iContrast == 1 || iContrast == 3
                if iTarget == 1
                    s.MarkerFaceColor = fp.blue(iValid,:);
                    s.MarkerEdgeColor = fp.blue(iValid,:);
                elseif iTarget == 2
                    s.MarkerFaceColor= fp.orange(iValid,:);
                    s.MarkerEdgeColor = fp.orange(iValid,:);
                end
            elseif iContrast == 2 || iContrast == 4
                s.MarkerFaceColor = [1 1 1];
                if iTarget == 1
                    s.MarkerEdgeColor = fp.blue(iValid,:);
                elseif iTarget == 2
                    s.MarkerEdgeColor = fp.orange(iValid,:);
                end
                s.LineWidth = 1.5;
            end
        end
    end

    if plotStats
        if iContrast==1
            kt_annotateStats(1,.99,'***');
            kt_drawBracket(.7778, 1.2222, 1.1)
            kt_annotateStats(.89,.91,'**');
            kt_drawBracket(.7778, 1, .75)
            kt_annotateStats(1.111,.85,'**');
            kt_drawBracket(1, 1.2222, .7)

            kt_annotateStats(2,.86,'***');
            kt_drawBracket(1.7778, 2.2222, .7)
            kt_annotateStats(2.1,.77,'**');
            kt_drawBracket(2, 2.2222, .64)

            kt_annotateStats(1,1.175,'_______');
            kt_annotateStats(1,1.2,'*** Validity');

            kt_annotateStats(2, 1.175,'_______');
            kt_annotateStats(2,1.2,'** Validity');

            % kt_annotateStats(1.5, 1.325,'___________________'); % will be
            % done in adobe
            % kt_annotateStats(1.5, 1.35,'** Target');
            % kt_annotateStats(1.5,1.43,'*** Validity');
        end

        if iContrast == 2
            kt_annotateStats(2,.59,'*');
            kt_drawBracket(1.7778, 2.2222, .98)
            kt_annotateStats(2.1111,.49,'*');
            kt_drawBracket(2, 2.2222, .73)

            kt_annotateStats(2, 1.175,'_______');
            kt_annotateStats(2,1.2,'** Validity');
            % 
            % kt_annotateStats(1.5, 1.325,'___________________'); % adobe
            % kt_annotateStats(1.5, 1.35,'*** Target');
            % kt_annotateStats(1.5,1.43,'* Validity');
        end
    end
     ylabel('Reaction time (s)')
    ylim([0 1.5])
    set(gca, 'ytick', 0:.5:1.5)
    ax = gca;
    xlim([0.5 2.5])
    xticks([0.7778 1 1.222 1.7778 2 2.2222])
    set(gca, 'xticklabel', {'V', 'N', 'I'})
    ax.XGrid = 'off';
    ax.YGrid = 'off'; 
end

% makes super label above plots for T1/T2 and Target Present/Absent
[ax3, h3] = suplabel('Target Absent', 't', [0.08 0.08 1.3 0.9]);
[ax4, h4] = suplabel('Target Present', 't', [0.08 0.08 .45 0.9]);
[ax5, h5] = suplabel('T1', 'tt', [0.08 0.08 .27 0.86]);
[ax6, h6] = suplabel('T2', 'tt', [0.08 0.08 .6 0.86]);
[ax7, h7] = suplabel('T1', 'tt', [0.08 0.08 1.15 0.86]);
[ax8, h8] = suplabel('T2', 'tt', [0.08 0.08 1.47 0.86]);

figTitle = 'TX_RT';
if saveplots
    export_fig(gcf,sprintf('%s/%s.%s', figDir, figTitle, figType), '-transparent','-p10')
    % print(gcf, '-dpdf', '/Users/jennymotzer/Documents/GitHub/ZOOT/experiment-files/groupFigs/TX_RT.pdf')
end

