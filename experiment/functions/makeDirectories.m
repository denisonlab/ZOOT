function makeDirectories(subjectID,currDir)

% Make all the possible directories if they do not exist. If they do, skip.

%main
if ~exist([currDir '/data/' subjectID '/staircasing/'], 'dir')
    mkdir(['data/' subjectID '/staircasing/']) %main data files
end

if ~exist([currDir '/data/' subjectID '/practice/'], 'dir')
    mkdir(['data/' subjectID '/practice/']) %main data files
end


if ~exist([currDir '/data/' subjectID '/beh/task/'], 'dir')
    mkdir(['data/' subjectID '/beh/task/']) %main data files
end

if ~exist([currDir '/data/' subjectID '/threshold'], 'dir')
    mkdir(['data/' subjectID '/threshold']) %main data files
end


%eyetracker
if ~exist([currDir '/eyedata/' subjectID '/staircasing/'], 'dir')
    mkdir(['eyedata/' subjectID '/staircasing/']) %main data files
end




if ~exist([currDir '/eyedata/' subjectID '/beh/task/'], 'dir')
    mkdir(['eyedata/' subjectID '/beh/task/']) %main data files
end

