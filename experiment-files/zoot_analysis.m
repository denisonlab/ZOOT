clear all

fp = figureparams;
%% load data

subs = {'pilot'};
fields = {'precue','target', 'T1Contrast', 'T2Contrast', 'seen', 'correct', 'correctDis', 'eyeSkip'}; % fieldnames(data);
for iF = 1:numel(fields) % initialize
    dataAll.(fields{iF}) = [];
end


for iSub=1:length(subs) % for participant

    SID = subs{iSub};
    behDir = ['/Users/jennymotzer/Documents/GitHub/ZOOT/experiment-files/data/' SID '/beh/'];
    cd(behDir);
   sessions = {'session 1', 'session 2'};
     for iSession = 1:numel(sessions) % for session 
        sesNum = sessions{iSession};
        sesDir = ['/Users/jennymotzer/Documents/GitHub/ZOOT/experiment-files/data/' SID '/beh/' sesNum];
        cd(sesDir)
        findFiles = dir('*_block17_*.mat'); % for session shouldn't be hardcoded, find way to find highest block # and load it?
        for iFile = 1:length(findFiles) % for file
            fileName = findFiles(iFile).name;
            load(fileName)
            for iF = 1:numel(fields) % initialize 
                dataAll.(fields{iF}) = [dataAll.(fields{iF}) data.(fields{iF})]; % compiles data structures from one participant 
            end
        end
     end 
end 
% replace NaNs in data.correct with real values
        findNaN = isnan(data.correct); % returns 640 x 1 logical, 1 if NaN at that index
        findNaNIdx = find(findNaN ==1); % list of NaN only indices
        nAppended = length(data.correct) - data.p.nTotalTrials -1;
        findAppended = data.correct(end-nAppended:end); % find indices of appended data.correct
        for i= 1:numel(findAppended)
            idx = findNaNIdx(i);
            newCorr = findAppended(i);
            data.correct(idx) = newCorr; % replace NaNs with appropriate appended data.correct value
            data.correct = data.correct(1:data.p.nTotalTrials); % removed appendeds
            data.correct = logical(data.correct);
        end 


        %% logical indexing
        contrastNames = data.p.contrastNames;
        trials = data.trials;
        trialsHeaders = data.trialsHeaders;
        target = data.p.targets;
        correct = data.correct;
        precueValidities = data.p.precueValidities;
        seen = data.seen;
        correctDis = data.correctDis;

        % get indices p to use in trials matrix 
        presentIdx = find(strcmp(contrastNames, 'high'));
        absentIdx = find(strcmp(contrastNames, 'low'));

        t1TargIdx = find(strcmp(target, 'T1'));
        t2TargIdx = find(strcmp(target, 'T2'));

        validIdxs = find(precueValidities == 1);
        invalidIdx = find(precueValidities ==3);
        neutralIdx = find(precueValidities==2);

        % find the indicies of trials with each condition - returns
        % logicals, 1 = condition met 
        t1Present = trials(:,strcmp(trialsHeaders, 'T1Contrast')) == presentIdx;
        t1Absent = trials(:,strcmp(trialsHeaders, 'T1Contrast')) == absentIdx;
        t2Present = trials(:,strcmp(trialsHeaders, 'T2Contrast')) == presentIdx;
        t2Absent = trials(:,strcmp(trialsHeaders, 'T2Contrast')) == absentIdx;
        
        t1Target = trials(:, strcmp(trialsHeaders, 'target' )) == t1TargIdx;
        t2Target = trials(:, strcmp(trialsHeaders, 'target')) == t2TargIdx;

        valid = sum(trials(:,strcmp(trialsHeaders, 'precueValidity')) == validIdxs,2);
        valid = logical(valid);
        invalid = trials(:,strcmp(trialsHeaders, 'precueValidity')) == invalidIdx;
        neutral = trials(:,strcmp(trialsHeaders, 'precueValidity')) == neutralIdx;

        %
        acc = [validCorr/valid neutralCorr/neutral invalidCorr/invalid]*100;
        
        
        % find indices of trials with both conditions 
        ppIdx = t1Present & t2Present;
        paIdx = t1Present & t2Absent;
        apIdx = t1Absent & t2Present;
        aaIdx = t1Absent & t1Absent;



% 
%     end
% end


%% figures 