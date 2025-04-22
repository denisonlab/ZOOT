function predictedResults
% errVSswap plots predicted results for during, prior to, or mixed
% competition selection 
%% Settings 
user = 'jenny'; % 'jenny' 'karenlab' 'karen'

% Fig saving
savePlots = 0; 
figType = 'pdf';
figTitle = 'predictedResults';
figNum=8;

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

%% values
NTP_and_priorNTA = [79 70 61];
duringNTA = [79 79 79];
mixedNTA = [79 75 72];

contrasts = [{'NTP'}, {'NTA'}];

vals.NTP = [NTP_and_priorNTA; NTP_and_priorNTA; NTP_and_priorNTA];
vals.NTA = [duringNTA; NTP_and_priorNTA; mixedNTA];

%% fig 
clear panel 
figure
% set(gcf,'Position',fp.rect)

count = 1;
tcl = tiledlayout(3,2,'TileSpacing','compact','OuterPosition',fp.OuterPosition); % adds y height
for iH = 1:3 % hypotheses: 1 = during comp, 2 = prior to comp, 3 = mixed
    for iC = 1:2% 1 is NTP; 2 is NTA
        panel(count).info = nexttile;
        zoot_figureStyle(fp, 8)
        xticklabels('')
        xlim([0.5 1.5])
        ylim([50 90])
        yticks(50:10:90)
        switch count
            case {1}
                ylabel(sprintf('Accuracy (%%)'));
                title(sprintf('Non-target present\n'),'FontWeight','normal','FontSize',14)
            case {2}
                title(sprintf('Non-target absent\n'),'FontWeight','normal','FontSize',14)
            case{3}
                 ylabel(sprintf('Accuracy (%%)'));
            case{5}
                ylabel(sprintf('Accuracy (%%)'));
        end
            for iV = 1:3
                zoot_bar(xVals(1,iV), vals.(contrasts{iC})(iH, iV), iC, iV, 1, 0, 0, figNum);
            end
     

        count = count+1;
    end
end 

