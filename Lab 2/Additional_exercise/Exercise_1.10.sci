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

disp(b, "a) Bits per sample:");
disp(Fs, "   Sampling frequency (Hz):");
disp(Ffold, "   Folding frequency (Hz):");

// b
Fnyquist = 2*max([F1 F2]);
disp(Fnyquist, "b) Nyquist sampling rate (samples/s):");

// c
w1 = 2*%pi*F1/Fs;
w2 = 2*%pi*F2/Fs;

disp(w1/%pi, "c) w1/pi:");
disp(w2/%pi, "   w2/pi:");
disp("After folding: x(n) = 3*cos(0.6*pi*n) + 2*cos(0.2*pi*n)");

// d
Xmax = 3 + 2;
Xmin = -Xmax;
Delta = (Xmax - Xmin)/(L - 1);

disp(Delta, "d) Quantization resolution Delta (V):");

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