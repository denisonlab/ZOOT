function Fig6_SwapErr 
% Fig6_SwapErr plots swap error over incorrect trials by target and non-target presence vs. absence 
% for zoot

%% Settings 
user = 'jenny'; % 'jenny' 'karenlab' 'karen'

% Fig saving
savePlots = 0; 
figType = 'pdf';
figTitle = 'Fig6_SwapErr';
figNum=4;

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

%% FIGURE 2A: Acc by target and non-target presence - old, without exclusions
clear panel 
figure
set(gcf,'Position',fp.rect)

count = 1;
tcl = tiledlayout(2,2,'TileSpacing','compact','OuterPosition',fp.OuterPosition); % adds y height
sgtitle('original')
    for iT = 1:2% T1; T2
        panel(count).info = nexttile;
        zoot_figureStyle(fp)
        xticklabels('')
        ylim([0 100])
        yticks(0:10:100)
        switch count
            case {1}
                ylabel(sprintf('%% error due to reporting\nnon-target feature'));
                title(sprintf('T2\n'),'FontWeight','normal','FontSize',14)
                % [ax1, h1] = suplabel('Non-target Present', 'y', [0.08 0.08 .84 1.025]);
                % [ax2, h2] = suplabel('Non-target Absent', 'y', [0.08 0.08 .84 0.325]);
                yline(50)

            case {2}
                title(sprintf('T2\n'),'FontWeight','normal','FontSize',14)
                yline(50)
        end
        for iC = 1:3 % TPNP; TANP; TPNA
            for iV = 1:3
                zoot_scatter(xVals(iT,iV),squeeze(swap_Err_Acc_scatterplot.(contrasts{iC})(iV,:,iT)),...
                    iC,iV,iT,plotSubjects,Acc.NTErrerr(iC,iV,iT), figNum);

            end
        end

        if plotStats
            zoot_plotStats
        end

        count = count+1;
    end

if savePlots
    export_fig(gcf,sprintf('%s/%s.%s', figDir, figTitle, figType), '-transparent','-p10')
    % print(gcf, '-dpdf', '/Users/jennymotzer/Documents/GitHub/ZOOT/experiment-files/groupFigs/TX_Acc.pdf') % needed or else background turns black, do not erase
end

%% part 95
% plots only participants with all data points under 95% target accuracy 
figure
set(gcf,'Position',fp.rect)

count = 1;
tcl = tiledlayout(2,2,'TileSpacing','compact','OuterPosition',fp.OuterPosition); % adds y height
sgtitle('participants with <95% accuracy')
    for iC = 1:3% 1 is TPNP; 2 is TANP; 3 is TPNA
        panel(count).info = nexttile;
        zoot_figureStyle(fp)
        xticklabels('')
        ylim([0 100])
        yticks(0:10:100)
        switch count
            case {1}
                ylabel(sprintf('%% error due to swapping\n(reporting non-target orientation)'));
                title(sprintf('Target present\n'),'FontWeight','normal','FontSize',14)
                % [ax1, h1] = suplabel('Non-target Present', 'y', [0.08 0.08 .84 1.025]);
                % [ax2, h2] = suplabel('Non-target Absent', 'y', [0.08 0.08 .84 0.325]);
                yline(50)

            case {2}
                title(sprintf('Target absent\n'),'FontWeight','normal','FontSize',14)
                yline(50)
            case{3}
                 ylabel(sprintf('%% error due to swapping \n(reporting absent) \n'));
                 yline(50)
        end
        for iT = 1:2
            for iV = 1:3
                zoot_bar(xVals(iT,iV),squeeze( partsUnder95_swap_scatterplot.(contrasts{iC})(iV,:,iT)),...
                    iC,iV,iT,plotSubjects,Acc.NTErrerr(iC,iV,iT), figNum);

            end
        end

        if plotStats
            zoot_plotStats
        end

        count = count+1;
    end

    %% point 93.75
% plots only data points under 95% target accuracy 
figure
set(gcf,'Position',fp.rect)

count = 1;
tcl = tiledlayout(1,2,'TileSpacing','compact','OuterPosition',fp.OuterPosition); % adds y height
sgtitle(' data with <93.75% accuracy')
    for iT = 1:2% 1 is TPNP; 2 is TANP; 3 is TPNA
        panel(count).info = nexttile;
        zoot_figureStyle(fp, figNum)
        xticklabels({'V', 'N','I'})
        ylim([0 100])
        yticks(0:10:100)
        switch count
            case {1}
                ylabel(sprintf('%% error due to reporting\nnon-target feature'));
                title(sprintf('T1\n'),'FontWeight','normal','FontSize',14)
                % [ax1, h1] = suplabel('Non-target Present', 'y', [0.08 0.08 .84 1.025]);
                % [ax2, h2] = suplabel('Non-target Absent', 'y', [0.08 0.08 .84 0.325]);
                yline(50)

            case {2}
                title(sprintf('T2\n'),'FontWeight','normal','FontSize',14)
                yline(50)
            % case{3}
            %      ylabel(sprintf('%% error due to swapping \n(reporting absent) \n'));
            %      yline(50)
        end
        for iC = 1:3 % TPNP, TANP, TPNA
            for iV = 1:3
              
                zoot_scatter(xVals(1,iV),squeeze(pointsUnder95_swap_scatterplot.(contrasts{iC})(iV,:,iT)),...
                    iC,iV,iT,plotSubjects,Acc.NTErrerr(iC,iV,iT), figNum);
                hold on
                plot([xVals(1,1) xVals(1,2) xVals(1,3)], [pointsUnder95_swapMeans(iC, 1, iT) pointsUnder95_swapMeans(iC, 2, iT) pointsUnder95_swapMeans(iC, 3, iT)], '-k');

            end
        end

        if plotStats
            zoot_plotStats
        end

        count = count+1;
    end
legend('', 'Target Present, Non-target Present', '', '', '', 'Target Absent, Non-target Present', '', 'Target Present, Non-target Absent', 'Location', 'southoutside')
   
