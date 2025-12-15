function Fig3_TXNXAcc 
% Fig3_TXNXAcc plots accuracy by target and non-target presence vs. absence 
% for zoot

%% Settings 
user = 'karen'; % 'jenny' 'karenlab' 'karen'

% Fig saving
savePlots = 0; 
figType = 'pdf';
figTitle = 'Fig3_TXNXAcc';
figNum=3;

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

%% FIGURE 3A: Acc by target and non-target presence
clear panel 
figure
set(gcf,'Position',fp.rect)

count = 1;
tcl = tiledlayout(2,2,'TileSpacing','compact','OuterPosition',fp.OuterPosition); % adds y height
    for iC = 1:4 % 1 is TPNP; 2 is TANP; 3 is TPNA; 4 is TANA
        panel(count).info = nexttile;
        zoot_figureStyle
        xticklabels('')
        ylim([30 100]) % min changed to 30 there is an individual data point below 50 for TANP T1 V
        yticks(30:10:100)
        switch count
            case {3,4}
                xticklabels({'V','N','I','V','N','I'})
        end
        switch count
            case {1}
                ylabel('Accuracy (%)')
                title(sprintf('Target present\n'),'FontWeight','normal','FontSize',14)
                % [ax1, h1] = suplabel('Non-target Present', 'y', [0.08 0.08 .84 1.0]);
                % [ax2, h2] = suplabel('Non-target Absent', 'y', [0.08 0.08 .84 0.3]);
            case {2}
                title(sprintf('Target absent\n'),'FontWeight','normal','FontSize',14)
            case{3}
                ylabel('Accuracy (%)')
        end
        for iT = 1:2
            for iV = 1:3
                b = zoot_bar(xVals(iT,iV),squeeze(Acc_scatterplot.(contrasts{iC})(iV,:,iT)),...
                    iC,iV,iT,plotSubjects,Acc.err(iC,iV,iT), figNum);
            end
        end

        if plotStats
            zoot_plotStats
        end

        count = count+1;
    end

if savePlots
    export_fig(gcf,sprintf('%s/%s.%s', figDir, figTitle, figType), '-transparent','-p10')
end


%% FIGURE 3A: Acc by target and non-target presence add reaction time 
% Try a line plot version
clear panel 
figure
set(gcf,'Position',fp.rectLine)

plotOrder = [1 3 2 4];

% 1 is "With temporal competition"
% 2 is "Without competition"
% :4 % 1 is TPNP; 2 is TANP; 3 is TPNA; 4 is TANA

count = 1;
tcl = tiledlayout(2,2,'TileSpacing','compact','OuterPosition',fp.OuterPosition); % adds y height

% Plot shaded error bar and scatters next
for iPanel = 1:2
    panel(count).info = nexttile;
    zoot_figureStyle_line
    hold on
    xticklabels('')
    ylim([60 100]) % min changed to 30 there is an individual data point below 50 for TANP T1 V
    yticks(50:10:100)
    switch iPanel 
        case 1
        xticklabels({'V','N','I','V','N','I'})
        ylabel('Accuracy (%)')
        title(sprintf('Target present\n'),'FontWeight','normal','FontSize',14)

        case 2
        xticklabels({'V','N','I','V','N','I'})
        title(sprintf('Target absent\n'),'FontWeight','normal','FontSize',14)

        case 3
            ylabel('Reaction time (s)')
        case 4 
            ylabel('Reaction time (s)')
    end

    for iT=1:2
        TPNP = squeeze(Acc_scatterplot.(contrasts{1})(:,:,iT));
        TPNA = squeeze(Acc_scatterplot.(contrasts{3})(:,:,iT));

        TANP = squeeze(Acc_scatterplot.(contrasts{2})(:,:,iT));
        TANA = squeeze(Acc_scatterplot.(contrasts{4})(:,:,iT));

        switch iPanel
            case {1}
                yVals1 = TPNP;
                yVals2 = TPNA;

            case {2}
                yVals1 = TANP;
                yVals2 = TANA;
        end

        % With competition
        n = size(yVals1,2); 
        yValsMean1 = mean(yVals1,2);
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

        % Without competition
        yValsMean2 = mean(yVals2,2);
        ste = std(yVals2,[],2) / sqrt(n);
        pl(count) = plot(xVals(iT,:),yValsMean2,'LineWidth',0.5,'Color',fp.grey2);
        count = count+1; 
        seb = zoot_shadedErrorBar(xVals(iT,:),yValsMean2,ste);
        seb.patch.FaceColor = fp.grey2;
        for iV=1:3 % attention
            sc = scatter(xVals(iT,iV),yValsMean2(iV),fp.markerSize);
            sc.MarkerFaceColor = 'w';
            sc.MarkerEdgeColor = fp.colorsTargets(iT,iV,:);
            sc.LineWidth = 1.5;
        end

    end
end

% Send line plot back 
for iC = 1:4
    uistack(pl(iC), 'bottom')
end

if savePlots
    figTitle = 'Fig3_TXNXAcc_line'; 
    export_fig(gcf,sprintf('%s/%s.%s', figDir, figTitle, figType), '-transparent','-p10','-painters')
end


%% FIGURE 3A: Acc by target and non-target presence add reaction time 
% Try a line plot version
clear panel 
figure
set(gcf,'Position',fp.rectLine)

plotOrder = [1 3 2 4];

% 1 is "With temporal competition"
% 2 is "Without competition"
% :4 % 1 is TPNP; 2 is TANP; 3 is TPNA; 4 is TANA

count = 1;
tcl = tiledlayout(2,2,'TileSpacing','compact','OuterPosition',fp.OuterPosition); % adds y height

% Plot shaded error bar and scatters next
for iPanel = 1:2
    panel(count).info = nexttile;
    zoot_figureStyle_line
    hold on
    xticklabels('')
    ylim([0 0.7]) %
    yticks(0:0.2:0.7)
    switch iPanel 
        case 1
        xticklabels({'V','N','I','V','N','I'})
        ylabel('Reaction time (s)')
        title(sprintf('Target present\n'),'FontWeight','normal','FontSize',14)

        case 2
        xticklabels({'V','N','I','V','N','I'})
        title(sprintf('Target absent\n'),'FontWeight','normal','FontSize',14)

    end

    for iT=1:2
        var = TXNX_RT_scatterplot; 
        TPNP = squeeze(var.(contrasts{1})(:,:,iT));
        TPNA = squeeze(var.(contrasts{3})(:,:,iT));

        TANP = squeeze(var.(contrasts{2})(:,:,iT));
        TANA = squeeze(var.(contrasts{4})(:,:,iT));

        switch iPanel
            case {1}
                yVals1 = TPNP;
                yVals2 = TPNA;

            case {2}
                yVals1 = TANP;
                yVals2 = TANA;
        end

        % With competition
        n = size(yVals1,2); 
        yValsMean1 = mean(yVals1,2);
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

        % Without competition
        yValsMean2 = mean(yVals2,2);
        ste = std(yVals2,[],2) / sqrt(n);
        pl(count) = plot(xVals(iT,:),yValsMean2,'LineWidth',0.5,'Color',fp.grey2);
        count = count+1; 
        seb = zoot_shadedErrorBar(xVals(iT,:),yValsMean2,ste);
        seb.patch.FaceColor = fp.grey2;
        for iV=1:3 % attention
            sc = scatter(xVals(iT,iV),yValsMean2(iV),fp.markerSize);
            sc.MarkerFaceColor = 'w';
            sc.MarkerEdgeColor = fp.colorsTargets(iT,iV,:);
            sc.LineWidth = 1.5;
        end

    end
end

% Send line plot back 
for iC = 1:4
    uistack(pl(iC), 'bottom')
end

if savePlots
    figTitle = 'Fig3_TXNXRT_line'; 
    export_fig(gcf,sprintf('%s/%s.%s', figDir, figTitle, figType), '-transparent','-p10','-painters')
end







