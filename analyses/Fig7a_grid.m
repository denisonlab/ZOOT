function Fig6_grid
% plots the grid showing possible stimulus and response mappings

%% Settings
user = 'karen'; % 'jenny' 'karenlab' 'karen'

% Fig saving
savePlots = 1; 
figType = 'pdf';
figTitle = 'Fig6_SwapGrid';
figNum=6;

%% Setup 
[zootDir,figDir] = pathToZoot(user); 

% Load the data
datafile = sprintf('%s/experiment-files/zoot_dataAll.mat',zootDir); 
load(datafile)

% Figure styling
fp = zoot_figureparams;
xVals = fp.xVals; 

[zootDir,figDir] = pathToZoot(user); % run again bc dataall overwrites fig dir 

%% Make the grid
% Initialize with zeros
A = zeros(4,10);

% Correct responses 
A(3,8:10) = 2;
A(2,5:7) = 2;
A(1,2:4) = 2;

% Swaps 
A(3,[4,7]) = 1; 
A(2,[3,9]) = 1; 
A(1,[5,8]) = 1; 

% Define the colormap 
swapC(3,:) = [95 163 90]/255; % correct - green
swapC(2,:) = [0.6 0.6 0.6]; % swaps - gray 
swapC(1,:) = [0.9 0.9 0.9]; % other incorrect - white

%% Plot the grid
figure 
% set(gca,'YDir','normal')
hold on 
axis off
pc = pcolor(fliplr(A));
colormap(swapC)
ax = gca; 
ax.Position = [0.1 0.1 0.5 0.2]; 

if savePlots
    export_fig(gcf,sprintf('%s/%s.%s', figDir, figTitle, figType), '-transparent','-p10')
end
