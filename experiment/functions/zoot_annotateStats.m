function txt = zoot_annotateStats(x,y,stars,alignment)
% function txt = zoot_annotateStats(x,y,stars)
% written by kt 
% edited by jm 2025

% Draws n.s. and significance stars on figure
% Inputs: 
%   x: x position
%   y: y position, max(fh.YLim) for top of figure 
%   stars: string, ns, *, **, *** or alternative text
% Ouputs: 
%   txt: text handle 

%% Check inputs
if nargin<4
    alignment = 'center'; % defaults to center alignment; % can also be left or right
end

%% Draw stars
if contains(stars,'*')
    txt = text(x,y,stars,'EdgeColor','none',...
    'FontSize',14,'HorizontalAlignment',alignment,'VerticalAlignment','Bottom','FontName','Helvetica'); % Times, make bigger 
elseif strcmp(stars,'ns')
    txt = text(x,y,'n.s.','EdgeColor','none',...
        'FontSize',10,'HorizontalAlignment',alignment,'VerticalAlignment','Bottom','FontName','Helvetica'); 
else % any alternative text 
    txt = text(x,y,stars,'EdgeColor','none',...
        'FontSize',14,'HorizontalAlignment',alignment,'VerticalAlignment','Bottom','FontName','Helvetica');
end