fp = figureparams;
saveplots = 0;
plotStats = 1;
figType = 'pdf';

%% FIGURE 6: accuracy of nontarget swapping overall trials (except where target and non-target features are the same)
figure();
set(gcf,'Position',[100 100 500 400])
set(gcf, 'Renderer', 'painters')
for iContrast = 1:numel(contrastConds)-1 % -1 to remove absent absent (impossible for swaps to occur)
    subplot(2,2,iContrast)
    kt_figureStyle();
    for iTarget = 1:2
        for iValid = 1:3
            b = bar(xcoords(iContrast, iValid, iTarget), Acc.NTmean(iContrast, iValid, iTarget));
            hold on
            for iSub = 1:15
                s = scatter(xcoords_scatter(iValid, iSub, iTarget), swap_Acc_scatterplot.(contrasts{iContrast})(iValid,iSub,iTarget));
                    s.MarkerEdgeColor = [1 1 1];
                    if iTarget == 1
                        s.MarkerFaceColor = fp.grey;
                    elseif iTarget == 2
                        s.MarkerFaceColor= fp.grey;
                    end
                    s.MarkerFaceAlpha = fp.shade_scatter(1);
            end
            errorbar(xcoords(iContrast, iValid, iTarget),Acc.NTmean(iContrast, iValid, iTarget),Acc.NTerr(iContrast, iValid, iTarget), '.k','CapSize', fp.CapSize, 'LineWidth', fp.ErrorBarLineWidth)
            if iContrast == 1 || iContrast == 3
                if iTarget == 1
                    b.FaceColor = fp.grey;
                    b.EdgeColor = fp.grey;
                elseif iTarget == 2
                    b.FaceColor= fp.grey;
                    b.EdgeColor = fp.grey;
                end
                b.FaceAlpha = shade(1);
                % b.EdgeAlpha = shade(1);
                b.BarWidth = 0.2;
            elseif iContrast == 2 || iContrast == 4
                b.FaceColor = [1 1 1];
                % b.EdgeAlpha = shade(1);
                if iTarget == 1
                    b.EdgeColor = fp.grey;
                elseif iTarget == 2
                    b.EdgeColor = fp.grey;
                end
                b.LineWidth = 2;
                b.BarWidth = 0.18;
                % b.EdgeAlpha = shade(1);
            end
        end
    end
    hold on
    if plotStats
        if iContrast==1
            kt_annotateStats(1,27.75,'*');
            kt_drawBracket(.7778, 1.2222, .97)
            % kt_annotateStats(2,94,'~');
            % kt_drawBracket(1.7778, 2.2222, .9)

            kt_annotateStats(1,33,'_______');
            kt_annotateStats(1,33.25,'* Validity');

            % kt_annotateStats(1.5,37.25,'___________________');
            % kt_annotateStats(1.5,37.5,'*** Target');
            % kt_annotateStats(1.5,40.75,'* Validity'); %adobe
        elseif iContrast == 3
            kt_annotateStats(1,15.25,'***');
            kt_drawBracket(.7778, 1.2222, 1.05)

            kt_annotateStats(1,25.5,'_______');
            kt_annotateStats(1,25.75,'** Validity');
            % 
            % kt_annotateStats(1.5,35.25,'___________________');
            % kt_annotateStats(1.5,38.75,'** Target');
            % kt_annotateStats(1.5,41.5,'*** Validity');
            % kt_annotateStats(1.5,35.5,'** Target:Validity'); % adobe
        elseif iContrast == 2
            kt_annotateStats(1,15.25,'**');
            kt_drawBracket(.7778, 1.2222, .82)

            kt_annotateStats(1,25,'_______');
            kt_annotateStats(1,25.25,'* Validity');
        end
    end
    hold off
    label_y = ylabel(sprintf('Reports of non-target feature \n(normalized %%) \n'));
    ylim([0 60]) % original [0 20]
    label_y.Position(1) = 0.45;
    ax = gca;
    set(gca, 'ytick', 0:10:60) % original 0:5:20
    hold on
    xlim([0.5 2.5])
    xticks([0.7778 1 1.222 1.7778 2 2.2222])
    set(gca, 'xticklabel', {'V', 'N', 'I'}, 'FontSize', 9.5)

    hold on
    ax = gca;
    ax.Position = ax.Position.*[1 1 1 0.85]; % decreases y axis a bit to make more room for stats above graph
    ax.XGrid = 'off';
    ax.YGrid = 'off';

end
[ax1, h1] = suplabel('Non-target Present', 'y', [0.08 0.08 .84 1.325]);
[ax2, h2] = suplabel('Non-target Absent', 'y', [0.08 0.08 .84 0.375]);
[ax3, h3] = suplabel('Target Absent', 't', [0.08 0.08 1.3 .90]);
[ax4, h4] = suplabel('Target Present', 't', [0.08 0.08 .45 .90]);
[ax5, h5] = suplabel('T1', 'tt', [0.08 0.08 .27 0.82]);
[ax6, h6] = suplabel('T2', 'tt', [0.08 0.08 .6 0.82]);
[ax7, h7] = suplabel('T1', 'tt', [0.08 0.08 1.15 0.82]);
[ax8, h8] = suplabel('T2', 'tt', [0.08 0.08 1.47 0.82]);

figTitle = 'Swap';
if saveplots
    export_fig(gcf,sprintf('%s/%s.%s', figDir, figTitle, figType), '-transparent','-p10')
    print(gcf, '-dpdf', '/Users/jennymotzer/Documents/GitHub/ZOOT/experiment-files/groupFigs/Swap.pdf')
end