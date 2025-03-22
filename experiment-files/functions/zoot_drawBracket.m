function zoot_drawBracket(x1,x2,y,linewidth)
% Draws bracket for indicating statistical test 

%% Check inputs
if nargin<4
    linewidth = 1; % default
end

%% 
yl = ylim;
xl = xlim;

y = y + 0.05; % correction to better align with significance indicator 
bracketHeight = (yl(2)-yl(1))/45; % 0.007 
bracketColor = 'black'; 

% draw 4 point line 
x = [x1; x1; x2; x2]; 
y = [max(yl)*y-bracketHeight; max(yl)*y; max(yl)*y; max(yl)*y-bracketHeight]; 

plot(x,y,'LineWidth',linewidth,'Color',bracketColor,'LineJoin','miter')