addpath('/Users/jennymotzer/Documents/GitHub/ZOOT/experiment-files/')
addpath('/Users/jennymotzer/Documents/GitHub/ZOOT/experiment-files/functions/export_fig-master/')

fp = figureparams;
saveplots = 1;
plotStats = 1;
figType = 'pdf';

%% SUPPLEMENTARY FIG: RT plot TXNX
figure();
set(gcf,'Position',[100 100 500 400])
set(gcf, 'Renderer', 'painters')
for iContrast = 1:numel(contrastConds)
    subplot(2,2,iContrast)
    for iTarget = 1:2
        for iValid = 1:3
            for iSub = 1:15
                c = scatter(xcoords_scatter(iValid, iSub, iTarget), TXNX_RT_scatterplot.(contrasts{iContrast})(iValid,iSub,iTarget));
                    c.MarkerEdgeColor = [1 1 1];
                    if iTarget == 1
                        c.MarkerFaceColor = fp.blue(1,:);
                    elseif iTarget == 2
                        c.MarkerFaceColor= fp.orange(1,:);
                    end
                     c.MarkerFaceAlpha = fp.shade_scatter(iValid);
                     hold on 
            end
            s = scatter(xcoords(iContrast, iValid, iTarget), TXNX_RT.mean(iContrast, iValid, iTarget), 80, 'filled');
            kt_figureStyle();
            errorbar(xcoords(iContrast, iValid, iTarget),TXNX_RT.mean(iContrast, iValid, iTarget),TXNX_RT.err(iContrast, iValid, iTarget), '.k', 'CapSize', fp.CapSize, 'LineWidth', fp.ErrorBarLineWidth)
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
            kt_annotateStats(1,.93,'***');
            kt_drawBracket(.7778, 1.2222, 0.93)
            kt_annotateStats(.89,.82,'**');
            kt_drawBracket(.7778, 1, .82)
            % kt_annotateStats(1.1111,.58,'~');
            % kt_drawBracket(1, 1.2222, .85)

            kt_annotateStats(2.1,.82,'**');
            kt_drawBracket(2, 2.2222, .82)
            % kt_annotateStats(2,.55,'~');
            % kt_drawBracket(1.7778, 2.2222, .78)

            kt_annotateStats(1,1.15,'_______');
            kt_annotateStats(1,1.175,'*** Validity');

            kt_annotateStats(2, 1.15,'_______');
            kt_annotateStats(2,1.175,'* Validity');
            %
            % kt_annotateStats(1.5, 1.3,'___________________');
            % kt_annotateStats(1.5, 1.35,'** Target');
            % kt_annotateStats(1.5,1.45,'*** Validity');
        end

        if iContrast == 3
            kt_annotateStats(1,.95,'***');
            kt_drawBracket(.7778, 1.2222, .8)
            kt_annotateStats(1.1111,.85,'*');
            kt_drawBracket(1, 1.2222, .7)

            kt_annotateStats(2,.82,'**');
            kt_drawBracket(1.7778, 2.2222, .70)
            kt_annotateStats(2.1111,.7,'*');
            kt_drawBracket(2, 2.2222, .6)

            kt_annotateStats(1,1.15,'_______');
            kt_annotateStats(1,1.175,'** Validity');

            kt_annotateStats(2, 1.15,'_______');
            kt_annotateStats(2,1.175,'*** Validity');
            %
            % kt_annotateStats(1.5, 1.3,'___________________');
            % kt_annotateStats(1.5, 1.35,'** Target');
            % kt_annotateStats(1.5,1.45,'*** Validity');
        end

        if iContrast == 2
            kt_annotateStats(1,.66,'*');
            kt_drawBracket(.7778, 1.2222, .985)
            % kt_annotateStats(.89,.38,'~');
            % kt_drawBracket(.7778, 1, .8)


            kt_annotateStats(2,.75,'**');
            kt_drawBracket(1.7778, 2.2222, .98)
            kt_annotateStats(2.12,.62,'*');
            kt_drawBracket(2.02, 2.2222, .64)
            % kt_annotateStats(1.89,.27,'~');
            % kt_drawBracket(1.7778, 1.98, .55)

            kt_annotateStats(2, 1.15,'_______');
            kt_annotateStats(2,1.175,'*** Validity');

            % kt_annotateStats(1.5, 1.3,'___________________');
            %   kt_annotateStats(1.5, 1.35,'** Target');
            %   kt_annotateStats(1.5,1.45,'*** Validity');
        end
    end
    ylabel('Reaction time (s)')
    ylim([0 1.5])
    set(gca, 'ytick', 0:.5:1.5)
    xlim([0.5 2.5])
    xticks([0.7778 1 1.222 1.7778 2 2.2222])
    set(gca, 'xticklabel', {'V', 'N', 'I'})
    ax = gca;
    ax.XGrid = 'off';
    ax.YGrid = 'off';
    
end
[ax1, h1] = suplabel('Non-target Present', 'y', [0.08 0.08 .84 1.325]);
[ax2, h2] = suplabel('Non-target Absent', 'y', [0.08 0.08 .84 0.375]);
[ax3, h3] = suplabel('Target Absent', 't', [0.08 0.08 1.3 0.9]);
[ax4, h4] = suplabel('Target Present', 't', [0.08 0.08 .45 0.9]);
[ax5, h5] = suplabel('T1', 'tt', [0.08 0.08 .27 0.86]);
[ax6, h6] = suplabel('T2', 'tt', [0.08 0.08 .6 0.86]);
[ax7, h7] = suplabel('T1', 'tt', [0.08 0.08 1.15 0.86]);
[ax8, h8] = suplabel('T2', 'tt', [0.08 0.08 1.47 0.86]);

figTitle = 'TXNX_RT';
if saveplots
    export_fig(gcf,sprintf('%s/%s.%s', figDir, figTitle, figType), '-transparent','-p10')
    print(gcf, '-dpdf', '/Users/jennymotzer/Documents/GitHub/ZOOT/experiment-files/groupFigs/TXNX_RT.pdf')
end
