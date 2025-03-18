function Fig5_det % please name the function 
% Fig2a_TXAcc plots accuracy by target presence/absence 

%% Settings (things that can be changed) 
user = 'jenny'; % 'jenny'
saveplots = 0; 
plotStats = 1; 
figType = 'pdf';

%% Setup
% Directories
switch user
    case {'karen'}
        pathToZoot = '/Users/kantian/Dropbox/github/ZOOT';
    case {'jenny'}
        pathToZoot = '/Users/jennymotzer/Documents/GitHub/ZOOT';
end
addpath(genpath(pathToZoot))
figDir = sprintf('%s/groupFigs',pathToZoot); 

% Load the data
datafile = sprintf('%s/experiment-files/zoot_dataAll.mat',pathToZoot); 
load(datafile)

% Figure styling
fp = zoot_figureparams;

% /// Define your xVals once. Then, they can be used throughout.
% /// Would be even better to define in figureparams once to be used across all figures. 
% xVals = [0.7778 1 1.222;... % T1 (
%     1.7778 2 2.2222]; % T2
xVals = fp.xVals; 

% /// Also define colors just once (see changes to figure params). Make use of logical indexing rather
% than if loops.
% /// Same comment for bar widths (see changes to figure params). 
% /// size of figure should also be just defined once in figureparams. 

%% FIGURE 5: plot detection - SUBSAMPLED valid cond
%dprime
dprimefieldnames = fieldnames(dataAll(iSub).detd);
figure();
set(gcf, 'Renderer', 'painters')
for iContrast = 2:numel(dprimefieldnames) % for each condition (nontarget present, nontarget absent) while skipping the "all" condition in the first position
    subplot(2,2,iContrast-1) % iContrast-1 to skip the all condition
    zoot_figureStyle; hold on
    for iTarget = 1:2
        for iValid = 1:3
            b = bar(xVals(iTarget,iValid), detd.(dprimefieldnames{iContrast})(iTarget, iValid),...
                'LineWidth',fp.bar.lineWidth(iContrast),'BarWidth',fp.bar.barWidth(iContrast),...
                'EdgeColor',fp.colorsTargets(iTarget,iValid,:),'FaceColor',fp.bar.FaceColor(1,iTarget,iValid,:)); 
            
            % scatter 
            swarmchart( xVals(iTarget,iValid), squeeze(detd_scatterplot.(Detfieldnames{iContrast})(iValid,:,iTarget)),'filled',...
                'SizeData',fp.scatter.size,'XJitterWidth',100,'MarkerFaceColor',fp.colorsTargets(iTarget,iValid,:),'MarkerEdgeColor',fp.scatter.edgeColor,'MarkerFaceAlpha',fp.scatter.alpha(iValid) );

            errorbar(xcoords(iContrast, iValid, iTarget),detd.(dprimefieldnames{iContrast})(iTarget, iValid),detdErr.(dprimefieldnames{iContrast})(iTarget, iValid), '.k', 'CapSize', fp.CapSize, 'LineWidth', fp.ErrorBarLineWidth)
        end
    end
    ylabel('Detection {\itd''}')
    ylim([0 5])
    set(gca, 'ytick', 0:1:5)
    xlim([0.5 2.5])
    xticks([xVals(1,:) xVals(2,:)])
    set(gca, 'xticklabel', {'V', 'N','I','V','N','I'})
    if plotStats
        if iContrast == 2 % NTP
            %T1 v-I
            zoot_annotateStats(1,4.2,'*');
            zoot_drawBracket(fp.xVals(1,1), fp.xVals(1,3), .82)
        
        elseif iContrast == 3 % NTA
            %T1 V-I
            zoot_annotateStats(1,4.5,'***');
            zoot_drawBracket(fp.xVals(1,1), fp.xVals(1,3), .86)
            %T2 N-I
            zoot_annotateStats(2.1111,4.35,'*');
            zoot_drawBracket(fp.xVals(2,2), fp.xVals(2,3), .84)

            % zoot_annotateStats(1,5.45,'_______');
            % zoot_annotateStats(1,5.5,'* Validity');


            % kt_annotateStats(1.5, 6.1,'___________________'); %adobe
            % kt_annotateStats(1.5, 6.6,'** Target');
            % kt_annotateStats(1.5,7,'* Validity');
            % kt_annotateStats(1.5,6.2,'* Target:Validity');

        end
    end

end

% criterion
for iContrast = 2:numel(dprimefieldnames) % for each condition (nontarget present, nontarget absent) while skipping the "all" condition in the first position
    subplot(2,2,iContrast+1) % iContrast+1 to put in 3rd and 4th subplots
    zoot_figureStyle; hold on
    for iTarget = 1:2
        for iValid = 1:3
            b = bar(xVals(iTarget,iValid), detc.(dprimefieldnames{iContrast})(iTarget, iValid),...
                'LineWidth',fp.bar.lineWidth(iContrast),'BarWidth',fp.bar.barWidth(iContrast),...
                'EdgeColor',fp.colorsTargets(iTarget,iValid,:),'FaceColor',fp.bar.FaceColor(1,iTarget,iValid,:)); 

            % scatter 
            swarmchart( xVals(iTarget,iValid), squeeze(detc_scatterplot.(Detfieldnames{iContrast})(iValid,:,iTarget)),'filled',...
                'SizeData',fp.scatter.size,'XJitterWidth',100,'MarkerFaceColor',fp.colorsTargets(iTarget,iValid,:),'MarkerEdgeColor',fp.scatter.edgeColor,'MarkerFaceAlpha',fp.scatter.alpha(iValid) ); 
            
            errorbar(xcoords(iContrast, iValid, iTarget),detc.(dprimefieldnames{iContrast})(iTarget, iValid),detcErr.(dprimefieldnames{iContrast})(iTarget, iValid), '.k', 'CapSize', fp.CapSize, 'LineWidth', fp.ErrorBarLineWidth)
        end
    end

    ylabel('Detection c')
    ylim([-2 2])
    set(gca, 'ytick', -2:1:2)
    xlim([0.5 2.5])
    xticks([xVals(1,:) xVals(2,:)])
    set(gca, 'xticklabel', {'V', 'N','I','V','N','I'})
   
    if plotStats
        if iContrast == 2 %NTP
            %T2 V-I
            zoot_annotateStats(1,0.4,'*');
            zoot_drawBracket(fp.xVals(1,1), fp.xVals(1,3), .17)
        elseif iContrast == 3 %NTA
            %T1 V-I
            zoot_annotateStats(1,0.8,'**');
            zoot_drawBracket(fp.xVals(1,1), fp.xVals(1,3), .37)
            %T1 N-I
            zoot_annotateStats(1.111,0.55,'*');
            zoot_drawBracket(fp.xVals(1,2), fp.xVals(1,3), .28)

            % zoot_annotateStats(1,1.15,'_______');
            % zoot_annotateStats(1,1.17,'* Validity');
            % %
            % zoot_annotateStats(1.5, 1.5,'___________________'); %adobe
            % zoot_annotateStats(1.5, 1.6,'** Target');
            % zoot_annotateStats(1.5,1.8,'*** Validity');


        end
    end
end

% [ax3, h3] = suplabel('Non-target Absent', 't', [0.08 0.08 1.3 0.9]);
% [ax4, h4] = suplabel('Non-target Present', 't', [0.08 0.08 .45 0.9]);
% [ax5, h5] = suplabel('T1', 'tt', [0.08 0.08 .27 0.86]);
% [ax6, h6] = suplabel('T2', 'tt', [0.08 0.08 .6 0.86]);


figTitle = 'det';
if saveplots
    export_fig(gcf,sprintf('%s/%s.%s', figDir, figTitle, figType), '-transparent','-p10')
    print(gcf, '-dpdf', '/Users/jennymotzer/Documents/GitHub/ZOOT/experiment-files/groupFigs/det.pdf')
end