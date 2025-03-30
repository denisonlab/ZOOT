function zoot_plotStats

fp = zoot_figureparams;
xVals = fp.xVals; 
xVals(2,:) = xVals(2,:)-0.2;

xPairs = [1 3; 1 2; 2 3]; % invalid-valid, invalid-neutral, neutral-valid
yMax = 0.93; yDiff = 0.04;
yBracket = [yMax yMax-yDiff yMax-2*yDiff]; % pairwise brackets y position
yMain = 115; % significace text y position
yMax = 107; yDiff = 5;
yPairs = [yMax yMax-yDiff yMax-yDiff*2]; % y position for significant text

clear stats % structure with stats information
% stats.pairwise{1} = {'***','**',''; '**','',''};
stats.pairwise{1} = {'***','**','*'; '**','***','*'}; % target by pair
stats.main{1} = {'***','*'};
stats.mainOverall{1} = {};
for iT = 1:2 % two targets
    % pairwise comparisons
    for iP = 1:3
        txt = zoot_annotateStats( (xVals(iT,xPairs(iP,2)) + xVals(iT,xPairs(iP,1)))/2, yPairs(iP), stats.pairwise{1}{iT,iP});
        % txt.FontSize = 14;
        zoot_drawBracket(xVals(iT,xPairs(iP,1)),xVals(iT,xPairs(iP,2)),yBracket(iP),0.5)
    end
    % main effect per target
    txt = zoot_annotateStats(xVals(iT,2),yMain,stats.pairwise{1}{iT});
    % txt.FontSize = 14;
end
% main effect across targets
txt = zoot_annotateStats((xVals(1,2)+xVals(2,2))/2,yMain+3,stats.pairwise{1}{iT});
% txt.FontSize = 14;