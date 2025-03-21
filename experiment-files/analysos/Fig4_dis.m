function Fig4_dis % please name the function 
% Fig4_dis plots a 2x2 graph of discrimination d' and criterion by non-target presence/absence 

%% Settings 
user = 'jenny'; % 'jenny'
saveplots = 0; 
plotStats = 1; 
target_ANOVA = 1; % to plot individual target (T1/T2) ANOVAs main ANOVAs
big_ANOVA = 1; % to plot across target ANOVAs
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

%x values
xVals = fp.xVals; 
%% FIGURE 4: plot discrimination
% dprime
dprimefieldnames = fieldnames(dataAll(iSub).disd);
figure
set(gcf,'Position',[100 100 500 400])
for iContrast = 2:numel(dprimefieldnames) % for each condition (nontarget present, nontarget absent) while skipping the "all" condition in the first position
    subplot(2,2,iContrast-1) % iContrast-1 to skip the all condition
    zoot_figureStyle; hold on
    for iTarget = 1:2
        for iValid = 1:3
            b = bar(xVals(iTarget,iValid), disd.(dprimefieldnames{iContrast})(iTarget, iValid),...
                'LineWidth',fp.bar.lineWidth(iContrast),'BarWidth',fp.bar.barWidth(iContrast),...
                'EdgeColor',fp.colorsTargets(iTarget,iValid,:),'FaceColor',fp.bar.FaceColor(1,iTarget,iValid,:)); 
            
            % scatter 
            swarmchart( xVals(iTarget,iValid), squeeze(disd_scatterplot.(Detfieldnames{iContrast})(iValid,:,iTarget)),'filled',...
                'SizeData',fp.scatter.size,'XJitterWidth',100,'MarkerFaceColor',fp.colorsTargets(iTarget,iValid,:),'MarkerEdgeColor',fp.scatter.edgeColor,'MarkerFaceAlpha',fp.scatter.alpha(iValid) ); 
            
            errorbar(xcoords(iContrast, iValid, iTarget),disd.(dprimefieldnames{iContrast})(iTarget, iValid),disdErr.(dprimefieldnames{iContrast})(iTarget, iValid), '.k', 'CapSize', fp.CapSize, 'LineWidth', fp.ErrorBarLineWidth)
        end
    end

    ylabel('Discrimination {\itd''}')
    ylim([0 5])
    set(gca, 'ytick', 0:1:5)
    xlim([0.5 2.5])
    xticks([xVals(1,:) xVals(2,:)])
    set(gca, 'xticklabel', {'V', 'N','I','V','N','I'})

    if plotStats
        if iContrast == 2 % NTP
            % T1 V-I
            zoot_annotateStats(1,3.2,'**');
            zoot_drawBracket(fp.xVals(1,1), fp.xVals(1,3), .62)

            %T2 V-I
            zoot_annotateStats(2,3.6,'*');
            zoot_drawBracket(fp.xVals(2,1), fp.xVals(2,3), .71)

            if target_ANOVA
                % T1 main V
                zoot_annotateStats(1,4.05,'_______');
                zoot_annotateStats(1,4.15,'** Validity');
                % T2 main V
                zoot_annotateStats(2,4.05,'_______');
                zoot_annotateStats(2,4.15,'* Validity');
            end
            if big_ANOVA
                % overall ANOVAs
                zoot_annotateStats(1.5, 4.5,'___________________'); %adobe
                zoot_annotateStats(1.5, 4.6,'*** Target');
                zoot_annotateStats(1.5,4.9,'** Validity');
            end

        elseif iContrast == 3 % NTA
            %T1 V-I
            zoot_annotateStats(1,3.7,'*');
            zoot_drawBracket(fp.xVals(1,1), fp.xVals(1,3), .70)
            if target_ANOVA
                %T1 main V
                zoot_annotateStats(1,4.05,'_______');
                zoot_annotateStats(1,4.15,'* Validity');
            end
            if big_ANOVA
                zoot_annotateStats(1.5, 4.5,'___________________'); % adobe
                zoot_annotateStats(1.5, 4.6,'* Target');
                zoot_annotateStats(1.5,4.9,'** Validity');
            end
        end
    end
end

% % criterion
for iContrast = 2:numel(dprimefieldnames) % for each condition (nontarget present, nontarget absent) while skipping the "all" condition in the first position
    subplot(2,2,iContrast+1) % iContrast+1 to put in 3rd and 4th subplots
    zoot_figureStyle; hold on
    for iTarget = 1:2
        for iValid = 1:3
            b = bar(xVals(iTarget,iValid), disc.(dprimefieldnames{iContrast})(iTarget, iValid),...
                'LineWidth',fp.bar.lineWidth(iContrast),'BarWidth',fp.bar.barWidth(iContrast),...
                'EdgeColor',fp.colorsTargets(iTarget,iValid,:),'FaceColor',fp.bar.FaceColor(1,iTarget,iValid,:));

            % scatter
            swarmchart( xVals(iTarget,iValid), squeeze(disc_scatterplot.(Detfieldnames{iContrast})(iValid,:,iTarget)),'filled',...
                'SizeData',fp.scatter.size,'XJitterWidth',100,'MarkerFaceColor',fp.colorsTargets(iTarget,iValid,:),'MarkerEdgeColor',fp.scatter.edgeColor,'MarkerFaceAlpha',fp.scatter.alpha(iValid) ); 
            
            errorbar(xcoords(iContrast, iValid, iTarget),disc.(dprimefieldnames{iContrast})(iTarget, iValid),discErr.(dprimefieldnames{iContrast})(iTarget, iValid), '.k', 'CapSize', fp.CapSize, 'LineWidth', fp.ErrorBarLineWidth)
        end
    end

    ylabel('Discrimination c')
    ylim([-2 2])    
   set(gca, 'ytick', -2:1:2)
    xlim([0.5 2.5])
    xticks([xVals(1,:) xVals(2,:)])
    set(gca, 'xticklabel', {'V', 'N','I','V','N','I'})
   
    if plotStats
        if iContrast == 2 % NTP
            %T2 N-I
            zoot_annotateStats(2.1111,.5,'*');
            zoot_drawBracket(fp.xVals(2,2), fp.xVals(2,3), 0.25)

            if target_ANOVA
                %T2 main V
                zoot_annotateStats(2,1.1,'_______');
                zoot_annotateStats(2,1.15,'* Validity');
            end
            if big_ANOVA
                % overall ANOVAs
                zoot_annotateStats(1.5, 1.6,'___________________');
                zoot_annotateStats(1.5, 1.65,'** Target:Validity'); % adobe
            end

        elseif iContrast ==3 % NTA
            if big_ANOVA
                %overall ANOVA
                zoot_annotateStats(1.5, 1.6,'___________________');
                zoot_annotateStats(1.5, 1.65,'* Target'); % adobe
            end

        end
    end
end 

% [ax3, h3] = suplabel('Non-target Absent', 't', [0.08 0.08 1.3 0.9]);
% [ax4, h4] = suplabel('Non-target Present', 't', [0.08 0.08 .45 0.9]);
% [ax5, h5] = suplabel('T1', 'tt', [0.08 0.08 .27 0.86]);
% [ax6, h6] = suplabel('T2', 'tt', [0.08 0.08 .6 0.86]);
% [ax7, h7] = suplabel('T1', 'tt', [0.08 0.08 1.16 0.86]);
% [ax8, h8] = suplabel('T2', 'tt', [0.08 0.08 1.49 0.86]);


figTitle = 'dis';
figType = 'pdf';
if saveplots
    export_fig(gcf,sprintf('%s/%s.%s', figDir, figTitle, figType), '-transparent','-p10')
end