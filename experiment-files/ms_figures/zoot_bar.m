function b = zoot_bar(x,y,iC,iV,iT,plotSubjects,err, figNum)
% x vector of data
% y vector of data
% iC: 1->target present; 2->target absent 
% iV: 1->valid; 2->neutral; 3->invalid
% iT: 1->T1; 2->T2
% plotSubjects: logical, defaults to 1
% err vector of data (e.g. ste), optional
% figNum: used for bar settings (filled, hollow, grey, semi-filled)

%% Check inputs
if nargin<3
    iC = 1;
    warning('iC not provided. Defaults to 1')
elseif nargin<4
    iV = 1;
    warning('iV not provided. Defaults to 1')
elseif nargin<5
    iT = 1; 
    warning('iT not provided. Defaults to 1')
elseif nargin<6
    plotSubjects = 1; 
elseif nargin<7 
    plotError = 0; % only plots errorbar if error data supplied
else 
    plotError = 1; 
end

%% Load figure parameters
fp = zoot_figureparams;
xVals = fp.xVals; 
x = repmat(xVals(iT,iV),size(y));

%% Plot

% group mean
if figNum == 2 || figNum == 3 % for the accuracy plots, TP=filled, TA=hollow
    b = bar(mean(x), mean(y,'omitnan'),...
        'LineWidth',fp.bar.lineWidth(iC),'BarWidth',fp.bar.barWidth(iC),... % 'LineJoin','miter'
        'EdgeColor',fp.colorsTargets(iT,iV,:),'FaceColor',fp.bar.FaceColor(iC,iT,iV,:));
elseif figNum==4  % for dis plot, all filled; det plot option, will be semi-filled?
    b = bar(mean(x), mean(y,'omitnan'),...
        'LineWidth',fp.bar.lineWidth(2),'BarWidth',fp.bar.barWidth(2),... % 'LineJoin','miter'
        'EdgeColor',fp.colorsTargets(iT,iV,:),'FaceColor',fp.bar.FaceColor(1,iT,iV,:));
elseif figNum==5 % for det plot, all semi-filled
    b = bar(mean(x), mean(y,'omitnan'),...
        'LineWidth',fp.bar.lineWidth(2),'BarWidth',fp.bar.barWidth(2),... % 'LineJoin','miter'
        'EdgeColor',fp.colorsTargets(iT,iV,:),'FaceColor',fp.bar.detFaceColor(1,iT,iV, :));
elseif figNum==6 %for swap, all grey
    b = bar(mean(x), mean(y,'omitnan'),...
        'LineWidth',fp.bar.lineWidth(iC),'BarWidth',fp.bar.barWidth(iC),... % 'LineJoin','miter'
        'EdgeColor',fp.grey,'FaceColor',fp.grey);
end

if plotSubjects
    if figNum==6 %for swap, all grey
        scatter(x,y,'filled',...
            'SizeData',fp.scatter.size,'XJitter','rand','XJitterWidth',fp.scatter.xJitter,...
            'MarkerFaceColor',fp.grey,'MarkerEdgeColor',fp.scatter.edgeColor,'MarkerFaceAlpha',fp.scatter.alpha)
    else
        scatter(x,y,'filled',...
            'SizeData',fp.scatter.size,'XJitter','rand','XJitterWidth',fp.scatter.xJitter,...
            'MarkerFaceColor',fp.colorsTargets(iT,iV,:),'MarkerEdgeColor',fp.scatter.edgeColor,'MarkerFaceAlpha',fp.scatter.alpha);
    end
end

if plotError
    errorbar(x,mean(y,'omitnan'),err,'k','CapSize',fp.CapSize,'LineWidth',fp.ErrorBarLineWidth)
end


