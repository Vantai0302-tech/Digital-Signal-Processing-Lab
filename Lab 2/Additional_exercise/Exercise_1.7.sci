clc;
close;
clear;

// Part a
Fmax = 10000;
F_Nyquist = 2*Fmax;
mprintf("a: Fs > %.0f Hz\n", F_Nyquist);

Fs = 8000;
t = 0:0.000001:0.002;
n = 0:16;
ts = n/Fs;

// Aliasing of a 5 kHz signal
F1 = 5000;
Fa1 = abs(F1 - Fs);

x1 = cos(2*%pi*F1*t);
xa1 = cos(2*%pi*Fa1*t);
x1n = cos(2*%pi*F1*ts);

mprintf("b: Alias frequency = %.0f Hz\n", Fa1);

subplot(2, 1, 1);
plot(t*1000, x1, "b-");
plot(t*1000, xa1, "r--");
plot2d3(ts*1000, x1n, style=color("forestgreen"));

bars = gce();
bars.children.thickness = 2;

legend(["5 kHz signal"; "3 kHz alias"; "Samples at Fs = 8 kHz"], "out_upper_right");
xtitle("Aliasing: F = 5 kHz, Fs = 8 kHz", "t (ms)", "Amplitude");
xgrid();

// Aliasing of a 9 kHz signal
F2 = 9000;
Fa2 = abs(F2 - Fs);

x2 = cos(2*%pi*F2*t);
xa2 = cos(2*%pi*Fa2*t);
x2n = cos(2*%pi*F2*ts);

mprintf("c: Alias frequency = %.0f Hz\n", Fa2);

subplot(2, 1, 2);
plot(t*1000, x2, "b-");
plot(t*1000, xa2, "r--");
plot2d3(ts*1000, x2n, style=color("forestgreen"));

bars = gce();
bars.children.thickness = 2;

legend(["9 kHz signal"; "1 kHz alias"; "Samples at Fs = 8 kHz"], "out_upper_right");
xtitle("Aliasing: F = 9 kHz, Fs = 8 kHz", "t (ms)", "Amplitude");
xgrid();