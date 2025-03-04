addpath('/Users/jennymotzer/Documents/GitHub/ZOOT/experiment-files/')
addpath('/Users/jennymotzer/Documents/GitHub/ZOOT/experiment-files/functions/export_fig-master/')

% Make figure style
fp = figureparams;

saveplots = 1; 
plotStats = 1; 
figType = 'pdf';


%% FIGURE 2A: acc by target contrast

figure;
set(gcf,'Position',[100 100 500 200])
set(gcf, 'Renderer', 'painters')
for iContrast = 1:2
    subplot(1,2,iContrast)
    kt_figureStyle();
    for iTarget = 1:2
        for iValid = 1:3
            b = bar(xcoords(iContrast, iValid, iTarget), tcAcc.mean(iContrast, iValid, iTarget));
            hold on
            for iSub = 1:15
                s = scatter(xcoords_scatter(iValid, iSub, iTarget), tcAcc_scatterplot.(targ_contrasts{iContrast})(iValid,iSub,iTarget));
                    s.MarkerEdgeColor = [1 1 1];
                    if iTarget == 1
                        s.MarkerFaceColor = fp.blue(1,:);
                    elseif iTarget == 2
                        s.MarkerFaceColor= fp.orange(1,:);
                    end
                     s.MarkerFaceAlpha = fp.shade_scatter(iValid);
            end

            errorbar(xcoords(iContrast, iValid, iTarget),tcAcc.mean(iContrast, iValid, iTarget),tcAcc.err(iContrast, iValid, iTarget), '.k', 'CapSize', fp.CapSize, 'LineWidth', fp.ErrorBarLineWidth)
            if iContrast == 1
                if iTarget == 1
                    b.FaceColor = fp.blue(iValid,:);
                    b.EdgeColor = fp.blue(iValid,:);
                elseif iTarget == 2
                    b.FaceColor= fp.orange(iValid,:);
                    b.EdgeColor = fp.orange(iValid,:);
                end
                b.BarWidth = 0.2;
            elseif iContrast == 2
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
    if plotStats
        if iContrast==1
            kt_annotateStats(1,92,'***');
            kt_drawBracket(.7778, 1.2222, .90)
            kt_annotateStats(1.1111,88,'**');
            kt_drawBracket(1, 1.2222, .86)
            %  kt_annotateStats(.89999,86,'~');
            % kt_drawBracket(.7778, 1, .82)

            kt_annotateStats(2,93.5,'**');
            kt_drawBracket(1.7778, 2.2222, .91)
            kt_annotateStats(2.111,89.5,'*');
            kt_drawBracket(2, 2.2222, .875)

            kt_annotateStats(1,98,'________');
            kt_annotateStats(1,99,'*** Validity');

            kt_annotateStats(2,98,'________');
            kt_annotateStats(2,99,'* Validity');
            % 
            % kt_annotateStats(1.5,102,'___________________'); % to be done
            % in adobe
            % kt_annotateStats(1.5,102.5,'*** Target');
            % kt_annotateStats(1.5,105,'*** Validity');


        elseif iContrast == 2
            kt_annotateStats(1,96.5,'*');
            kt_drawBracket(.7778, 1.2222, .945)
        end
    end
    
    ylabel('Accuracy (%)', 'FontSize', 12)
    ylim([50 100])
    set(gca, 'ytick', 50:10:100)
    xlim([0.5 2.5])
    xticks([0.7778 1 1.222 1.7778 2 2.2222])
    ax = gca;
    set(gca, 'xticklabel', {'V', 'N', 'I'}, 'FontSize', 12)
    ax.Position=ax.Position.*[1 1 1 0.85]; % makes more space above fig
    ax.XGrid = 'off';
    ax.YGrid = 'off';
    
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
    print(gcf, '-dpdf', '/Users/jennymotzer/Documents/GitHub/ZOOT/experiment-files/groupFigs/TX_Acc.pdf') % needed or else background turns black, do not erase
end