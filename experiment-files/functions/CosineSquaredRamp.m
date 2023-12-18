function sig = CosineSquaredRamp(x,points)
% from Christopher Conroy, BU
if (points > length(x)/2)
    error('Number of points must be less than half the length of array.')
else
    sig = x;
    for k=1:points
        wk = 0.5*(1-cos(k*pi/points));
        sig(k) = wk*sig(k);
        sig(length(sig)-k+1) = wk*sig(length(sig)-k+1);
    end
end