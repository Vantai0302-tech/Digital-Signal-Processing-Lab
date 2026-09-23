clear;
clc;

Rb = 10000;
L = 1024;

F1 = 600*%pi/(2*%pi);
F2 = 1800*%pi/(2*%pi);

// a
b = log2(L);
Fs = Rb/b;
T = 1/Fs;
Ffold = Fs/2;

mprintf("a) Bits per sample             : %g\n", b);
mprintf("   Sampling frequency (Hz)     : %g\n", Fs);
mprintf("   Folding frequency (Hz)      : %g\n", Ffold);

// b
Fnyquist = 2*max([F1 F2]);
mprintf("b) Nyquist sampling rate       : %g samples/s\n", Fnyquist);

// c
w1 = 2*%pi*F1/Fs;
w2 = 2*%pi*F2/Fs;

mprintf("c) w1/pi                       : %g\n", w1/%pi);
mprintf("   w2/pi                       : %g\n", w2/%pi);
mprintf("   After folding               : x(n) = 3*cos(0.6*pi*n) + 2*cos(0.2*pi*n)\n");

// d
Xmax = 3 + 2;
Xmin = -Xmax;
Delta = (Xmax - Xmin)/(L - 1);

mprintf("d) Quantization resolution (V) : %g\n", Delta);

// Vẽ đồ thị
t = linspace(0, 0.02, 2000);
n = 0:20;

xa = 3*cos(2*%pi*F1*t) + 2*cos(2*%pi*F2*t);
x = 3*cos(w1*n) + 2*cos(w2*n);

scf(2);
clf();

subplot(2,1,1);
plot(t, xa);
title("Original signal");
xlabel("t (s)");
ylabel("xa(t)");

subplot(2,1,2);
plot2d3(n, x);
title("Sampled signal");
xlabel("n");
ylabel("x(n)");