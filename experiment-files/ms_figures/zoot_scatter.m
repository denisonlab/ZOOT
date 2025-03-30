function zoot_scatter(x,y,iC,iV,iT,plotSubjects,err)
% x vector of data
% y vector of data
% iC: 1->target present; 2->target absent 
% iV: 1->valid; 2->neutral; 3->invalid
% iT: 1->T1; 2->T2
% plotSubjects: logical, defaults to 1
% err vector of data (e.g. ste), optional 

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
scatter(mean(x), mean(y,'omitnan'),fp.gm_scatter.size,...
    'MarkerEdgeColor',fp.colorsTargets(iT,iV,:),'MarkerFaceColor',fp.s.MarkerFaceColor(iC,iT,iV,:),'LineWidth',fp.s.lineWidth(iC))

if plotSubjects
    scatter(x,y,'filled',...
        'SizeData',fp.scatter.size,'XJitter','rand','XJitterWidth',fp.scatter.xJitter,...
        'MarkerFaceColor',fp.colorsTargets(iT,iV,:),'MarkerEdgeColor',fp.scatter.edgeColor,'MarkerFaceAlpha',fp.scatter.alpha)
end

if plotError
    errorbar(x,mean(y,'omitnan'),err,'k','CapSize',fp.CapSize,'LineWidth',fp.ErrorBarLineWidth)
end


