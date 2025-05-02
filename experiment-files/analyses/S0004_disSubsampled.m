function S0004_disSubsampled 
% Fig4_dis plots dis d' and c by non-target presence vs. absence 
% for zoot

%% Settings 
user = 'jenny'; % 'jenny' 'karenlab' 'karen'

% Fig saving
savePlots = 0; 
figType = 'pdf';
figTitle = 'Fig4_dis';
figNum = 2; 

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

%% subsampled over2N dis plot

clear panel 
figure
set(gcf,'Position',fp.rect)

count = 1;
tcl = tiledlayout(2,2,'TileSpacing','compact','OuterPosition',fp.OuterPosition); % adds y height
sgtitle('S0004 dis: over2N subsampled')
for iRep = 1:2 % 1 is d'; 2 is c
    for iC = 2:3 % 2 is non-target present; 3 is non-target absent
        panel(count).info = nexttile;
        zoot_figureStyle(fp)
        switch count
            case {1,2} % d'
                xticklabels('')
                ylim([0 4.5])
                yticks(0:1:4.5)
            case {3,4} % c
                xticklabels({'V','N','I','V','N','I'})
                ylim([-1.5 1.5])
                yticks(-1.5:0.5:1.5)
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
                        zoot_bar(xVals(iT,iV),dataAll(1).disd_sub_over2N.(Detfieldnames{iC})(iT,iV),...
                            1,iV,iT,0,0, figNum);
                    case {3,4}  %Dis c
                        zoot_bar(xVals(iT,iV),dataAll(1).disc_sub_over2N.(Detfieldnames{iC})(iT,iV),...
                            1,iV,iT,0,0, figNum);
                end
            end
        end
        % 
        % if plotStats
        %     zoot_plotStats
        % end

        count = count+1;
    end
end


%% subsampled all loglinear dis plot

clear panel 
figure
set(gcf,'Position',fp.rect)

count = 1;
tcl = tiledlayout(2,2,'TileSpacing','compact','OuterPosition',fp.OuterPosition); % adds y height
sgtitle('S0004 dis: all loglinear subsampled')
for iRep = 1:2 % 1 is d'; 2 is c
    for iC = 2:3 % 2 is non-target present; 3 is non-target absent
        panel(count).info = nexttile;
        zoot_figureStyle(fp)
        switch count
            case {1,2} % d'
                xticklabels('')
                ylim([0 4.5])
                yticks(0:1:4.5)
            case {3,4} % c
                xticklabels({'V','N','I','V','N','I'})
                ylim([-1.5 1.5])
                yticks(-1.5:0.5:1.5)
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
                        zoot_bar(xVals(iT,iV),dataAll(1).disd_sub.(Detfieldnames{iC})(iT,iV),...
                            1,iV,iT,0,0, figNum);
                    case {3,4}  %Dis c
                        zoot_bar(xVals(iT,iV),dataAll(1).disc_sub.(Detfieldnames{iC})(iT,iV),...
                            1,iV,iT,0,0, figNum);
                end
            end
        end
        % 
        % if plotStats
        %     zoot_plotStats
        % end

        count = count+1;
    end
end

%% not subsampled over2N dis plot

clear panel 
figure
set(gcf,'Position',fp.rect)

count = 1;
tcl = tiledlayout(2,2,'TileSpacing','compact','OuterPosition',fp.OuterPosition); % adds y height
sgtitle('S0004 dis: over2N not subsampled')
for iRep = 1:2 % 1 is d'; 2 is c
    for iC = 2:3 % 2 is non-target present; 3 is non-target absent
        panel(count).info = nexttile;
        zoot_figureStyle(fp)
        switch count
            case {1,2} % d'
                xticklabels('')
                ylim([0 4.5])
                yticks(0:1:4.5)
            case {3,4} % c
                xticklabels({'V','N','I','V','N','I'})
                ylim([-1.5 1.5])
                yticks(-1.5:0.5:1.5)
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
                        zoot_bar(xVals(iT,iV),dataAll(1).disd_over2N.(Detfieldnames{iC})(iT,iV),...
                            1,iV,iT,0,0, figNum);
                    case {3,4}  %Dis c
                        zoot_bar(xVals(iT,iV),dataAll(1).disc_over2N.(Detfieldnames{iC})(iT,iV),...
                            1,iV,iT,0,0, figNum);
                end
            end
        end
        % 
        % if plotStats
        %     zoot_plotStats
        % end

        count = count+1;
    end
end


%% not subsampled all loglinear dis plot

clear panel 
figure
set(gcf,'Position',fp.rect)

count = 1;
tcl = tiledlayout(2,2,'TileSpacing','compact','OuterPosition',fp.OuterPosition); % adds y height
sgtitle('S0004 dis: all loglinear not subsampled')
for iRep = 1:2 % 1 is d'; 2 is c
    for iC = 2:3 % 2 is non-target present; 3 is non-target absent
        panel(count).info = nexttile;
        zoot_figureStyle(fp)
        switch count
            case {1,2} % d'
                xticklabels('')
                ylim([0 4.5])
                yticks(0:1:4.5)
            case {3,4} % c
                xticklabels({'V','N','I','V','N','I'})
                ylim([-1.5 1.5])
                yticks(-1.5:0.5:1.5)
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
                        zoot_bar(xVals(iT,iV),dataAll(1).disd.(Detfieldnames{iC})(iT,iV),...
                            1,iV,iT,0,0, figNum);
                    case {3,4}  %Dis c
                        zoot_bar(xVals(iT,iV),dataAll(1).disc.(Detfieldnames{iC})(iT,iV),...
                            1,iV,iT,0,0, figNum);
                end
            end
        end
        % 
        % if plotStats
        %     zoot_plotStats
        % end

        count = count+1;
    end
end

