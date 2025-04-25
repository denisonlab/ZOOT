function Fig5_det 
% Fig5_det plots det d' and c by non-target presence vs. absence 
% for zoot

%% Settings 
user = 'jenny'; % 'jenny' 'karenlab' 'karen'

% Fig saving
savePlots = 0; 
figType = 'pdf';
figTitle = 'Fig5_det';
figNum=5;

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
        zoot_figureStyle(fp)
        switch count
            case {1,2} % d'
                xticklabels('')
                ylim([0 5])
                yticks(0:1:5)
            case {3,4} % RT
                xticklabels({'V','N','I','V','N','I'})
                ylim([-1.5 1.5])
                yticks(-1.5:0.5:1.5)
        end
        switch count
            case {1}
                ylabel('Detection {\itd''}')
                title(sprintf('Non-target present\n'),'FontWeight','normal','FontSize',14)
            case {2}
                title(sprintf('Non-target absent\n'),'FontWeight','normal','FontSize',14)
            case {3}
                ylabel('Detection c')        
        end
        for iT = 1:2
            for iV = 1:3
                switch count
                    case {1,2} %  d'      
                        b = zoot_bar(xVals(iT,iV),squeeze(detd_sub_scatterplot.(Detfieldnames{iC})(iV,:,iT)),...
                            iC,iV,iT,plotSubjects,detdErr_sub.(Detfieldnames{iC})(iT, iV), figNum);
                    case {3,4}  % c
                        zoot_bar(xVals(iT,iV),squeeze(detc_sub_scatterplot.(Detfieldnames{iC})(iV,:,iT)),...
                            iC,iV,iT,plotSubjects,detcErr_sub.(Detfieldnames{iC})(iT, iV), figNum);
                end
            end
        end

        if plotStats
            zoot_plotStats
        end

        count = count+1;
    end
end

if savePlots
    export_fig(gcf,sprintf('%s/%s.%s', figDir, figTitle, figType), '-transparent','-p10')
    % print(gcf, '-dpdf', '/Users/jennymotzer/Documents/GitHub/ZOOT/experiment-files/groupFigs/TX_Acc.pdf') % needed or else background turns black, do not erase
end