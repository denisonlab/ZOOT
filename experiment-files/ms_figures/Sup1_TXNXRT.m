function Sup1_TXNXRT 
% Sup1_TXNXRT plots RT by target and non-target presence vs. absence 
% for zoot

%% Settings 
user = 'jenny'; % 'jenny' 'karenlab' 'karen'

% Fig saving
savePlots = 1; 
figType = 'pdf';
figTitle = 'Sup1_TXNXRT';
figNum=2;

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

%% FIGURE 2A: Acc by target and non-target presence
clear panel 
figure
set(gcf,'Position',fp.rect)

count = 1;
tcl = tiledlayout(2,2,'TileSpacing','compact','OuterPosition',fp.OuterPosition); % adds y height
    for iC = 1:4 % 1 is TPNP; 2 is TANP; 3 is TPNA; 4 is TANA
        panel(count).info = nexttile;
        zoot_figureStyle(fp)
        xticklabels('')
        ylim([0 1.2])
        yticks(0:0.2:1.2)
        switch count
            case {1}
                ylabel('RT (s)')
                title(sprintf('Target present\n'),'FontWeight','normal','FontSize',14)
                [ax1, h1] = suplabel('Non-target Present', 'y', [0.08 0.08 .84 1.025]);
                [ax2, h2] = suplabel('Non-target Absent', 'y', [0.08 0.08 .84 0.325]);

            case {2}
                title(sprintf('Target absent\n'),'FontWeight','normal','FontSize',14)
            case{3}
                 ylabel('RT (s)')
        end
        for iT = 1:2
            for iV = 1:3
          zoot_scatter(xVals(iT,iV),squeeze(TXNX_RT_scatterplot.(contrasts{iC})(iV,:,iT)),...
                            iC,iV,iT,plotSubjects,TXNX_RT.err(iC,iV,iT),figNum);
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