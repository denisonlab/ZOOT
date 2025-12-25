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
datafile = sprintf('%s/analyses/zoot_dataAll.mat',zootDir); 
load(datafile)

% Figure styling
fp = zoot_figureparams;
xVals = fp.xVals; 

[zootDir,figDir] = pathToZoot(user); % run again bc dataall overwrites fig dir 

%% FIGURE 2A: Acc and RT by target presence (bar)
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


