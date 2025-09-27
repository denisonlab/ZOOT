function Fig4_dis 
% Fig4_dis plots dis d' and c by non-target presence vs. absence 
% for zoot

%% Settings 
user = 'karen'; % 'jenny' 'karenlab' 'karen'

% Fig saving
savePlots = 1; 
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

%% FIGURE 2A: Dis d' and c by non-target presence subsampled with over2N corrections
clear panel 
figure
set(gcf,'Position',fp.rect)

count = 1;
tcl = tiledlayout(2,2,'TileSpacing','compact','OuterPosition',fp.OuterPosition); % adds y height
for iRep = 1:2 % 1 is d'; 2 is c
    for iC = 2:3 % 2 is non-target present; 3 is non-target absent
        panel(count).info = nexttile;
        zoot_figureStyle
        switch count
            case {1,2} % d'
                xticklabels('')
                ylim([0 4])
                yticks(0:1:4.5)
            case {3,4} % c
                xticklabels({'V','N','I','V','N','I'})
                ylim([-1.2 1.2])
                yticks(-2:1:2)
        end
        switch count
            case {1}
                ylabel('Discrimination {\itd''}')
                title(sprintf('With temporal competition\n'),'FontWeight','normal','FontSize',14)
            case {2}
                title(sprintf('Without competition\n'),'FontWeight','normal','FontSize',14)
            case {3}
                ylabel('Discrimination c')        
        end
        for iT = 1:2
            for iV = 1:3
                switch count
                    case {1,2} % Dis d'      
                        b = zoot_bar(xVals(iT,iV),squeeze(disd_sub_over2N_scatterplot.(Detfieldnames{iC})(iV,:,iT)),...
                            iC,iV,iT,plotSubjects,disdErr_sub_over2N.(Detfieldnames{iC})(iT, iV), figNum);
                        b.BaseLine.LineWidth = fp.ax.LineWidth;
                    case {3,4}  % Dis c
                        zoot_bar(xVals(iT,iV),squeeze(disc_sub_over2N_scatterplot.(Detfieldnames{iC})(iV,:,iT)),...
                            iC,iV,iT,plotSubjects,discErr_sub_over2N.(Detfieldnames{iC})(iT, iV), figNum);
                end
            end
        end

        count = count+1;
    end
end

if savePlots
    export_fig(gcf,sprintf('%s/%s.%s', figDir, figTitle, figType), '-transparent','-p10','-painters')
    % print(gcf, '-dpdf', '/Users/jennymotzer/Documents/GitHub/ZOOT/experiment-files/groupFigs/TX_Acc.pdf') % needed or else background turns black, do not erase
end

