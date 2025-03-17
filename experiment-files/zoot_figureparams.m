function fp = zoot_figureparams
% Figure settings for zoot

%% x-axis 
fp.xVals = [0.7778 1 1.222;... % T1 (
    1.7778 2 2.2222]; % T2

%% Colors 
fp.blue = [0 0.4470 0.7410;... % T1 V 
    0.3 0.6 0.85;... % T1 N
    0.6 0.8 0.95]; % T1 I 
fp.orange = [0.8000 0.3250 0.0980;... % T2 V 
    0.9 0.525 0.298;... % T2 N 
    0.95 0.66 0.42]; % TI 
fp.colorsTargets(1,:,:) = fp.blue; 
fp.colorsTargets(2,:,:) = fp.orange; 

fp.grey = [0.5 0.5 0.5]; % swap

fp.colors =  [0 0.4470 0.7410;...
    0.8500 0.3250 0.0980;...
    0.4660 0.6740 0.1880]; 

fp.saveplots = 0;

%% Errorbars 
fp.CapSize = 0; 
fp.ErrorBarLineWidth = 1; 
fp.bar.barWidth = [0.2 0.18];  % T1, T2
fp.bar.lineWidth = [0.5 2]; % T1, T2

fp.bar.FaceColor(1,:,:,:) = fp.colorsTargets; 
fp.bar.FaceColor(2,:,:,:) = ones([1 2 3 3]); % white if target absent

%% Scatterplots
% Individual subjects 
fp.scatter.alpha = [0.6 0.5 0.25]; % alpha (V, N, I) 
fp.scatter.edgeColor = [1 1 1]; % white 
fp.scatter.size = 16; % dot size 
