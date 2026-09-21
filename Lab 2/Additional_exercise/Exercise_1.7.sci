clc;
close;
clear;

// Cau a
Fmax = 10000;
F_Nyquist = 2*Fmax;
mprintf("Cau a: Fs > %.0f Hz\n", F_Nyquist);

Fs = 8000;
t = 0:0.000001:0.002;
n = 0:16;
ts = n/Fs;

// Minh hoa hien tuong chong pho voi tin hieu 5 kHz
F1 = 5000;
Fa1 = abs(F1 - Fs);
x1 = cos(2*%pi*F1*t);
xa1 = cos(2*%pi*Fa1*t);
x1n = cos(2*%pi*F1*ts);
mprintf("Cau b: Tan so alias = %.0f Hz\n", Fa1);

subplot(2, 1, 1);
plot(t*1000, x1, "b-");
plot(t*1000, xa1, "r--");
plot2d3(ts*1000, x1n, style=color("forestgreen"));
bars = gce();
bars.children.thickness = 2;
legend(["Tin hieu 5 kHz"; "Alias 3 kHz"; "Mau tai Fs = 8 kHz"], "out_upper_right");
xtitle("Hien tuong chong pho: F = 5 kHz, Fs = 8 kHz", "t (ms)", "Bien do");
xgrid();

// Minh hoa hien tuong chong pho voi tin hieu 9 kHz
F2 = 9000;
Fa2 = abs(F2 - Fs);
x2 = cos(2*%pi*F2*t);
xa2 = cos(2*%pi*Fa2*t);
x2n = cos(2*%pi*F2*ts);
mprintf("Cau c: Tan so alias = %.0f Hz\n", Fa2);

subplot(2, 1, 2);
plot(t*1000, x2, "b-");
plot(t*1000, xa2, "r--");
plot2d3(ts*1000, x2n, style=color("forestgreen"));
bars = gce();
bars.children.thickness = 2;
legend(["Tin hieu 9 kHz"; "Alias 1 kHz"; "Mau tai Fs = 8 kHz"], "out_upper_right");
xtitle("Hien tuong chong pho: F = 9 kHz, Fs = 8 kHz", "t (ms)", "Bien do");
xgrid();
