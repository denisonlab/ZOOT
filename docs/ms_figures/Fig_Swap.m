function Fig_Swap 
% Fig_Swap plots swap error rate over all trials by target and non-target presence vs. absence 
% for zoot

%% Settings 
user = 'jenny'; % 'jenny' 'karenlab' 'karen'

% Fig saving
savePlots = 0; 
figType = 'pdf';
figTitle = 'Fig6_Swap';
figNum=6;

% Fig plotting
plotStats = 1; 
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

%% FIGURE 6: Swap rates by target and non-target presence
clear panel 
figure
set(gcf,'Position',fp.rect)

count = 1;
tcl = tiledlayout(2,2,'TileSpacing','compact','OuterPosition',fp.OuterPosition); % adds y height
    for iC = 1:3% 1 is TPNP; 2 is TANP; 3 is TPNA
        panel(count).info = nexttile;
        zoot_figureStyle
        xticklabels('')
        ylim([0 60])
        yticks(0:10:60)
        switch count
            case {1}
                ylabel('Accuracy (%)')
                title(sprintf('Target present\n'),'FontWeight','normal','FontSize',14)
                [ax1, h1] = suplabel('Non-target Present', 'y', [0.08 0.08 .84 1.025]);
                [ax2, h2] = suplabel('Non-target Absent', 'y', [0.08 0.08 .84 0.325]);

            case {2}
                title(sprintf('Target absent\n'),'FontWeight','normal','FontSize',14)
            case{3}
                 ylabel('Accuracy (%)')
        end
 
        for iT = 1:2
            for iV = 1:3
               zoot_bar(xVals(iT,iV),squeeze(swap_Acc_scatterplot.(contrasts{iC})(iV,:,iT)),...
                    iC,iV,iT,plotSubjects,Acc.NTerr(iC,iV,iT), figNum);

               zoot_scatter(xVals(iT,iV), squeeze(swap_Chance_scatterplot.(contrasts{iC})(iV,:,iT)),...
                    iC,iV,iT,0,0);
           
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