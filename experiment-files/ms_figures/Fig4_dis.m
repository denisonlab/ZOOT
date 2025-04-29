function Fig4_dis 
% Fig4_dis plots dis d' and c by non-target presence vs. absence 
% for zoot

%% Settings 
user = 'jenny'; % 'jenny' 'karenlab' 'karen'

% Fig saving
savePlots = 0; 
figType = 'pdf';
figTitle = 'Fig4_dis';
figNum = 4; 

% Fig plotting
plotStats = 0; 
plotSubjects = 1;

%% Setup
[zootDir,figDir] = pathToZoot(user); 

% Load the data
datafile = sprintf('%s/experiment-files/zoot_dataAll.mat',zootDir); 
load(datafile)

% Figure styling
fp = zoot_figureparams;
xVals = fp.xVals; 

[zootDir,figDir] = pathToZoot(user); % run again bc dataall overwrites fig dir 

%% FIGURE 2A: Dis d' and c by non-target presence
clear panel 
figure
set(gcf,'Position',fp.rect)

count = 1;
tcl = tiledlayout(2,2,'TileSpacing','compact','OuterPosition',fp.OuterPosition); % adds y height
for iRep = 1:2 % 1 is d'; 2 is c
    for iC = 2:3 % 2 is non-target present; 3 is non-target absent
        panel(count).info = nexttile;
        zoot_figureStyle(fp,figNum)
        switch count
            case {1,2} % d'
                xticklabels('')
                ylim([0 4.5])
                yticks(0:1:4.5)
            case {3,4} % c
                xticklabels({'V','N','I','V','N','I'})
                ylim([-1.5 1.5])
                yticks(-1.5:0.5:1.5)
        end
        switch count
            case {1}
                ylabel('Discrimination {\itd''}')
                title(sprintf('Non-target present\n'),'FontWeight','normal','FontSize',14)
            case {2}
                title(sprintf('Non-target absent\n'),'FontWeight','normal','FontSize',14)
            case {3}
                ylabel('Discrimination c')        
        end
        for iT = 1:2
            for iV = 1:3
                switch count
                    case {1,2} % Dis d'      
                        b = zoot_bar(xVals(iT,iV),squeeze(disd_scatterplot.(Detfieldnames{iC})(iV,:,iT)),...
                            iC,iV,iT,plotSubjects,disdErr.(Detfieldnames{iC})(iT, iV), figNum);
                    case {3,4}  %Dis c
                        zoot_bar(xVals(iT,iV),squeeze(disc_scatterplot.(Detfieldnames{iC})(iV,:,iT)),...
                            iC,iV,iT,plotSubjects,discErr.(Detfieldnames{iC})(iT, iV), figNum);
                end
            end
        end

        % if plotStats
        %     zoot_plotStats
        % end

        count = count+1;
    end
end

if savePlots
    export_fig(gcf,sprintf('%s/%s.%s', figDir, figTitle, figType), '-transparent','-p10')
    % print(gcf, '-dpdf', '/Users/jennymotzer/Documents/GitHub/ZOOT/experiment-files/groupFigs/TX_Acc.pdf') % needed or else background turns black, do not erase
end

%% subsampled dis plot

clear panel 
figure
set(gcf,'Position',fp.rect)

count = 1;
tcl = tiledlayout(2,2,'TileSpacing','compact','OuterPosition',fp.OuterPosition); % adds y height
for iRep = 1:2 % 1 is d'; 2 is c
    for iC = 2:3 % 2 is non-target present; 3 is non-target absent
        panel(count).info = nexttile;
        zoot_figureStyle(fp, figNum)
        switch count
            case {1,2} % d'
                xticklabels('')
                ylim([0 4.5])
                yticks(0:1:4.5)
            case {3,4} % c
                xticklabels({'V','N','I','V','N','I'})
                ylim([-1.5 1.5])
                yticks(-1.5:0.5:1.5)
        end
        switch count
            case {1}
                ylabel('Discrimination {\itd''}')
                title(sprintf('Non-target present\n'),'FontWeight','normal','FontSize',14)
            case {2}
                title(sprintf('Non-target absent\n'),'FontWeight','normal','FontSize',14)
            case {3}
                ylabel('Discrimination c')        
        end
        for iT = 1:2
            for iV = 1:3
                switch count
                    case {1,2} % Dis d'      
                        b = zoot_bar(xVals(iT,iV),squeeze(disd_sub_scatterplot.(Detfieldnames{iC})(iV,:,iT)),...
                            iC,iV,iT,plotSubjects,disdErr_sub.(Detfieldnames{iC})(iT, iV), figNum);
                    case {3,4}  %Dis c
                        zoot_bar(xVals(iT,iV),squeeze(disc_sub_scatterplot.(Detfieldnames{iC})(iV,:,iT)),...
                            iC,iV,iT,plotSubjects,discErr_sub.(Detfieldnames{iC})(iT, iV), figNum);
                end
            end
        end

        if plotStats
            zoot_plotStats
        end

        count = count+1;
    end
end


%% single participant to compare log lin corrections to all trials vs only extreme trials


for iSub = 1:15
    clear panel
    figure
    set(gcf,'Position',fp.rect)
    count = 1;
    tcl = tiledlayout(2,2,'TileSpacing','compact','OuterPosition',fp.OuterPosition); % adds y height
    sgtitle([subs(iSub)])
    for iRep = 1:2 % 1 is d'; 2 is c
        for iC = 2:3 % 2 is non-target present; 3 is non-target absent
            panel(count).info = nexttile;
            zoot_figureStyle(fp)
            switch count
                case {1,2} % d'
                    xticklabels('')
                    ylim([0 4.5])
                    yticks(0:1:4.5)
                case {3,4} % c
                    xticklabels({'V','N','I','V','N','I'})
                    ylim([-1.5 1.5])
                    yticks(-1.5:0.5:1.5)
            end
            switch count
                case {1}
                    ylabel('Discrimination {\itd''}')
                    title(sprintf('Non-target present\n'),'FontWeight','normal','FontSize',14)
                case {2}
                    title(sprintf('Non-target absent\n'),'FontWeight','normal','FontSize',14)
                case {3}
                    ylabel('Discrimination c')
            end
            for iT = 1:2
                for iV = 1:3
                    switch count
                        case {1,2} % Dis d'
                            scatter(xVals(iT,iV),squeeze(disd_scatterplot.(Detfieldnames{iC})(iV,iSub,iT)), 20, 'r', 'filled');
                            scatter(xVals(iT,iV),squeeze(disd_extreme_scatterplot.(Detfieldnames{iC})(iV,iSub,iT)), 20, 'b', 'filled');
                        case {3,4}  %Dis c
                            scatter(xVals(iT,iV),squeeze(disc_scatterplot.(Detfieldnames{iC})(iV,iSub,iT)), 20, 'r', 'filled');
                            scatter(xVals(iT,iV),squeeze(disc_extreme_scatterplot.(Detfieldnames{iC})(iV,iSub,iT)), 20 , 'b', 'filled');
                    end
                end
            end

            if plotStats
                zoot_plotStats
            end

            count = count+1;
        end
    end
    legend('all trials', 'extreme trials only', 'Location', 'bestoutside')
end

%% extreme only plot 

clear panel 
figure
set(gcf,'Position',fp.rect)

count = 1;
tcl = tiledlayout(2,2,'TileSpacing','compact','OuterPosition',fp.OuterPosition); % adds y height
for iRep = 1:2 % 1 is d'; 2 is c
    for iC = 2:3 % 2 is non-target present; 3 is non-target absent
        panel(count).info = nexttile;
        zoot_figureStyle(fp)
        switch count
            case {1,2} % d'
                xticklabels('')
                ylim([0 4.5])
                yticks(0:1:4.5)
            case {3,4} % c
                xticklabels({'V','N','I','V','N','I'})
                ylim([-1.5 1.5])
                yticks(-1.5:0.5:1.5)
        end
        switch count
            case {1}
                ylabel('Discrimination {\itd''}')
                title(sprintf('Non-target present\n'),'FontWeight','normal','FontSize',14)
            case {2}
                title(sprintf('Non-target absent\n'),'FontWeight','normal','FontSize',14)
            case {3}
                ylabel('Discrimination c')        
        end
        for iT = 1:2
            for iV = 1:3
                switch count
                    case {1,2} % Dis d'      
                        b = zoot_bar(xVals(iT,iV),squeeze(disd_extreme_scatterplot.(Detfieldnames{iC})(iV,:,iT)),...
                            iC,iV,iT,plotSubjects,extreme_disdErr.(Detfieldnames{iC})(iT, iV), figNum);
                    case {3,4}  %Dis c
                        zoot_bar(xVals(iT,iV),squeeze(disc_extreme_scatterplot.(Detfieldnames{iC})(iV,:,iT)),...
                            iC,iV,iT,plotSubjects,extreme_discErr.(Detfieldnames{iC})(iT, iV), figNum);
                end
            end
        end

        if plotStats
            zoot_plotStats
        end

        count = count+1;
    end
end

%% unity line plots - d'
% 
% clear panel 
% figure
% set(gcf,'Position',fp.rect)

y = [1 1 2]; % V vs. I, V vs. N, N vs. I
x = [3 2 3]; % V vs. I, V vs. N, N vs. I

ytitle=([{'Valid'}, {'Valid'}, {'Neutral'}]);
xtitle=([{'Invalid'}, {'Neutral'}, {'Invalid'}]);

for iRep = 1:3
    clear panel
    figure
    set(gcf,'Position',fp.rect)
    tcl = tiledlayout(2,2,'TileSpacing','compact','OuterPosition',fp.OuterPosition); % adds y height
    sgtitle([ytitle{iRep} ' vs. ' xtitle{iRep}])
    count = 1;
    for iT = 1:2 % T1, T2
        for iC = 2:3 % 2 is non-target present; 3 is non-target absent
            panel(count).info = nexttile;        
            % switch count
            %     case {1,2} % d'
            %         xticklabels('')
            %     case {3,4} % c
            %         % xticklabels({'V','N','I','V','N','I'})
            %         % ylim([-1.5 1.5])
            %         % yticks(-1.5:0.5:1.5)
            % end
      
            % for iT = 1:2
            % for iV = 1:3
            % switch count
            %     case {1,2} % Dis d'
            plot([0 4.5], [0 4.5], '-k')
            hold on
            s1 = swarmchart(disd_extreme_scatterplot.(Detfieldnames{iC})(x(iRep),:,iT), disd_extreme_scatterplot.(Detfieldnames{iC})(y(iRep),:,iT), 'MarkerEdgeColor', 'r', 'MarkerFaceColor', 'r', 'MarkerFaceAlpha', 0.5);
            s2 = swarmchart(disd_scatterplot.(Detfieldnames{iC})(x(iRep),:,iT), disd_scatterplot.(Detfieldnames{iC})(y(iRep),:,iT), 'MarkerEdgeColor', 'b', 'MarkerFaceColor', 'b', 'MarkerFaceAlpha', 0.5);
            for iSub = 1:15
                plot([disd_scatterplot.(Detfieldnames{iC})(x(iRep),iSub,iT) disd_extreme_scatterplot.(Detfieldnames{iC})(x(iRep),iSub,iT)], [disd_scatterplot.(Detfieldnames{iC})(y(iRep),iSub,iT) disd_extreme_scatterplot.(Detfieldnames{iC})(y(iRep),iSub,iT)],'-k', 'LineWidth', 1.5)
            end
            xlim([0 4.5])
            ylim([0 4.5])
            yticks(0:1:4.5)
            xticks(0:1:4.5)
            switch count
                case {1}
                    ylabel([ytitle{iRep} ' Discrimination {\itd''}'])
                    title(sprintf('Non-target present\n'),'FontWeight','normal','FontSize',14)
                case {2}
                    title(sprintf('Non-target absent\n'),'FontWeight','normal','FontSize',14)
                case {3}
                    ylabel([ytitle{iRep} ' Discrimination {\itd''}'])
                    xlabel([xtitle{iRep} ' Discrimination {\itd''}'])
                case{4}
                  xlabel([xtitle{iRep} ' Discrimination {\itd''}'])


            end

            %         b = zoot_scatter(xVals(iT,iV),squeeze(disd_extreme_scatterplot.(Detfieldnames{iC})(iV,:,iT)),...
            %             iC,iV,iT,plotSubjects,extreme_disdErr.(Detfieldnames{iC})(iT, iV), figNum);
            %     % case {3,4}  %Dis c
            %         zoot_scatter(xVals(iT,iV),squeeze(disc_extreme_scatterplot.(Detfieldnames{iC})(iV,:,iT)),...
            %             iC,iV,iT,plotSubjects,extreme_discErr.(Detfieldnames{iC})(iT, iV), figNum);
            % % end
            % end
            % end

            if plotStats
                zoot_plotStats
            end

            count = count+1;
        end
    end
    [ax1, h1] = suplabel('T1', 'y', [0.08 0.08 .84 0.95]);
[ax2, h2] = suplabel('T2', 'y', [0.08 0.08 .84 0.3]);
lgd = legend([s1, s2], 'extreme only loglin', 'all loglin');
lgd.Layout.Tile ='East';

end 
%% over2N correction plot 

clear panel 
figure
set(gcf,'Position',fp.rect)

count = 1;
tcl = tiledlayout(2,2,'TileSpacing','compact','OuterPosition',fp.OuterPosition); % adds y height
for iRep = 1:2 % 1 is d'; 2 is c
    for iC = 2:3 % 2 is non-target present; 3 is non-target absent
        panel(count).info = nexttile;
        zoot_figureStyle(fp)
        switch count
            case {1,2} % d'
                xticklabels('')
                ylim([0 4.5])
                yticks(0:1:4.5)
            case {3,4} % c
                xticklabels({'V','N','I','V','N','I'})
                ylim([-1.5 1.5])
                yticks(-1.5:0.5:1.5)
        end
        switch count
            case {1}
                ylabel('Discrimination {\itd''}')
                title(sprintf('Non-target present\n'),'FontWeight','normal','FontSize',14)
            case {2}
                title(sprintf('Non-target absent\n'),'FontWeight','normal','FontSize',14)
            case {3}
                ylabel('Discrimination c')        
        end
        for iT = 1:2
            for iV = 1:3
                switch count
                    case {1,2} % Dis d'      
                        b = zoot_bar(xVals(iT,iV),squeeze(disd_over2N_scatterplot.(Detfieldnames{iC})(iV,:,iT)),...
                            iC,iV,iT,plotSubjects, over2N_disdErr.(Detfieldnames{iC})(iT, iV), figNum);
                    case {3,4}  %Dis c
                        zoot_bar(xVals(iT,iV),squeeze(disc_over2N_scatterplot.(Detfieldnames{iC})(iV,:,iT)),...
                            iC,iV,iT,plotSubjects, over2N_discErr.(Detfieldnames{iC})(iT, iV), figNum);
                end
            end
        end

        if plotStats
            zoot_plotStats
        end

        count = count+1;
    end
end

