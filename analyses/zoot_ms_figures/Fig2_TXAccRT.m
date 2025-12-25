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
datafile = sprintf('%s/data/zoot_dataAll.mat',zootDir); 
load(datafile)

% Figure styling
fp = zoot_figureparams;
xVals = fp.xVals; 

[zootDir,figDir] = pathToZoot(user); % run again bc dataall overwrites fig dir 

%% Line plot version 
clear panel 
figure
set(gcf,'Position',fp.rectLine)

count = 1;
tcl = tiledlayout(2,2,'TileSpacing','compact','OuterPosition',fp.OuterPosition); % adds y height

for iPanel = 1:4 % Target present, target absent
    panel(count).info = nexttile;
    zoot_figureStyle_line
    hold on
    xticklabels('')
    xticklabels({'V','N','I','V','N','I'})
    title(sprintf('Target present\n'),'FontWeight','normal','FontSize',14)

    switch iPanel
        case 1
            title('Target present')
            val = tcAcc_scatterplot.TP; % att (3) x n (18) x target (2)
            ylabel('Accuracy (%)')
            ylim([60 100])
            yticks(60:10:100)
        case 2
            title('Target absent')
            val = tcAcc_scatterplot.TA;
            ylabel('Accuracy (%)')
            ylim([60 100])
            yticks(60:10:100)
        case 3
            val = TPTA_RT_scatterplot.TP;
            ylabel('Reaction time (s)')
            ylim([0 0.7])
            yticks([0:0.2:0.8])
        case 4
            val = TPTA_RT_scatterplot.TA;
            ylabel('Reaction time (s)')
            ylim([0 0.7])
            yticks([0:0.2:0.8])
    end
    
    for iT=1:2 % Targets
        yVals1 = squeeze(val(:,:,iT));
        n = size(val,2); 
        yValsMean1 = squeeze(mean(yVals1,2));
        ste = std(yVals1,[],2) / sqrt(n);
        xValsC = xVals+0.06;
        pl(count) = plot(xValsC(iT,:),yValsMean1,'LineWidth',0.5,'Color','k');
        count = count+1; 
        seb = zoot_shadedErrorBar(xValsC(iT,:),yValsMean1,ste);
        seb.patch.FaceColor = fp.grey;
        for iV=1:3 % attention
            sc = scatter(xValsC(iT,iV),yValsMean1(iV),fp.markerSize+3,'filled');
            sc.MarkerFaceColor = fp.colorsTargets(iT,iV,:);
        end 
    end
end

% Send line plot back 
for iC = 1:2
    uistack(pl(iC), 'bottom')
end

if savePlots
    figTitle = 'Fig2_TXAccRT_line'; 
    export_fig(gcf,sprintf('%s/%s.%s', figDir, figTitle, figType), '-transparent','-p10','-painters')
end


