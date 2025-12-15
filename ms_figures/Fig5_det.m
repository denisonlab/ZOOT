function Fig5_det 
% Fig5_det plots det d' and c by non-target presence vs. absence 
% for zoot

%% Settings 
user = 'karen'; % 'jenny' 'karenlab' 'karen'

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
datafile = sprintf('%s/analyses/zoot_dataAll.mat',zootDir); 
load(datafile)

% Figure styling
fp = zoot_figureparams;
xVals = fp.xVals; 

[zootDir,figDir] = pathToZoot(user); % run again bc dataall overwrites fig dir 

%% FIGURE 5: Detection d' and c by non-target presence (bar graph)
clear panel 
figure
set(gcf,'Position',fp.rect)
count = 1;
tcl = tiledlayout(2,2,'TileSpacing','compact','OuterPosition',fp.OuterPosition); % adds y height
for iRep = 1:2 % 1 is d'; 2 is c
    for iC = 2:3 % 2 is non-target present; 3 is non-target absent
        panel(count).info = nexttile;
        zoot_figureStyle()
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
                        b = zoot_bar(xVals(iT,iV),squeeze(detd_sub_over2N_scatterplot.(Detfieldnames{iC})(iV,:,iT)),...
                            iC,iV,iT,plotSubjects,detdErr_sub_over2N.(Detfieldnames{iC})(iT, iV), figNum);
                    case {3,4}  % c
                        zoot_bar(xVals(iT,iV),squeeze(detc_sub_over2N_scatterplot.(Detfieldnames{iC})(iV,:,iT)),...
                            iC,iV,iT,plotSubjects,detcErr_sub_over2N.(Detfieldnames{iC})(iT, iV), figNum);
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

%% Figure 5: Detection sensitivity: Line graph 
clear panel 
figure
set(gcf,'Position',fp.rectLine)

count = 1;
tcl = tiledlayout(2,2,'TileSpacing','compact','OuterPosition',fp.OuterPosition); % adds y height
for iPanel = 1:2
    panel(count).info = nexttile;
    zoot_figureStyle_line
    xticklabels('')
    xticklabels({'V','N','I','V','N','I'})
    switch iPanel
        case 1 % Sensitivity
            var = detd_sub_over2N_scatterplot;
            ylabel('Detection d''')
            ylim([1 4.5])
            yticks([0:5])
            title(sprintf('Target present and target absent\n'),'FontWeight','normal','FontSize',14)
        case 2 % Criterion
            var = detc_sub_over2N_scatterplot;
            yline(0)
            yticks([-0.6:0.3:0.6])
    end
    
    for iT=1:2 % Targets
        
        % With competition
        iC = 2;
        yVals1 = var.(Detfieldnames{iC})(:,:,iT); % iV,C,iT
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
        yVals2 = var.(Detfieldnames{iC})(:,:,iT); 
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
    figTitle = 'Fig5_det_line'; 
    export_fig(gcf,sprintf('%s/%s.%s', figDir, figTitle, figType), '-transparent','-p10','-painters')
end






