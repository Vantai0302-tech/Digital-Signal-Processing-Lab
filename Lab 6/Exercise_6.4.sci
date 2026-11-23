clc;
close;
clear;

w = linspace(-%pi, %pi, 2001);

H = 1 ./ (1 + 0.1*exp(-%i*w) + 0.2*exp(-2*%i*w));

A = abs(H);
P = atan(imag(H), real(H));

scf();

subplot(2, 1, 1);
plot(w/%pi, A, "b");
xtitle("Amplitude spectrum of h(n)", ...
       "Normalized frequency w/pi", "|H|");
xgrid();

subplot(2, 1, 2);
plot(w/%pi, P, "r");
xtitle("Phase spectrum of h(n)", ...
       "Normalized frequency w/pi", "Phase (rad)");
xgrid();