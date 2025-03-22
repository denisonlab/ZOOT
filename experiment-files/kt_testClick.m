

x = -8*pi:pi/100:8*pi; 

y = sin(x); 

y2 = sin(x)./x; 

yfft = abs(fft(y)); 
yfft2 = abs(fft(y2)); 

%% Generate click 
Fs = 44100;                                             % Sampling Frequency (Hz)
t = linspace(0, 10*Fs, 10*Fs)/Fs;                       % Time Vector (s)
s = sin(2*pi*(t-5)*5000)./(2*pi*(t-5)*5000);   

sfft = abs(fft(s)); 

%% 
figure
hold on 
plot(y)
plot(y2)
