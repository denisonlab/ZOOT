function zoot_figureStyle_line
% Adjusts fig axis and text styling
% fp is a structure output from zoot_figureParams

fp = zoot_figureparams; 

%% General styling
hold on
box off
set(gca,'TickDir','in');
ax = gca;
ax.LineWidth = 0.5; % fp.ax.LineWidth;
ax.XColor = 'black';
ax.YColor = 'black';
xlim([fp.xVals(1,1)-0.18 fp.xVals(2,3)+0.12])
xticks([fp.xVals(1,:) fp.xVals(2,:)])

%% Text size 
smlFont = 8;
bigFont = 12; % 24 jumbo 

ax.FontSize = bigFont;
ax.FontName = 'Helvetica'; % 'Helvetica-Light'; 
 
ax.XAxis.FontSize = smlFont;
ax.YAxis.FontSize = smlFont;

ax.LabelFontSizeMultiplier = bigFont/smlFont; 

set(0, 'DefaultFigureRenderer', 'painters')




