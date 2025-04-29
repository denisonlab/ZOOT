function fp = zoot_figureParams
% Figure settings for zoot

%% Sizing
fp.rect = [100 100 500 400]; 
fp.OuterPosition = [0 0 1 0.85]; % adds y height above tiled layout 

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

%for det
fp.lightblue = [0.494 0.71 .969; ...
    .682 .816 1; ...
    .71 .851 1];

fp.lightorange = [0.89 0.486 0.282;... % T2  
    .91 0.584 0.396; ...
    .98 0.733 0.576];

fp.purple = [0.361 0.184 0.459;...
    0.459 0.231 0.588;...
    0.522 0.243 0.678]; % for predicted results

fp.bry = [0 0.4470 0.7410; ...
    0.6350 0.0780 0.1840; ...
    0.9290 0.6940 0.1250]; % for swap vs incorrect trial plots
% 
% fp.coolPurple =[0.533 0.341 0.71; ...
%     0.71 0.463 0.941;...
%     0.808 0.624 0.988];
% fp.coolBlue = [0 0.776 0.929;...
%     0.502 0.918 0.969;...
%     0.663 0.945 1];
% fp.coolGreen = [0 0.812 0.463;...
%     0.043 0.89 0.529;...
%     0.208 1 0.663];
   


fp.detColorsTargets(1,:,:) = fp.lightblue;
fp.detColorsTargets(2,:,:)=fp.lightorange;

fp.coolColors = [0.533 0.341 0.71;...
    0 0.776 0.929;...
    0 0.812 0.463];

% fp.coolColors(1,:,:) = fp.coolPurple;
% fp.coolColors(2,:,:) = fp.coolBlue;
% fp.coolColors(3,:,:) = fp.coolGreen;
%% Errorbars 
fp.CapSize = 8; 
fp.ErrorBarLineWidth = 0.75; 

%% Barplots
fp.bar.barWidth = [0.2 0.18 .2 0.18];  % TP, TA (repeated for TXNX plots)
fp.bar.barLessWide = .1;
fp.bar.lineWidth = [0.5 2 0.5 2]; % TP, TA (repeated for TXNX plots)
fp.bar.lineLessWide = 0.25;

fp.bar.FaceColor(1,:,:,:) = fp.colorsTargets; 
fp.bar.FaceColor(2,:,:,:) = ones([1 2 3 3]); % white if target absent
fp.bar.FaceColor(3,:,:,:) = fp.colorsTargets; 
fp.bar.FaceColor(4,:,:,:) = ones([1 2 3 3]); % white if target absent

fp.bar.detFaceColor(1,:,:,:)=fp.detColorsTargets;

%% Scatterplots
% Individual subjects 
fp.scatter.alpha = 0.5; % [0.6 0.5 0.3]; % alpha (V, N, I) 
fp.scatter.edgeColor = [1 1 1]; % white 
fp.scatter.size = 12; % dot size 
fp.scatter.bigSize = 20;
fp.scatter.xJitter = 0.03; 

% group means
fp.gm_scatter.size = 60; % 80
fp.gm_scatter.bigsize = 150; % 80
fp.s.MarkerFaceColor(1,:,:,:) = fp.colorsTargets; 
fp.s.MarkerFaceColor(2,:,:,:) = ones([1 2 3 3]); % white if target absent
fp.s.MarkerFaceColor(3,:,:,:) = fp.colorsTargets; 
fp.s.MarkerFaceColor(4,:,:,:) = ones([1 2 3 3]); % white if target absent
fp.s.MarkerEdgeColor = fp.colorsTargets(:,:,:);
fp.s.lineWidth = [0.5 1.5 0.5 1.5]; % TP, TA (repeated for TXNX plots)
fp.s.lineWider = 2.5;
