function zoot_figureStyle2
% Adjusts fig axis and text styling
% fp is a structure output from zoot_figureParams
% Identical to zoot_figureStyle except x and y are same size and x limits
% and ticks are not controlled

fp = zoot_figureparams; 

%% General styling
hold on
box off
set(gca,'TickDir','in');
ax = gca;
ax.LineWidth = fp.ax.LineWidth;
ax.XColor = 'black';
ax.YColor = 'black';

%% Text size 
smlFont = 8;
bigFont = 12; % 24 jumbo 

ax.FontSize = bigFont;
ax.FontName = 'Helvetica'; % 'Helvetica-Light'; 
 
ax.XAxis.FontSize = smlFont;
ax.YAxis.FontSize = smlFont;

ax.LabelFontSizeMultiplier = bigFont/smlFont; 

set(0, 'DefaultFigureRenderer', 'painters')




