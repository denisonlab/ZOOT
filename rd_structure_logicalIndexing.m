%% structures

% replace
nppSum = 0; %pp
vppSum = 0;
ippSum = 0;
npaSum = 0; %pa
vpaSum = 0;
ipaSum = 0;
napSum = 0; %ap
vapSum = 0;
iapSum = 0;
naaSum = 0; %aa
vaaSum = 0;
iaaSum = 0;

% with
pa = {'p','a'};
validity = {'v','n','i'};

nPA = numel(pa);
nValidities = numel(validity);

for iV = 1:nValidities
    v = validity{iV};
    for iPA = 1:nPA
        t1PA = pa{iPA};
        for iPA = 1:nPA
            t2PA = pa{iPA};
            sum.(v).(t1PA).(t2PA) = 0;
        end
    end
end

%% logical indexing
precueValidity = 'valid';
target = 'T1';

vIdx = find(strcmp(data.p.precueNames, precueValidity));
tIdx = find(strcmp(data.p.targets, target));

trials = data.trials;
trialsHeaders = data.trialsHeaders;
wV = trials(:,strcmp(trialsHeaders,'precueValidity'))==vIdx;
wT = trials(:,strcmp(trialsHeaders,'target'))==tIdx;

w = wV & wT;

