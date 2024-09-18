clear all

saveplots = 0;

fp = figureparams;

addpath('/Users/jennymotzer/Documents/GitHub/ZOOT/experiment-files/functions/')

%% compile
subs = {'S0004', 'S0005', 'S0007', 'S0013', 'S0015', 'S0018', 'S0019', 'S0070', 'S0071', 'S0085', 'S0105','S0108', 'S0111', 'S0122', 'S0133'};
dataAll = [];

for iSub=1:length(subs) % for participant
    SID = subs{iSub};
    %iMac
    behDir = ['/Users/jennymotzer/Documents/GitHub/ZOOT/experiment-files/data/' SID '/beh/'];
    exptDir = '/Users/jennymotzer/Documents/GitHub/ZOOT/experiment-files/';
    % beh comp
    % behDir = ['/home/denisonlab-beh/Experiments/ZOOT/experiment-files/data' SID '/beh'];
    cd(behDir);
    dataAll(iSub).subjectID = SID;
    fields = {'precue','target', 'T1Contrast', 'T2Contrast', 'T1Tilt', 'T2Tilt', 'targetTilt', 'targetContrast', 'seen', 'correct', 'response', 'correctDis', 'session', 'timeTargetRT', 'eyeSkip'}; % fieldnames(data);
    for iF = 1:numel(fields) % initialize
        dataAll(iSub).(fields{iF}) = [];
    end
    sessions = {'session1','session2'};
    for iSession = 1:numel(sessions) % for session
        highestBlock = 0;
        sesNum = sessions{iSession};
        sesDir = ['/Users/jennymotzer/Documents/GitHub/ZOOT/experiment-files/data/' SID '/beh/' sesNum];
        cd(sesDir)
        listing = dir;
        for iFile = 3:size(dir) % for file
            fileName = listing(iFile).name;
            splitName  = strsplit(fileName, '_');
            splitBlock = splitName{5};
            blockNum = str2num(splitBlock(6:end));
            if blockNum > highestBlock
                highestBlock = blockNum;
            end
        end
        findFile = dir(sprintf('*block%d*.mat', highestBlock));
        highestFileName = findFile.name;
        load(highestFileName)
        for iF = 1:numel(fields) % initialize
            if strcmp(fields{iF}, 'eyeSkip') == 1
                data.(fields{iF}) = data.(fields{iF})';
            end
            dataAll(iSub).(fields{iF}) = [dataAll(iSub).(fields{iF}) data.(fields{iF})]; % compiles data structures from one participant
        end

   %% variables

        % get nontarget info
        contrasts = [1 0];
        tilts = [-1 1];
        dataAll(iSub).nonTargetContrast = [];
        dataAll(iSub).nontarget = [];
        dataAll(iSub).nonTargetTilt = [];
        for iNonTarget = 1:size(dataAll(iSub).targetContrast,2)
            if dataAll(iSub).target(iNonTarget) == 1
                dataAll(iSub).nontarget(iNonTarget) = 2;
                dataAll(iSub).nonTargetContrast(iNonTarget) = contrasts(dataAll(iSub).T2Contrast(iNonTarget));
                dataAll(iSub).nonTargetTilt(iNonTarget) = tilts(dataAll(iSub).T2Tilt(iNonTarget));
            elseif dataAll(iSub).target(iNonTarget) == 2
                dataAll(iSub).nontarget(iNonTarget) = 1;
                dataAll(iSub).nonTargetContrast(iNonTarget) = contrasts(dataAll(iSub).T1Contrast(iNonTarget));
                dataAll(iSub).nonTargetTilt(iNonTarget) = tilts(dataAll(iSub).T1Tilt(iNonTarget));
            end
        end
        for iTilt = 1:size(dataAll(iSub).target,2)
            if dataAll(iSub).targetContrast(iTilt) == 0
                dataAll(iSub).targetTilt(iTilt) = 0;
            end
            if dataAll(iSub).nonTargetContrast(iTilt) == 0
                dataAll(iSub).nonTargetTilt(iTilt) = 0;
            end
        end

        % validity variables
        Valid = dataAll(iSub).precue == dataAll(iSub).target;
        Neutral = dataAll(iSub).precue == 3;
        Invalid = (dataAll(iSub).precue == 1| dataAll(iSub).precue == 2) & dataAll(iSub).precue ~= dataAll(iSub).target;

        % target/nontarget present/absent
        PresentPresent = dataAll(iSub).targetContrast == 1 & dataAll(iSub).nonTargetContrast == 1;
        PresentAbsent = dataAll(iSub).targetContrast == 1 & dataAll(iSub).nonTargetContrast == 0;
        AbsentPresent =dataAll(iSub).targetContrast == 0 & dataAll(iSub).nonTargetContrast == 1;
        AbsentAbsent = dataAll(iSub).targetContrast == 0 & dataAll(iSub).nonTargetContrast == 0;

        Validities = {Valid Neutral Invalid};
        contrastConds = {PresentPresent PresentAbsent AbsentPresent AbsentAbsent};


     
    end % session - needs to be here to compile both sessions for each participant
 %% SDT detection nontarget - across cueing conditions
    nhDet = dataAll(iSub).seen == 1 & dataAll(iSub).nonTargetContrast == 1; % hit: seen and present
    nfaDet = dataAll(iSub).seen == 1 & dataAll(iSub).nonTargetContrast == 0; % fa: seen and absent
    nsignalDet = dataAll(iSub).nonTargetContrast == 1; % signal: present
    nnoiseDet = dataAll(iSub).nonTargetContrast == 0; % noise: absent
    Det = {nhDet nfaDet nsignalDet nnoiseDet};

    % indices for all conditions based on target, validity, SDT variable -
    % returns which contains data for all, nontarget present, non target absent. each of these contains condition data for nh nfa
    % nsignal and  nnoise 
    for iTarget =1:2
        for iValid = 1:numel(Validities)
            for iDet = 1:numel(Det)
                detAllIdx = Validities{iValid} & Det{iDet} & dataAll(iSub).nontarget == iTarget & ~dataAll(iSub).eyeSkip; % find all T1 and T2 
                det.all(iTarget, iValid, iDet) = sum(detAllIdx);
                detNTPIdx = Validities{iValid} & Det{iDet} & dataAll(iSub).nontarget == iTarget & dataAll(iSub).targetContrast == 1 & ~dataAll(iSub).eyeSkip; % find all T1 when T2 present and all T2 when T1 present
                det.nontargetPresent(iTarget, iValid, iDet) = sum(detNTPIdx);
                detNTAIdx = Validities{iValid} & Det{iDet} & dataAll(iSub).nontarget == iTarget & dataAll(iSub).targetContrast == 0 & ~dataAll(iSub).eyeSkip; % find all T1 when T2 absent nd all T2 when T1 absent
                det.nontargetAbsent(iTarget, iValid, iDet) = sum(detNTAIdx);
            end
        end
    end

    % calculate dprime and c per condition, detd/c.all, nontargetPresent,
    % nontargetAbsent for valid, neutral, and invalid for T1 and T2 
    dp = [];
    c = [];
    Detfieldnames = fieldnames(det);
    for iTarget = 1:2
        for iValid = 1:numel(Validities)
            for iF = 1:numel(Detfieldnames)
                dataAll(iSub).detNH.(Detfieldnames{iF})(iTarget,iValid) = det.(Detfieldnames{iF})(iTarget,iValid,1);
                dataAll(iSub).detNFA.(Detfieldnames{iF})(iTarget,iValid) = det.(Detfieldnames{iF})(iTarget,iValid,2);
                dataAll(iSub).detNSignal.(Detfieldnames{iF})(iTarget,iValid) = det.(Detfieldnames{iF})(iTarget,iValid,3);
                dataAll(iSub).detNNoise.(Detfieldnames{iF})(iTarget,iValid) = det.(Detfieldnames{iF})(iTarget,iValid,4);
                [dprime, criterion] = kt_dprime2(dataAll(iSub).detNH.(Detfieldnames{iF})(iTarget,iValid), dataAll(iSub).detNFA.(Detfieldnames{iF})(iTarget,iValid), dataAll(iSub).detNSignal.(Detfieldnames{iF})(iTarget,iValid), dataAll(iSub).detNNoise.(Detfieldnames{iF})(iTarget,iValid),1);
                dataAll(iSub).detd.(Detfieldnames{iF})(iTarget,iValid) = [dp dprime]; % store d prime
                dataAll(iSub).detc.(Detfieldnames{iF})(iTarget,iValid) = [c criterion]; % store c
            end
        end
    end


     %% SDT discrimination nontarget - across cueing conditions 
    nhDis = dataAll(iSub).nonTargetContrast == 1 & dataAll(iSub).nonTargetTilt == 1 & dataAll(iSub).response == 2;
    nfaDis = dataAll(iSub).nonTargetContrast == 1 & dataAll(iSub).nonTargetTilt == -1 & dataAll(iSub).response == 2;
    nsignalDis = dataAll(iSub).nonTargetContrast == 1 & dataAll(iSub).nonTargetTilt == 1; %  & dataAll(iSub).seen == 1
    nnoiseDis = dataAll(iSub).nonTargetContrast == 1 & dataAll(iSub).nonTargetTilt == -1; %& dataAll(iSub).seen == 1
    Dis = {nhDis nfaDis nsignalDis nnoiseDis};
    %indices for all conditions based on target, validity, SDT variable
    for iTarget =1:2
        for iValid = 1:numel(Validities)
            for iDis = 1:numel(Dis)
                disAllIdx = Validities{iValid} & Dis{iDis} & dataAll(iSub).nontarget == iTarget & ~dataAll(iSub).eyeSkip; % find all T1 and T2
                dis.all(iTarget, iValid, iDis) = sum(disAllIdx);
                disNTPIdx = Validities{iValid} & Dis{iDis} & dataAll(iSub).nontarget == iTarget & dataAll(iSub).targetContrast == 1 & ~dataAll(iSub).eyeSkip; % find all T1 when T2 present and all T2 when T1 present
                dis.nontargetPresent(iTarget, iValid, iDis) = sum(disNTPIdx);
                disNTAIdx = Validities{iValid} & Dis{iDis} & dataAll(iSub).nontarget == iTarget & dataAll(iSub).targetContrast == 0 & ~dataAll(iSub).eyeSkip; % find all T1 when T2 absent nd all T2 when T1 absent
                dis.nontargetAbsent(iTarget, iValid, iDis) = sum(disNTAIdx);
            end
        end
    end

    % calculate dprime and c per condition
    dp = [];
    c = [];
    Disfieldnames = fieldnames(dis);
    for iTarget = 1:2
        for iValid = 1:numel(Validities)
            for iF = 1:numel(Disfieldnames)
                dataAll(iSub).nhDis.(Disfieldnames{iF})(iTarget,iValid) = dis.(Disfieldnames{iF})(iTarget,iValid,1);
                dataAll(iSub).nfaDis.(Disfieldnames{iF})(iTarget,iValid) = dis.(Disfieldnames{iF})(iTarget,iValid,2);
                dataAll(iSub).nsignalDis.(Disfieldnames{iF})(iTarget,iValid) = dis.(Disfieldnames{iF})(iTarget,iValid,3);
                dataAll(iSub).nnoiseDis.(Disfieldnames{iF})(iTarget,iValid) = dis.(Disfieldnames{iF})(iTarget,iValid,4);
                [dprime, criterion] = kt_dprime2(dataAll(iSub).nhDis.(Disfieldnames{iF})(iTarget,iValid), dataAll(iSub).nfaDis.(Disfieldnames{iF})(iTarget,iValid), dataAll(iSub).nsignalDis.(Disfieldnames{iF})(iTarget,iValid), dataAll(iSub).nnoiseDis.(Disfieldnames{iF})(iTarget,iValid),1);
                dataAll(iSub).disd.(Disfieldnames{iF})(iTarget,iValid) = [dp dprime]; % store d prime
                dataAll(iSub).disc.(Disfieldnames{iF})(iTarget,iValid) = [c criterion]; % store c
            end
        end
    end
     
end % subject

 
 %% SDT across cueing conditions
 % mean, std, err for dprime and c for dis and det
 dprimeDetIdx = [];
 cDetIdx = [];
 dprimeDisIdx = [];
 cDisIdx = [];
 for iTarget = 1:2
     for iF = 1:numel(Detfieldnames)
         for iValid = 1:numel(Validities)
             for iSub = 1:length(subs)
                 dprimeDetIdx = [dprimeDetIdx dataAll(iSub).detd.(Detfieldnames{iF})(iTarget,iValid)];
                 cDetIdx = [cDetIdx dataAll(iSub).detc.(Detfieldnames{iF})(iTarget,iValid)];
                 dprimeDisIdx = [dprimeDisIdx dataAll(iSub).disd.(Detfieldnames{iF})(iTarget,iValid)];
                 cDisIdx = [cDisIdx dataAll(iSub).disc.(Detfieldnames{iF})(iTarget,iValid)];
             end
             detdStd.(Detfieldnames{iF})(iTarget, iValid) = std(dprimeDetIdx);
             detd.(Detfieldnames{iF})(iTarget, iValid) = mean(dprimeDetIdx);
             detdErr.(Detfieldnames{iF})(iTarget, iValid) = detdStd.(Detfieldnames{iF})(iTarget,iValid)/sqrt(length(subs));
             detcStd.(Detfieldnames{iF})(iTarget, iValid) = std(cDetIdx);
             detc.(Detfieldnames{iF})(iTarget, iValid) = mean(cDetIdx);
             detcErr.(Detfieldnames{iF})(iTarget, iValid) = detcStd.(Detfieldnames{iF})(iTarget,iValid)/sqrt(length(subs));

             disdStd.(Disfieldnames{iF})(iTarget, iValid) = std(dprimeDisIdx);
             disd.(Disfieldnames{iF})(iTarget, iValid) = mean(dprimeDisIdx);
             disdErr.(Disfieldnames{iF})(iTarget, iValid) = disdStd.(Disfieldnames{iF})(iTarget,iValid)/sqrt(length(subs));
             discStd.(Disfieldnames{iF})(iTarget, iValid) = std(cDisIdx);
             disc.(Disfieldnames{iF})(iTarget, iValid) = mean(cDisIdx);
             discErr.(Disfieldnames{iF})(iTarget, iValid) = discStd.(Disfieldnames{iF})(iTarget,iValid)/sqrt(length(subs));

             dprimeDetIdx = [];
             cDetIdx = [];
             dprimeDisIdx = [];
             cDisIdx = [];
         end
     end
 end

 xcoords_SDT = [0.7778 1 1.2222; 1.7778 2 2.22222];


 %% plot detection
 %dprime
 dprimefieldnames = fieldnames(dataAll(iSub).detd);
 critfieldnames = fieldnames(dataAll(iSub).detc);
 shade = [1, .6, .35];
 figure();
 for iDet = 2:numel(dprimefieldnames) % for each condition (all, nontarget present, nontarget absent)
     subplot(2,2,iDet-1)
     for iTarget = 1:2
         for iValid = 1:3
             b = bar(xcoords_SDT(iTarget, iValid), detd.(dprimefieldnames{iDet})(iTarget, iValid));
             kt_figureStyle();
             errorbar(xcoords_SDT(iTarget, iValid),detd.(dprimefieldnames{iDet})(iTarget, iValid),detdErr.(dprimefieldnames{iDet})(iTarget, iValid), '.k', 'MarkerSize',0.1, 'CapSize', 0, 'LineWidth', 1.75)
             if iDet == 2
                 % kt_annotateStats(.89,3.85,'*');
                 % kt_drawBracket(.7778, 1, .99)
                 if iTarget == 1
                     b.FaceColor = fp.blue;
                     b.EdgeColor = fp.blue;
                 elseif iTarget == 2
                     b.FaceColor= fp.orange;
                     b.EdgeColor = fp.orange;
                 end
                 b.FaceAlpha = shade(iValid);
                 b.EdgeAlpha = shade(iValid);
                 b.BarWidth = 0.2;
             elseif iDet == 3
                 % kt_annotateStats(.89,4.2,'**');
                 % kt_drawBracket(.7778, 1, .85)
                 % kt_annotateStats(1,4.5,'***');
                 % kt_drawBracket(.7778, 1.2222, .98)
                 b.FaceColor = [1 1 1];
                 b.EdgeAlpha = shade(iValid);
                 if iTarget == 1
                     b.EdgeColor = fp.blue;
                 elseif iTarget == 2
                     b.EdgeColor = fp.orange;
                 end
                 b.LineWidth = 2;
                 b.BarWidth = 0.18;
                 b.EdgeAlpha = shade(iValid);
             end

         end
     end

     hold on
     % if iDet == 2
     %     kt_annotateStats(.89,3.78,'*');
     %     kt_drawBracket(.7778, 1, .99)
     % elseif iDet == 3
     %     kt_annotateStats(.89,4.2,'**');
     %     kt_drawBracket(.7778, 1, .88)
     %     kt_annotateStats(1,4.7,'***');
     %     kt_drawBracket(.7778, 1.2222, .98)
     % 
     %     kt_annotateStats(1.89,4.35,'*');
     %     kt_drawBracket(1.7778, 1.98, .75)
     %     kt_annotateStats(2.1111,4.05,'*');
     %     kt_drawBracket(2.02, 2.2222, .70)
     %     kt_annotateStats(2,4.8,'***');
     %     kt_drawBracket(1.7778, 2.2222, .82)
     % end

     ylabel("d'")
     ylim([0 5.5])
     ax = gca;
     set(gca, 'ytick', 0:.5:5.5)
     hold on
     xlim([0.5 2.5])
     xticks([0.7778 1 1.222 1.7778 2 2.2222])
     set(gca, 'xticklabel', {'V', 'N', 'I'})

     hold on
     ax = gca;
     ax.XGrid = 'off';
     ax.YGrid = 'off';
 end

% criterion
  for iDet = 2:numel(dprimefieldnames) % for each condition (all, nontarget present, nontarget absent)
     subplot(2,2,iDet+1)
     for iTarget = 1:2
         for iValid = 1:3
             b = bar(xcoords_SDT(iTarget, iValid), detc.(dprimefieldnames{iDet})(iTarget, iValid));
             kt_figureStyle();
             errorbar(xcoords_SDT(iTarget, iValid),detc.(dprimefieldnames{iDet})(iTarget, iValid),detcErr.(dprimefieldnames{iDet})(iTarget, iValid), '.k', 'MarkerSize',0.1, 'CapSize', 0, 'LineWidth', 1.75)
             if iDet == 2
                 if iTarget == 1
                     b.FaceColor = fp.blue;
                     b.EdgeColor = fp.blue;
                 elseif iTarget == 2
                     b.FaceColor= fp.orange;
                     b.EdgeColor = fp.orange;
                 end
                 b.FaceAlpha = shade(iValid);
                 b.EdgeAlpha = shade(iValid);
                 b.BarWidth = 0.2;
             elseif iDet == 3
                 b.FaceColor = [1 1 1];
                 b.EdgeAlpha = shade(iValid);
                 if iTarget == 1
                     b.EdgeColor = fp.blue;
                 elseif iTarget == 2
                     b.EdgeColor = fp.orange;
                 end
                 b.LineWidth = 2;
                 b.BarWidth = 0.18;
                 b.EdgeAlpha = shade(iValid);
             end

         end
     end

     hold on
      ylim([-2.75 2.75])
     % if iDet == 2
     %     kt_annotateStats(1,.05,'***');
     %     kt_drawBracket(.7778, 1.2222, .05)
     %     kt_annotateStats(1.89,.05,'*');
     %     kt_drawBracket(1.7778, 2, .05)
     % elseif iDet == 3
     %     kt_annotateStats(1.1111,.5,'*');
     %     kt_drawBracket(1, 1.2222, 0.75)
     % end

     ylabel('c')
     % ylim([-0.75 0.75])
     ax = gca;
     set(gca, 'ytick', -2.75:2.75)
     hold on
     xlim([0.5 2.5])
     xticks([0.7778 1 1.222 1.7778 2 2.2222])
     set(gca, 'xticklabel', {'V', 'N', 'I'})

     hold on
     ax = gca;
     ax.XGrid = 'off';
     ax.YGrid = 'off';
  end
% 
% [ax1, h1] = suplabel('Non-target Present', 'y', [0.08 0.08 .84 1.325]);
% [ax2, h2] = suplabel('Non-target Absent', 'y', [0.08 0.08 .84 0.375]);
[ax3, h3] = suplabel('Target Absent', 't', [0.08 0.08 1.3 0.9]);
[ax4, h4] = suplabel('Target Present', 't', [0.08 0.08 .45 0.9]);
[ax5, h5] = suplabel('T1', 'tt', [0.08 0.08 .27 0.86]);
[ax6, h6] = suplabel('T2', 'tt', [0.08 0.08 .6 0.86]);
[ax7, h7] = suplabel('T1', 'tt', [0.08 0.08 1.16 0.86]);
[ax8, h8] = suplabel('T2', 'tt', [0.08 0.08 1.49 0.86]);

%% plot discrimination
% dprime
 dprimefieldnames = fieldnames(dataAll(iSub).disd);
 critfieldnames = fieldnames(dataAll(iSub).disc);
 shade = [1, .6, .35];
 figure();
 for iDis = 2:numel(dprimefieldnames) % for each condition (all, nontarget present, nontarget absent)
     subplot(2,2,iDis-1)
     for iTarget = 1:2
         for iValid = 1:3
             b = bar(xcoords_SDT(iTarget, iValid), disd.(dprimefieldnames{iDis})(iTarget, iValid));
             kt_figureStyle();
             errorbar(xcoords_SDT(iTarget, iValid),disd.(dprimefieldnames{iDis})(iTarget, iValid),disdErr.(dprimefieldnames{iDis})(iTarget, iValid), '.k', 'MarkerSize',0.1, 'CapSize', 0, 'LineWidth', 1.75)
             if iDis == 2
                 % kt_annotateStats(.89,3.85,'*');
                 % kt_drawBracket(.7778, 1, .99)
                 if iTarget == 1
                     b.FaceColor = fp.blue;
                     b.EdgeColor = fp.blue;
                 elseif iTarget == 2
                     b.FaceColor= fp.orange;
                     b.EdgeColor = fp.orange;
                 end
                 b.FaceAlpha = shade(iValid);
                 b.EdgeAlpha = shade(iValid);
                 b.BarWidth = 0.2;
             elseif iDis == 3
                 % kt_annotateStats(.89,4.2,'**');
                 % kt_drawBracket(.7778, 1, .85)
                 % kt_annotateStats(1,4.5,'***');
                 % kt_drawBracket(.7778, 1.2222, .98)
                 b.FaceColor = [1 1 1];
                 b.EdgeAlpha = shade(iValid);
                 if iTarget == 1
                     b.EdgeColor = fp.blue;
                 elseif iTarget == 2
                     b.EdgeColor = fp.orange;
                 end
                 b.LineWidth = 2;
                 b.BarWidth = 0.18;
                 b.EdgeAlpha = shade(iValid);
             end

         end
     end

     hold on
     % if iDis == 2
     %     kt_annotateStats(1,2.2,'**');
     %     kt_drawBracket(.7778, 1.2222, .79)
     %       kt_annotateStats(2,2.78,'*');
     %     kt_drawBracket(1.7778, 2.2222, 1.01)
     %  elseif iDis == 3
     %     kt_annotateStats(1,2.75,'*');
     %     kt_drawBracket(.7778, 1.2222, .75)
     % 
     %     kt_annotateStats(2,3.6,'*');
     %     kt_drawBracket(1.7778, 2.2222, .95)
     %     kt_annotateStats(1.89,3.05,'*');
     %     kt_drawBracket(1.7778, 2, .82)
     % 
     % end

     ylabel("d'")
     ylim([-1 1])
     ax = gca;
     set(gca, 'ytick', -1:.5:1)
     hold on
     xlim([0.5 2.5])
     xticks([0.7778 1 1.222 1.7778 2 2.2222])
     set(gca, 'xticklabel', {'V', 'N', 'I'})

     hold on
     ax = gca;
     ax.XGrid = 'off';
     ax.YGrid = 'off';
 end

% criterion
  for iDis = 2:numel(dprimefieldnames) % for each condition (all, nontarget present, nontarget absent)
     subplot(2,2,iDis+1)
     for iTarget = 1:2
         for iValid = 1:3
             b = bar(xcoords_SDT(iTarget, iValid), disc.(dprimefieldnames{iDis})(iTarget, iValid));
             kt_figureStyle();
             errorbar(xcoords_SDT(iTarget, iValid),disc.(dprimefieldnames{iDis})(iTarget, iValid),discErr.(dprimefieldnames{iDis})(iTarget, iValid), '.k', 'MarkerSize',0.1, 'CapSize', 0, 'LineWidth', 1.75)
             if iDis == 2
                 if iTarget == 1
                     b.FaceColor = fp.blue;
                     b.EdgeColor = fp.blue;
                 elseif iTarget == 2
                     b.FaceColor= fp.orange;
                     b.EdgeColor = fp.orange;
                 end
                 b.FaceAlpha = shade(iValid);
                 b.EdgeAlpha = shade(iValid);
                 b.BarWidth = 0.2;
             elseif iDis == 3
                 b.FaceColor = [1 1 1];
                 b.EdgeAlpha = shade(iValid);
                 if iTarget == 1
                     b.EdgeColor = fp.blue;
                 elseif iTarget == 2
                     b.EdgeColor = fp.orange;
                 end
                 b.LineWidth = 2;
                 b.BarWidth = 0.18;
                 b.EdgeAlpha = shade(iValid);
             end

         end
     end

     hold on
      ylim([-0.75 2.75])
     % if iDis == 2
     %     kt_annotateStats(1,.07,'**');
     %     kt_drawBracket(.7778, 1.2222, .2)
     % end 

     ylabel('c')
     % ylim([-0.75 0.75])
     ax = gca;
     set(gca, 'ytick', -0.75:2.75)
     hold on
     xlim([0.5 2.5])
     xticks([0.7778 1 1.222 1.7778 2 2.2222])
     set(gca, 'xticklabel', {'V', 'N', 'I'})

     hold on
     ax = gca;
     ax.XGrid = 'off';
     ax.YGrid = 'off';
  end
% 
% [ax1, h1] = suplabel('Non-target Present', 'y', [0.08 0.08 .84 1.325]);
% [ax2, h2] = suplabel('Non-target Absent', 'y', [0.08 0.08 .84 0.375]);
[ax3, h3] = suplabel('Target Absent', 't', [0.08 0.08 1.3 0.9]);
[ax4, h4] = suplabel('Target Present', 't', [0.08 0.08 .45 0.9]);
[ax5, h5] = suplabel('T1', 'tt', [0.08 0.08 .27 0.86]);
[ax6, h6] = suplabel('T2', 'tt', [0.08 0.08 .6 0.86]);
[ax7, h7] = suplabel('T1', 'tt', [0.08 0.08 1.16 0.86]);
[ax8, h8] = suplabel('T2', 'tt', [0.08 0.08 1.49 0.86]);

