function Fig2_TXAccRT 
% Fig2_TXAccRT plots accuracy and RT by target presence vs. absence 
% for zoot

%% Settings 
user = 'karen'; % 'jenny' 'karenlab' 'karen'

% Fig saving
savePlots = 1; 
figType = 'pdf';
figTitle = 'Fig2_TXAccRT';
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

%% FIGURE 2A: Acc and RT by target presence
clear panel 
figure
set(gcf,'Position',fp.rect)

count = 1;
tcl = tiledlayout(8,2,'TileSpacing','compact','OuterPosition',fp.OuterPosition); % adds y height
for iRep = 1:2 % 1 is accuracy; 2 is RT
    for iC = 1:2 % 1 is target present; 2 target absent
        switch count
            case {1,2} % Accuracy
                counts = [1 2];
                panel(count).info = nexttile(counts(iC),[4 1]);
                zoot_figureStyle
                xticklabels('')
                ylim([30 100]) % y min be 30 to match TXNX acc plot or 50 to better show effect
                yticks(30:10:100)
            case {3,4} % RT
                counts = [11 12];
                panel(count).info = nexttile(counts(iC),[3 1]);
                zoot_figureStyle
                xticklabels({'V','N','I','V','N','I'});
                ylim([0 .85])
                yticks(0:0.2:0.8)
        end
        switch count
            case {1}
                ylabel('Accuracy (%)')
                title(sprintf('Target present\n'),'FontWeight','normal','FontSize',14)
            case {2}
                ylabel('Accuracy (%)')
                title(sprintf('Target absent\n'),'FontWeight','normal','FontSize',14)
            case {3,4}
                ylabel('Reaction time (s)')        
        end
        for iT = 1:2
            for iV = 1:3
                switch count
                    case {1,2} % Accuracy      
                        b = zoot_bar(xVals(iT,iV),squeeze(tcAcc_scatterplot.(targ_contrasts{iC})(iV,:,iT)),...
                            iC,iV,iT,plotSubjects,tcAcc.err(iC,iV,iT), figNum);
                    case {3,4}  % Reaction time
                        zoot_scatter(xVals(iT,iV),squeeze(TPTA_RT_scatterplot.(targ_contrasts{iC})(iV,:,iT)),...
                            iC,iV,iT,plotSubjects,TPTA_RT.err(iC,iV,iT), figNum);
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


