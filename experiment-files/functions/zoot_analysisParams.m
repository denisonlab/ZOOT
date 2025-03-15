function p = zoot_analysisParams

%% Figure styling
p.style.sz              = 100; % scatterplot marker size
p.style.szSml           = 30; % scatterplot marker size (subjects)
p.style.alpha           = 0.6; % scatterplot marker transparency
p.style.xBufferContrast = 0.015; % 0.005; % buffer for x limits for contrast
p.style.xOffset         = 0.15; % offset for group error bars
% colorblind safe palette
p.style.attColors       = [197 77 51; % invalid (red)
    0 0 0; % neutral (black)
    81 160 215; % valid (blue)
    113 112 183]/255; % difference (purple)
p.style.attColorsMuted  = [214 131 112;
    97 97 97;
    133 188 227]/255;
p.style.attColorsMutedLight = [214 162 147;
    128 128 128;
    166 204 246;
    178 178 219]/255;
p.style.attColorsExtraLight = [230 192 170;
    195 195 195;
    199 230 246]/255;
p.style.greyColor      = [0.9 0.9 0.9];
p.style.labelColors    = [0.9 0.9 0.9]; % light grey
p.style.figHeight      = 700; 
p.style.errCapSize     = 0; 
p.style.fitLineWidth   = 2; % fit line width 
