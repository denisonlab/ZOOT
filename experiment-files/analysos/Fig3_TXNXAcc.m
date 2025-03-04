addpath('/Users/jennymotzer/Documents/GitHub/ZOOT/experiment-files/')
addpath('/Users/jennymotzer/Documents/GitHub/ZOOT/experiment-files/functions/export_fig-master/')

% Make figure style
fp = figureparams;

saveplots = 1; 
plotStats = 1; 
figType = 'pdf';


%% FIGURE 3 - target presence x validity x target

figure();
set(gcf,'Position',[100 100 500 400])
set(gcf, 'Renderer', 'painters')
for iContrast = 1:numel(contrastConds)
    subplot(2,2,iContrast)
    kt_figureStyle();
    for iTarget = 1:2
        for iValid = 1:3
            b = bar(xcoords(iContrast, iValid, iTarget), Acc.mean(iContrast, iValid, iTarget));
            hold on 
            for iSub = 1:15
                s = scatter(xcoords_scatter(iValid, iSub, iTarget), Acc_scatterplot.(contrasts{iContrast})(iValid,iSub,iTarget));
                    s.MarkerEdgeColor = [1 1 1];
                    if iTarget == 1
                        s.MarkerFaceColor = fp.blue(1,:);
                    elseif iTarget == 2
                        s.MarkerFaceColor= fp.orange(1,:);
                    end
                     s.MarkerFaceAlpha = fp.shade_scatter(iValid);
            end
            errorbar(xcoords(iContrast, iValid, iTarget),Acc.mean(iContrast, iValid, iTarget),Acc.err(iContrast, iValid, iTarget), '.k', 'CapSize', fp.CapSize, 'LineWidth', fp.ErrorBarLineWidth)
            if iContrast == 1 || iContrast == 3
                if iTarget == 1
                    b.FaceColor = fp.blue(iValid,:);
                    b.EdgeColor = fp.blue(iValid,:);
                elseif iTarget == 2
                    b.FaceColor= fp.orange(iValid,:);
                    b.EdgeColor = fp.orange(iValid,:);
                end
                b.BarWidth = 0.2;
            elseif iContrast == 2 || iContrast == 4
                b.FaceColor = [1 1 1];
                if iTarget == 1
                    b.EdgeColor = fp.blue(iValid,:);
                elseif iTarget == 2
                    b.EdgeColor = fp.orange(iValid,:);
                end
                b.LineWidth = 2;
                b.BarWidth = 0.18;
            end
        end
    end
    hold on
    if plotStats
        if iContrast==1
            kt_annotateStats(1,88,'**');
            kt_drawBracket(.7778, 1.2222, .86)
            % kt_annotateStats(2,94,'~');
            % kt_drawBracket(1.7778, 2.2222, .9)

            kt_annotateStats(1,95,'_______');
            kt_annotateStats(1,96,'* Validity');

            % kt_annotateStats(1.5,102,'___________________');
            % kt_annotateStats(1.5,103,'*** Target');
            % kt_annotateStats(1.5,107,'** Validity');

        end

        if iContrast == 3
            kt_annotateStats(1,90,'***');
            kt_drawBracket(.7778, 1.2222, .88)
            kt_annotateStats(1.1111,85,'*');
            kt_drawBracket(1, 1.2222, .83)
            kt_annotateStats(2,96,'*');
            kt_drawBracket(1.7778, 2.2222, .94)

            kt_annotateStats(1,96,'_______');
            kt_annotateStats(1,97,'*** Validity');

            % kt_annotateStats(1.5,102,'___________________');
            % kt_annotateStats(1.5,104,'*** Target');
            % kt_annotateStats(1.5,108,'*** Validity');
        end

        if iContrast == 2
            kt_annotateStats(1,95,'*');
            kt_drawBracket(.7778, 1.2222, .93)

            % kt_annotateStats(1,100,'_______'); % incorrect!
            % kt_annotateStats(1,101,'* Validity');
        end

        if iContrast == 4
            kt_annotateStats(1.8889,100,'**');
            kt_drawBracket(1.7778, 2, .98)
        end
    end
    ylabel('Accuracy (%)')
    ylim([30 100])
    set(gca, 'ytick', 30:10:100)
    xlim([0.5 2.5])
    xticks([0.7778 1 1.222 1.7778 2 2.2222])
    set(gca, 'xticklabel', {'V', 'N', 'I'})
    ax = gca;
    ax.XGrid = 'off';
    ax.YGrid = 'off';

    
end 
[ax1, h1] = suplabel('Non-target Present', 'y', [0.08 0.08 .84 1.325]);
[ax2, h2] = suplabel('Non-target Absent', 'y', [0.08 0.08 .84 0.375]);
[ax3, h3] = suplabel('Target Absent', 't', [0.08 0.08 1.3 .90]);
[ax4, h4] = suplabel('Target Present', 't', [0.08 0.08 .45 .90]);
[ax5, h5] = suplabel('T1', 'tt', [0.08 0.08 .27 0.86]);
[ax6, h6] = suplabel('T2', 'tt', [0.08 0.08 .6 0.86]);
[ax7, h7] = suplabel('T1', 'tt', [0.08 0.08 1.15 0.86]);
[ax8, h8] = suplabel('T2', 'tt', [0.08 0.08 1.47 0.86]);

figTitle = 'TXNX_Acc';
if saveplots
    export_fig(gcf,sprintf('%s/%s.%s', figDir, figTitle, figType), '-transparent','-p10')
    print(gcf, '-dpdf','/Users/jennymotzer/Documents/GitHub/ZOOT/experiment-files/groupFigs/TXNX_Acc.pdf') %do not erase
end
