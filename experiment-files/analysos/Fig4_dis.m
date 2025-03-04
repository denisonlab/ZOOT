addpath('/Users/jennymotzer/Documents/GitHub/ZOOT/experiment-files/')
addpath('/Users/jennymotzer/Documents/GitHub/ZOOT/experiment-files/functions/export_fig-master/')

fp = figureparams;
saveplots = 1;
plotStats = 1;
figType = 'pdf';

%% FIGURE 4: plot discrimination
% dprime
dprimefieldnames = fieldnames(dataAll(iSub).disd);
critfieldnames = fieldnames(dataAll(iSub).disc);
figure();
set(gcf, 'Renderer', 'painters')
for iDis = 2:numel(dprimefieldnames) % for each condition (nontarget present, nontarget absent)
    subplot(2,2,iDis-1)
    kt_figureStyle();
    for iTarget = 1:2
        for iValid = 1:3
            b = bar(xcoords_SDT(iTarget, iValid), disd.(dprimefieldnames{iDis})(iTarget, iValid));
            hold on
            for iSub = 1:15
                s = scatter(xcoords_scatter(iValid, iSub, iTarget), disd_scatterplot.(Detfieldnames{iDis})(iValid, iSub, iTarget));
                s.MarkerEdgeColor = [1 1 1];
                if iTarget == 1
                    s.MarkerFaceColor = fp.blue(1,:);
                elseif iTarget == 2
                    s.MarkerFaceColor= fp.orange(1,:);
                end
                s.MarkerFaceAlpha = fp.shade_scatter(iValid);
            end
            errorbar(xcoords_SDT(iTarget, iValid),disd.(dprimefieldnames{iDis})(iTarget, iValid),disdErr.(dprimefieldnames{iDis})(iTarget, iValid), '.k','CapSize', fp.CapSize, 'LineWidth', fp.ErrorBarLineWidth)
            if iTarget == 1
                b.FaceColor = fp.blue(iValid,:);
                b.EdgeColor = fp.blue(iValid,:);
            elseif iTarget == 2
                b.FaceColor= fp.orange(iValid,:);
                b.EdgeColor = fp.orange(iValid,:);
            end
            b.BarWidth = 0.2;
        end
    end
    if plotStats
        if iDis == 2
            kt_annotateStats(1,2.4,'**');
            kt_drawBracket(.7778, 1.2222, .62)

            % kt_annotateStats(.89,2.1,'*');
            % kt_drawBracket(.7778, 1, .55)

            kt_annotateStats(2,3.2,'*');
            kt_drawBracket(1.7778, 2.2222, .80)
            % kt_annotateStats(2.1111,2.9,'~');
            % kt_drawBracket(2, 2.2222, .85)

            kt_annotateStats(1,4.05,'_______');
            kt_annotateStats(1,4.15,'** Validity');

            kt_annotateStats(2,4.05,'_______');
            kt_annotateStats(2,4.15,'* Validity');

            % kt_annotateStats(1.5, 4.5,'___________________'); %adobe
            % kt_annotateStats(1.5, 4.6,'*** Target');
            % kt_annotateStats(1.5,4.9,'** Validity');
        elseif iDis == 3
            kt_annotateStats(1,2.93,'*');
            kt_drawBracket(.7778, 1.2222, .70)

            % kt_annotateStats(2,3.3,'**');
            % kt_drawBracket(1.7778, 2.2222, .84)
            % kt_annotateStats(1.89,3,'*');
            % kt_drawBracket(1.7778, 2, .75)

            kt_annotateStats(1,4.05,'_______');
            kt_annotateStats(1,4.15,'* Validity');

            %  kt_annotateStats(2,4.05,'_______');
            % kt_annotateStats(2,4.15,'** Validity');
            % 
            % kt_annotateStats(1.5, 4.5,'___________________'); % adobe
            % kt_annotateStats(1.5, 4.6,'* Target');
            % kt_annotateStats(1.5,4.9,'** Validity');
        end
    end
    ylabel('Discrimination {\itd''}')
    ylim([0 5])
    set(gca, 'ytick', 0:1:5)
    xlim([0.5 2.5])
    xticks([0.7778 1 1.222 1.7778 2 2.2222])
    set(gca, 'xticklabel', {'V', 'N', 'I'})
    ax = gca;
    ax.XGrid = 'off';
    ax.YGrid = 'off';
end

% criterion
for iDis = 2:numel(dprimefieldnames) % for each condition (nontarget present, nontarget absent)
    subplot(2,2,iDis+1)
    kt_figureStyle();
    for iTarget = 1:2
        for iValid = 1:3
            b = bar(xcoords_SDT(iTarget, iValid), disc.(dprimefieldnames{iDis})(iTarget, iValid));
            hold on
            for iSub = 1:15
                s = scatter(xcoords_scatter(iValid, iSub, iTarget), disc_scatterplot.(Detfieldnames{iDis})(iValid, iSub, iTarget));
                s.MarkerEdgeColor = [1 1 1];
                if iTarget == 1
                    s.MarkerFaceColor = fp.blue(1,:);
                elseif iTarget == 2
                    s.MarkerFaceColor= fp.orange(1,:);
                end
                s.MarkerFaceAlpha = fp.shade_scatter(iValid);
            end
            errorbar(xcoords_SDT(iTarget, iValid),disc.(dprimefieldnames{iDis})(iTarget, iValid),discErr.(dprimefieldnames{iDis})(iTarget, iValid), '.k','CapSize', fp.CapSize, 'LineWidth', fp.ErrorBarLineWidth)
            if iTarget == 1
                b.FaceColor = fp.blue(iValid,:);
                b.EdgeColor = fp.blue(iValid,:);
            elseif iTarget == 2
                b.FaceColor= fp.orange(iValid,:);
                b.EdgeColor = fp.orange(iValid,:);
            end
            b.BarWidth = 0.2;
        end
    end

    ylim([-2 2])
    if plotStats
        if iDis == 2
            kt_annotateStats(2.1111,.4,'*');
            kt_drawBracket(2, 2.2222, 0.25)

            kt_annotateStats(2,1.1,'_______');
            kt_annotateStats(2,1.15,'* Validity');
            % 
            % kt_annotateStats(1.5, 1.6,'___________________');
            % kt_annotateStats(1.5, 1.65,'** Target:Validity');
            % kt_annotateStats(1.5, 1.6,'___________________'); % adobe

        elseif iDis ==3
            % kt_annotateStats(1.5, 1.6,'___________________');
            % kt_annotateStats(1.5, 1.65,'* Target'); % adobe

        end
    end
    ylabel('Discrimination c')
    set(gca, 'ytick', -2:1:2)
    xlim([0.5 2.5])
    xticks([0.7778 1 1.222 1.7778 2 2.2222])
    set(gca, 'xticklabel', {'V', 'N', 'I'})
    ax = gca;
    ax.XGrid = 'off';
    ax.YGrid = 'off';
end
[ax3, h3] = suplabel('Non-target Absent', 't', [0.08 0.08 1.3 0.9]);
[ax4, h4] = suplabel('Non-target Present', 't', [0.08 0.08 .45 0.9]);
[ax5, h5] = suplabel('T1', 'tt', [0.08 0.08 .27 0.86]);
[ax6, h6] = suplabel('T2', 'tt', [0.08 0.08 .6 0.86]);
[ax7, h7] = suplabel('T1', 'tt', [0.08 0.08 1.16 0.86]);
[ax8, h8] = suplabel('T2', 'tt', [0.08 0.08 1.49 0.86]);


figTitle = 'dis';
figType = 'pdf';
if saveplots
    export_fig(gcf,sprintf('%s/%s.%s', figDir, figTitle, figType), '-transparent','-p10')
    print(gcf, '-dpdf', '/Users/jennymotzer/Documents/GitHub/ZOOT/experiment-files/groupFigs/dis.pdf')
end