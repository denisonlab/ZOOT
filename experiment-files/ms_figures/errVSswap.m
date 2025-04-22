efunction errVSswap
% errVSswap plots swap rate vs # incorrect trials for instances of 100%
% or 0% swap rate with target accuracy less than or equal to 93.75% (need
% to have more than 2 incorrect trials per condition)
% for zoot

%% Settings 
user = 'jenny'; % 'jenny' 'karenlab' 'karen'

% Fig saving
savePlots = 0; 
figType = 'pdf';
figTitle = 'errVSswap';
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

%% fig
target = [{'T1'}, {'T2'}];
sgtitle('all data points <93.75%')
for iT=1:2
    figure;
    set(gcf,'Position',fp.rect)
    sgtitle(target(iT))
    for iC=1:3
        subplot(2,2,iC)
        for iV = 1:3
            swarmchart(swap_Err_Acc_scatterplot.(contrasts{iC})(iV,:,iT), numIncorrect_pointsUnder95_swap.(contrasts{iC})(iV,:,iT), 100)
            ylabel('# incorrect trials')
            xlabel('% error due to swaps')
            xlim([-10 110])
            ylim([0 20])
            hold on
        end
    end

end

[ax1, h1] = suplabel('Non-target Present', 'y', [0.08 0.08 .5 1.325]);
[ax2, h2] = suplabel('Non-target Absent', 'y', [0.08 0.08 .5 0.375]);
[ax3, h3] = suplabel('Target Absent', 't', [0.08 0.08 1.3 .90]);
[ax4, h4] = suplabel('Target Present', 't', [0.08 0.08 .45 .90]);