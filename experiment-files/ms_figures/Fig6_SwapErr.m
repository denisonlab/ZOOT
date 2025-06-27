function Fig6_SwapErr 
% Fig6_SwapErr plots swap error over incorrect trials by target and non-target presence vs. absence 
% for zoot

%% Settings 
clear pathToZoot
user = 'jenny'; % 'jenny' 'karenlab' 'karen'

% Fig saving
savePlots = 1; 
figType = 'pdf';
figTitle = 'Fig6_SwapErr_twoIncorrect';
figNum=6;

% Fig plotting
plotStats = 0; 
plotSubjects = 0;

%% Setup
[zootDir,figDir] = pathToZoot(user); 

% Load the data
datafile = sprintf('%s/experiment-files/zoot_dataAll.mat',zootDir); 
load(datafile)

% Figure styling
fp = zoot_figureparams;
xVals = fp.xVals; 

[zootDir,figDir] = pathToZoot(user); % run again bc dataall overwrites fig dir 

%% point 93.75
% % plots only data points under 93.75% target accuracy 
% figure
% set(gcf,'Position',fp.rect)
% 
% colors = fp.coolColors; % fp.bry; 
% variable = atLeastTwoIncorrect_swap_scatterplot; 
% 
% count = 1;
% tcl = tiledlayout(1,2,'TileSpacing','compact','OuterPosition',fp.OuterPosition); % adds y height
% % sgtitle(' data with <93.75% accuracy')
% for iT = 1:2 % 1 is TPNP; 2 is TANP; 3 is TPNA
%     panel(count).info = nexttile;
%     zoot_figureStyle
%     xticklabels({'V', 'N','I'})
%     ylim([0 100])
%     yticks(0:50:100)
%     xlim([fp.xVals(1,1)-0.1 fp.xVals(1,3)+0.1])
%     xticks(fp.xVals(1,:))
%     yline(50)
%     switch count
%         case {1}
%             ylabel(sprintf('%% error due to reporting\nnon-target feature'));
%             title(sprintf('T1\n'),'FontWeight','normal','FontSize',14)
%         case {2}
%             title(sprintf('T2\n'),'FontWeight','normal','FontSize',14)
%     end
% 
%     for iC = 1:3 % TPNP, TANP, TPNA
%         pl(iC) = plot([xVals(1,1) xVals(1,2) xVals(1,3)], [pointsUnder95_swapMeans(iC,1,iT) pointsUnder95_swapMeans(iC,2,iT) pointsUnder95_swapMeans(iC,3,iT)],...
%             'Color',colors(iC,:),'LineWidth',1);
%         for iV = 1:3
%             y = squeeze(pointsUnder95_swap_scatterplot.(contrasts{iC})(iV,:,iT));
%             n = sum(~isnan(y)); 
%             err = std(y,'omitnan')/sqrt(n);
%             errorbar(xVals(1,iV),mean(y,'omitnan'),err,'k','CapSize',fp.CapSize,'LineWidth',fp.ErrorBarLineWidth)
%         end
%     end
% 
%     if plotStats
%         zoot_plotStats
%     end
% 
%     count = count+1;
% end
% legend(pl(1:3),{'Target present, non-target present','Target absent, non-target present', 'Target present, non-target absent'}, 'Location', 'southoutside')
% 
% if savePlots
%     export_fig(gcf,sprintf('%s/%s.%s', figDir, figTitle, figType), '-transparent','-p10')
%     % print(gcf, '-dpdf', '/Users/jennymotzer/Documents/GitHub/ZOOT/experiment-files/groupFigs/TX_Acc.pdf') % needed or else background turns black, do not erase
% end

%% Swap rate conditioned on having at least two incorrect per condition
figTitle = 'Fig6_SwapErr_twoIncorrect';
xJitter = 0.02; 
pOrder = [2 1 3];

figure
set(gcf,'Position',[100 100 400 400])

colors = fp.coolColors; % fp.bry; 

count = 1;
tcl = tiledlayout(1,2,'TileSpacing','compact','OuterPosition',fp.OuterPosition); % adds y height
for iT = 1:2 % 1 is TPNP; 2 is TANP; 3 is TPNA
    panel(count).info = nexttile;
    zoot_figureStyle
    xticklabels({'V', 'N','I'})
    ylim([0 100])
    yticks(0:50:100)
    xlim([fp.xVals(1,1)-0.1+xJitter fp.xVals(1,3)+0.1+2*xJitter])
    xticks(fp.xVals(1,:)+xJitter)
    yline(50)
    switch count
        case {1}
            ylabel(sprintf('%% error due to reporting\nnon-target feature'));
            title(sprintf('T1\n'),'FontWeight','normal','FontSize',14)
        case {2}
            title(sprintf('T2\n'),'FontWeight','normal','FontSize',14)
    end

    for iC = 1:3 % TPNP, TANP, TPNA
        pl(iC) = plot([xVals(1,1)+xJitter*iC xVals(1,2)+xJitter*iC xVals(1,3)+xJitter*iC], [atLeastTwoIncorrect_swapMeans(pOrder(iC),1,iT) atLeastTwoIncorrect_swapMeans(pOrder(iC),2,iT) atLeastTwoIncorrect_swapMeans(pOrder(iC),3,iT)],...
            'Color',colors(iC,:),'LineWidth',1.5);

        for iV = 1:3
            y = squeeze(atLeastTwoIncorrect_swap_scatterplot.(contrasts{pOrder(iC)})(iV,:,iT));
            n = sum(~isnan(y)); 
            err = std(y,'omitnan')/sqrt(n);
            errorbar(xVals(1,iV)+xJitter*iC,mean(y,'omitnan'),err,'color','k','CapSize',fp.CapSize,'LineWidth',fp.ErrorBarLineWidth)
        end
    end

    if plotStats
        zoot_plotStats
    end

    count = count+1;
end
legend(pl(1:3),{'Target present, non-target present','Target absent, non-target present', 'Target present, non-target absent'}, 'Location', 'southoutside')

if savePlots
    export_fig(gcf,sprintf('%s/%s.%s', figDir, figTitle, figType), '-transparent','-p10')
    % print(gcf, '-dpdf', '/Users/jennymotzer/Documents/GitHub/ZOOT/experiment-files/groupFigs/TX_Acc.pdf') % needed or else background turns black, do not erase
end
