function predictedResults
% errVSswap plots predicted results for during, prior to, or mixed
% competition selection 
%% Settings 
user = 'jenny'; % 'jenny' 'karenlab' 'karen'

% Fig saving
savePlots = 0; 
figType = 'pdf';
figTitle = 'predictedResults';
figNum=7;

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
NTP_and_priorNTA = [79 72 67];
duringNTA = [79 79 79];
mixedNTA = [79 76 73];

contrasts = [{'NTP'}, {'NTA'}];

vals.NTP = [NTP_and_priorNTA; NTP_and_priorNTA; NTP_and_priorNTA];
vals.NTA = [duringNTA; NTP_and_priorNTA; mixedNTA];

%% fig 
clear panel 
figure
set(gcf,'Position',fp.rect)

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
                ylabel(sprintf('%% target \nperformance'));
                title(sprintf('Non-target present\n'),'FontWeight','normal','FontSize',14)
                % [ax1, h1] = suplabel('Non-target Present', 'y', [0.08 0.08 .84 1.025]);
                % [ax2, h2] = suplabel('Non-target Absent', 'y', [0.08 0.08 .84 0.325]);

            case {2}
                title(sprintf('Non-target absent\n'),'FontWeight','normal','FontSize',14)
            case{3}
                 ylabel(sprintf('%% target \nperformance'));
            case{5}
                ylabel(sprintf('%% target \nperformance'));
        end
            for iV = 1:3
                zoot_bar(xVals(1,iV), vals.(contrasts{iC})(iH, iV), iC, iV, 1, 0, 0, 8);
            end
        % % end
        % 
        % if plotStats
        %     zoot_plotStats
        % end

        count = count+1;
    end
end 

% %% fig
% clear panel 
% figure
% set(gcf,'Position',fp.rect)
% for iPlot = 1:6
%     subplot(3,2,iPlot)
%     hold on
%     if iPlot == 2
%         bar(duringNTA, 'FaceColor', [0 0.3 0])
%     elseif iPlot == 6
%         bar(mixedNTA, 'FaceColor', [0 0.3 0])
%     else
%         bar(NTP_and_priorNTA, 'FaceColor', [0 0.3 0])
%     end 
%     ylim([50 90])
% end



