
exportCSV = 1;

%% Export SDT analysis for CSV
SID = []; 
validity = []; 
target = []; 
nonTargetContrast = []; 
count = 1; 
for iS=1:15
    for iNT=1:2
        for iT=1:2 % target T1 T2
            for iV=1:3 % valid, neutral, invalid
                SID{count} = dataAll(iS).subjectID; 
                validity(count) = iV; 
                target(count) = iT; 
                nonTargetContrast(count) = iNT; 

                % SDT variables
                dis_dp(count) = A.dis.dprime(iS,iNT,iT,iV); 
                dis_c(count) = A.dis.criterion(iS,iNT,iT,iV); 
                
                det_dp(count) = A.det.dprime(iS,iNT,iT,iV); 
                det_c(count) = A.det.criterion(iS,iNT,iT,iV); 

                dis_dp_SS(count) = mean(A.disSS.dprime(iS,iNT,iT,iV,:),'omitnan'); 
                dis_c_SS(count) = mean(A.disSS.criterion(iS,iNT,iT,iV,:),'omitnan'); 

                det_dp_SS(count) = mean(A.detSS.dprime(iS,iNT,iT,iV,:),'omitnan'); 
                det_c_SS(count) = mean(A.detSS.criterion(iS,iNT,iT,iV,:),'omitnan'); 

                count = count+1; 
            end
        end
    end
end

tblHdrs = {'SID','validity','target','nonTargetContrast',...
    'dis_dp','dis_c','det_dp','det_c','dis_dp_SS','dis_c_SS','det_dp_SS','det_c_SS'}; 
accTable = table(SID', validity', target', nonTargetContrast',...
    dis_dp',dis_c',det_dp',det_c',dis_dp_SS',dis_c_SS',det_dp_SS',det_c_SS',...
    'VariableNames',tblHdrs);

if exportCSV
    writetable(accTable,'zoot_sdt_kt.csv','Delimiter',',','QuoteStrings','all')
end