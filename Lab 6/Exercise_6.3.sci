clc;
close;
clear;

w = linspace(-%pi, %pi, 2000);

//Signal 1

X1 = 1 ./ (1 - 0.1*exp(-%i*w));

A1 = abs(X1);
P1 = atan(imag(X1), real(X1));

scf();

subplot(2, 1, 1);
plot(w/%pi, A1, "b");
xtitle("Amplitude spectrum of x1(n)",...
       "Normalized frequency w/pi", "|X1|");
xgrid();

subplot(2, 1, 2);
plot(w/%pi, P1, "r");
xtitle("Phase spectrum of x1(n)",...
       "Normalized frequency w/pi", "Phase (rad)");
xgrid();

//Signal 2
X2 = 1 + exp(-%i*w) + exp(-2*%i*w) + exp(-3*%i*w);

A2 = abs(X2);
P2 = atan(imag(X2), real(X2));

zero_index = find(A2 < 1e-10);
A2(zero_index) = 0;
P2(zero_index) = %nan;

scf();

subplot(2, 1, 1);
plot(w/%pi, A2, "b");
xtitle("Amplitude spectrum of x2(n)", ...
       "Normalized frequency w/pi", "|X2|");
xgrid();

subplot(2, 1, 2);
plot(w/%pi, P2, "r");
xtitle("Phase spectrum of x2(n)", ...
       "Normalized frequency w/pi", "Phase (rad)");
xgrid();