clear all


%% load data 

subs = {'pilot'};

for i=length(subs)
    SID = subs(i);
    folder = 'Users\jennymotzer\Documents\GitHub\ZOOT\experiment-files\data\pilot\beh';
    files = dir('*block*');
    for j=1:10
    filename = files