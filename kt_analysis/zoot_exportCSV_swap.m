

%% export for R

%% export SDT analysis for R
clear swapAcc validity target targetContrast nonTargetContrast SID
swapAcc=[]; validity=[]; target=[]; targetContrast=[]; nonTargetContrast=[]; 
count = 1; 
for iS = 1:length(SIDs)
    for iT = 1:2
        for iCC = 1:4 % contrast condition [ target contrast ]
            for iV = 1:numel(Validities)
                if dataAll(iSub).means(iCC,iV,iT)>=93.75 % only look at swap rates when accuracy was below 93.75
                   swapAcc = [swapAcc; NaN];
                else
                   swapAcc = [swapAcc; dataAll(iSub).NTErrAccmeans(iCC,iV,iT)];
                end
                validity = [validity; Validities(iV)];
                target = [target; iT];
                SID{count} = SIDs(iS); 
                switch iCC 
                    case 1
                        tC = 1;
                        nTC = 1; 
                    case 2
                        tC = 1; 
                        nTC = 0; 
                    case 3
                        tC = 0; 
                        nTC = 1; 
                    case 4
                        tC = 1; 
                        nTC = 0; 
                end
                targetContrast = [targetContrast; tC];
                nonTargetContrast = [nonTargetContrast; nTC];
                count = count+1; 
            end
        end
    end
end

SID=SID'; 
accTable = table(SID, validity, target, targetContrast, nonTargetContrast, swapAcc);
writetable(accTable,'tazoot_swapAcc_kt.csv','Delimiter',',','QuoteStrings','all')
