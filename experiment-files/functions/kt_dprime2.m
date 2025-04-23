function [dprime, criterion] = kt_dprime2(nh,nfa,nsignal,nnoise,loglinear)
% [dprime, criterion] = kt_dprime(nh,nfa,nsignal,nnoise,loglinear)
%
% nh = number of hit trials
% nfa = number of false alarm trials
% nsignal = number of signal trials
% nnoise = number of noise trials

% correctionType is string of type of correction to apply for extreme rates
% (0 or 1) 
% options include: 
% 'loglinear'
% 'over2N'

%% Check inputs
if nargin <5 
    loglinear = 0; 
end

%% 
% adjust for ceiling or floor values
% nh(nh==nsignal) = nsignal(nh==nsignal)-1;
% nh(nh==0) = 1;
% nfa(nfa==nnoise) = nnoise(nfa==nnoise)-1;
% nfa(nfa==0) = 1;

switch correctionType
    case loglinear % (Stanislaw & Todorov 1999; Macmillan 2022
        % applied to all trials per MacMillan (2022) textboook
        % less bias and more predictable effects
        nh = nh + 0.5;
        nfa = nfa + 0.5;
        nnoise = nnoise + 1;
        nsignal = nsignal + 1;
    case over2N % Macmillan & kaplan 1985
        % applied to only extreme rates
        % calculate rates
        h = nh./nsignal;
        fa = nfa./nnoise;
        if h==0 || h==1 || fa==0 || fa==1 % if any extremes
            %%%% 
            % Jenny add correction here
            %%%%
        end
end

end

% recalculate proportions
h = nh./nsignal;
fa = nfa./nnoise;

% adjustment = 0.01; 
% % adjust for ceiling or floor values 
% if h==1
%     h = 1-adjustment; 
% end
% if fa==1
%     fa = adjustment; 
% end 
% 
% if h==0
%     h = adjustment; 
% end
% if fa==0
%     h = 1-adjustment; 
% end

% dprime
zh = norminv(h,0,1); zfa = norminv(fa,0,1);

dprime = zh - zfa;
criterion = -0.5*(zh+zfa);