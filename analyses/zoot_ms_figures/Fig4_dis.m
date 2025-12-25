function Fig4_dis 
% Fig4_dis plots dis d' and c by non-target presence vs. absence 
% for zoot

%% Settings 
user = 'karen'; % 'jenny' 'karenlab' 'karen'

% Fig saving
savePlots = 0; 
figType = 'pdf';
figTitle = 'Fig4_dis';
figNum = 4; 

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

%% FIGURE 2A: Discrimination d' and c by non-target presence subsampled with 1/2N correction
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
                title(sprintf('Non-target present\n'),'FontWeight','normal','FontSize',14)
            case {2}
                title(sprintf('Non-target absent\n'),'FontWeight','normal','FontSize',14)
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

%% Line plot version 
clear panel 
figure
set(gcf,'Position',fp.rectLine)

plotOrder = [1 3]; % Target present only 

% 1 is "With temporal competition"
% 2 is "Without competition"
% 1 is TPNP; 2 is TANP; 3 is TPNA; 4 is TANA

count = 1;
tcl = tiledlayout(2,2,'TileSpacing','compact','OuterPosition',fp.OuterPosition); % adds y height

for iPanel = 1 % :2
    panel(count).info = nexttile;
    zoot_figureStyle_line
    hold on
    xticklabels('')
    xticklabels({'V','N','I','V','N','I'})
    ylabel('Discrimination d''')
    title(sprintf('Target present\n'),'FontWeight','normal','FontSize',14)

    for iT=1:2 % Targets
        
        % With competition
        iC = 2;
        yVals1 = disd_sub_over2N_scatterplot.(Detfieldnames{iC})(:,:,iT); % iV,C,iT
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
        iC = 3; 
        yVals2 = disd_sub_over2N_scatterplot.(Detfieldnames{iC})(:,:,iT); 
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
for iC = 1:2
    uistack(pl(iC), 'bottom')
end

if savePlots
    figTitle = 'Fig4_dis_line'; 
    export_fig(gcf,sprintf('%s/%s.%s', figDir, figTitle, figType), '-transparent','-p10','-painters')
end


%% Correlation plot
% Magnitude of attentional benefit (V-I) by neutral performance 
figure
set(gcf,'Position',fp.rectLine)

count = 1;
tcl = tiledlayout(2,2,'TileSpacing','compact','OuterPosition',fp.OuterPosition); % adds y height

% Plot shaded error bar and scatters next
for iPanel = 1
    panel(count).info = nexttile; 
    % zoot_figureStyle_line
    % General styling
    hold on
    box off
    set(gca,'TickDir','in');
    ax = gca;
    ax.LineWidth = 0.5; % fp.ax.LineWidth;
    ax.XColor = 'black';
    ax.YColor = 'black';
    % xlim([fp.xVals(1,1)-0.18 fp.xVals(2,3)+0.12])
    % xticks([fp.xVals(1,:) fp.xVals(2,:)])

    % Text size
    smlFont = 8;
    bigFont = 12; % 24 jumbo

    ax.FontSize = bigFont;
    ax.FontName = 'Helvetica'; % 'Helvetica-Light';

    ax.XAxis.FontSize = smlFont;
    ax.YAxis.FontSize = smlFont;

    ax.LabelFontSizeMultiplier = bigFont/smlFont;

    set(0, 'DefaultFigureRenderer', 'painters')

    %%%
    xlim([1 4])
    yline(0)

    % T1
    for iT=1:2
    yVals_wC = disd_sub_over2N_scatterplot.(Detfieldnames{2})(:,:,iT); 
    yVals_woC = disd_sub_over2N_scatterplot.(Detfieldnames{3})(:,:,iT); 
    nC = [yVals_wC(2,:)]; %  yVals_woC(2,:)];
    attM = [yVals_wC(1,:)-yVals_wC(3,:)]; %   yVals_woC(1,:)-yVals_woC(3,:)];

    % Fit linear model
    a(iT).mdl = fitlm(nC,attM);
    % % Generate points for the x-axis for plotting
    x_new = (-1:0.1:5)';

    % Get the fitted y values and the confidence bounds
    [y_predicted, y_ci_curve] = predict(a(iT).mdl, x_new, 'Prediction', 'curve');

    pl = plot(x_new, y_predicted, 'r-', 'LineWidth', 2);
    pl.Color = fp.colorsTargets(iT,1,:);
    % plot(x_new, y_ci_curve, 'r--', 'LineWidth', 1);
    
    x_new = (-1:0.1:5); 
    x2 = [x_new, fliplr(x_new)];
    inBetween = [y_ci_curve(:,1)', fliplr(y_ci_curve(:,2)')];
    fl = fill(x2, inBetween, 'g', EdgeColor='none');
    fl.FaceAlpha = 0.5; 
    fl.FaceColor = fp.colorsTargets(iT,2,:);
    end
end
%% 

    % pf = polyfit(nC,attM,1);
    % [yfit, delta] = polyconf(pf, xfit, x, y, 'alpha',0.05);

        for iT=1:2 % 1:2 % Targets
        
        % With competition
        iC = 2;
        yVals1 = disd_sub_over2N_scatterplot.(Detfieldnames{iC})(:,:,iT); % iV,:,iT (3 x 18)
        n = size(yVals1,2); 
        yValsMean1 = mean(yVals1,2);
        ste = std(yVals1,[],2) / sqrt(n);
        xValsC = xVals+0.06;
        % pl(count) = plot(xValsC(iT,:),yValsMean1,'LineWidth',0.5,'Color','k');
        % count = count+1; 
        % seb = zoot_shadedErrorBar(xValsC(iT,:),yValsMean1,ste);
        % seb.patch.FaceColor = fp.grey;
        nC = yVals1(2,:); 
        attM = yVals1(1,:)-yVals1(3,:); 
        sc = scatter(nC,attM,fp.markerSize+3,'filled');
        sc.MarkerFaceColor = fp.colorsTargets(iT,2,:);

        % Without competition
        iC = 3; 
        yVals2 = disd_sub_over2N_scatterplot.(Detfieldnames{iC})(:,:,iT); 
        yValsMean2 = mean(yVals2,2);
        ste = std(yVals2,[],2) / sqrt(n);
        % pl(count) = plot(xVals(iT,:),yValsMean2,'LineWidth',0.5,'Color',fp.grey2);
        % count = count+1; 
        % seb = zoot_shadedErrorBar(xVals(iT,:),yValsMean2,ste);
        % seb.patch.FaceColor = fp.grey2;
        nC = yVals2(2,:); 
        attM = yVals2(1,:)-yVals2(3,:); 
        sc = scatter(nC,attM,fp.markerSize);
        sc.MarkerFaceColor = 'w'; 
        sc.MarkerEdgeColor = fp.colorsTargets(iT,2,:);
        sc.LineWidth = 1.5;

        end

end






