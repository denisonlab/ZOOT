function zoot_figureStyle

% adjusts fig axis and text styling
hold on
box off
hold on 
set(gca,'TickDir','in');
ax = gca;
ax.LineWidth = 0.75;
ax.XColor = 'black';
ax.YColor = 'black';

smlFont = 8;
bigFont = 12; % 24 jumbo 

ax.FontSize = bigFont;
ax.FontName = 'Helvetica'; % 'Helvetica-Light'; 
 
ax.XAxis.FontSize = bigFont;
ax.YAxis.FontSize = smlFont;

ax.LabelFontSizeMultiplier = bigFont/smlFont; 

set(0, 'DefaultFigureRenderer', 'painters')








