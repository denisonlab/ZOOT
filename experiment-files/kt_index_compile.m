

figure

% Logical trial of when the target was present bc orientation
% discirmination has no relevant accuracy when it is absent
filterIdx = data.targetContrast==1 & data.target==2 & data.eyeSkip~=1


subplot 
var = data.correctDis(filterIdx); 

acc = mean(var,'omitnan')


fields = {'T1Axis','target','seen'}; % fieldnames(data);
for iS = 1 % number of subjects
    for i = 1:2 % number of sessions
        for iF = 1:numel(fields)
            dataAll.(fields{iF}) = [ data.(fields{iF}) data2.(fields{iF})]; 
        end
    end
end