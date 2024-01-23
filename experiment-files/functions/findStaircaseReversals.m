function reversals_all=findStaircaseReversals(staircaseVals)
%find staircase reversals. currently tuned to tacs and tafmri.
%mle 2022

reversals_all=cell(1,size(staircaseVals,2));
for j=1:2
    direction=j; %start down
    vals=staircaseVals(:,j);
    reversals=[];
    for i=1:length(vals)-1
        difference=vals(i)-vals(i+1);
        if direction==1  && difference<0
            reversals=[reversals i];
            direction=2;
        elseif direction==2  && difference>0
            reversals=[reversals i];
            direction=1;
        end
    end
    reversals_all{j}= vals(reversals');
end