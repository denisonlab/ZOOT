function zoot_figureStyle(fp)
% Adjusts fig axis and text styling
% fp is a structure output from zoot_figureParams

%% General styling
hold on
box off
set(gca,'TickDir','in');
ax = gca;
ax.LineWidth = fp.ax.LineWidth;
ax.XColor = 'black';
ax.YColor = 'black';
xlim([0.5 2.3])
xticks([fp.xVals(1,:) fp.xVals(2,:)])

%% Text size 
smlFont = 8;
bigFont = 12; % 24 jumbo 

ax.FontSize = bigFont;
ax.FontName = 'Helvetica'; % 'Helvetica-Light'; 
 
ax.XAxis.FontSize = bigFont;
ax.YAxis.FontSize = smlFont;

ax.LabelFontSizeMultiplier = bigFont/smlFont; 

set(0, 'DefaultFigureRenderer', 'painters')








