clear;
clc;

Fs = 600;
T = 1/Fs;

F1 = 480*%pi/(2*%pi);
F2 = 720*%pi/(2*%pi);

// a, b
Fnyquist = 2*max([F1 F2]);
Ffold = Fs/2;

mprintf("a) Nyquist sampling rate : %g samples/s\n", Fnyquist);
mprintf("b) Folding frequency     : %g Hz\n", Ffold);

// c
w1 = 2*%pi*F1/Fs;
w2 = 2*%pi*F2/Fs;

mprintf("c) w1/pi                 : %g\n", w1/%pi);
mprintf("   w2/pi                 : %g\n", w2/%pi);
mprintf("   Simplified signal     : x(n) = -2*sin(0.8*pi*n)\n");

// d
F = w1*Fs/(2*%pi);

mprintf("d) Reconstructed freq    : %g Hz\n", F);
mprintf("   Reconstructed signal  : ya(t) = -2*sin(480*pi*t)\n");

// Phan do thi
t = linspace(0, 0.025, 2000);
n = 0:15;

xa = sin(2*%pi*F1*t) + 3*sin(2*%pi*F2*t);
x = sin(w1*n) + 3*sin(w2*n);
ya = -2*sin(2*%pi*F*t);

scf(1);
clf();

subplot(3,1,1);
plot(t, xa);
title("Original signal");
xlabel("t (s)");
ylabel("xa(t)");

subplot(3,1,2);
plot2d3(n, x);
title("Sampled signal");
xlabel("n");
ylabel("x(n)");

subplot(3,1,3);
plot(t, ya);
title("Recovered signal");
xlabel("t (s)");
ylabel("ya(t)");