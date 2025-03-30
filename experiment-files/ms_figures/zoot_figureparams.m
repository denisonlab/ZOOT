function fp = zoot_figureParams
% Figure settings for zoot

%% Sizing
fp.rect = [100 100 450 330]; 
fp.OuterPosition = [0 0 1 0.9]; % adds y height above tiled layout 

%% Axes
fp.ax.LineWidth = 0.75; 

%% x-axis 
fp.xVals = [0.7778 1 1.222;... % T1 (
    1.7778 2 2.2222]; % T2
fp.xVals(2,:) = fp.xVals(2,:)-0.2; 

%% Colors 
fp.blue = [0 0.4470 0.7410;... % T1 V 
    0.3 0.6 0.85;... % T1 N
    0.6 0.8 0.95]; % T1 I 

fp.orange = [0.8000 0.3250 0.0980;... % T2 V 
    0.9 0.525 0.298;... % T2 N 
    0.95 0.66 0.42]; % TI 

fp.colorsTargets(1,:,:) = fp.blue; % 2 (targets) x 3 (att conditions) x 3 (rgb)
fp.colorsTargets(2,:,:) = fp.orange; 

fp.grey = [0.5 0.5 0.5]; % swap

fp.colors =  [0 0.4470 0.7410;...
    0.8500 0.3250 0.0980;...
    0.4660 0.6740 0.1880]; 

%% Errorbars 
fp.CapSize = 8; 
fp.ErrorBarLineWidth = 0.75; 

%% Barplots
fp.bar.barWidth = [0.2 0.18 .2 0.18];  % TP, TA (repeated for TXNX plots)
fp.bar.lineWidth = [0.5 2 0.5 2]; % TP, TA (repeated for TXNX plots)

fp.bar.FaceColor(1,:,:,:) = fp.colorsTargets; 
fp.bar.FaceColor(2,:,:,:) = ones([1 2 3 3]); % white if target absent
fp.bar.FaceColor(3,:,:,:) = fp.colorsTargets; 
fp.bar.FaceColor(4,:,:,:) = ones([1 2 3 3]); % white if target absent

%% Scatterplots
% Individual subjects 
fp.scatter.alpha = 0.5; % [0.6 0.5 0.3]; % alpha (V, N, I) 
fp.scatter.edgeColor = [1 1 1]; % white 
fp.scatter.size = 12; % dot size 
fp.scatter.xJitter = 0.03; 

% group means
fp.gm_scatter.size = 60; % 80
fp.s.MarkerFaceColor(1,:,:,:) = fp.colorsTargets; 
fp.s.MarkerFaceColor(2,:,:,:) = ones([1 2 3 3]); % white if target absent
fp.s.MarkerFaceColor(3,:,:,:) = fp.colorsTargets; 
fp.s.MarkerFaceColor(4,:,:,:) = ones([1 2 3 3]); % white if target absent
fp.s.MarkerEdgeColor = fp.colorsTargets(:,:,:);
fp.s.lineWidth = [0.5 1.5 0.5 1.5]; % TP, TA (repeated for TXNX plots)
