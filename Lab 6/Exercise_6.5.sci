clc;
close;
clear;

w = linspace(-%pi, %pi, 2001);

// Fourier transform cua dau vao 
X = 1 ./ (1 - 0.5*exp(-%i*w));
H = 1 + exp(-%i*w);

// Fourier transform cua dau ra
Y = H .* X;

A = abs(Y);
P = atan(imag(Y), real(Y));

zero_index = find(A < 1e-10);
A(zero_index) = 0;
P(zero_index) = %nan;

mprintf("Y(w) = (1 + exp(-j*w))/(1 - 0.5*exp(-j*w))\n");
mprintf("y(n) = (0.5)^n*u(n) + (0.5)^(n-1)*u(n-1)\n");

n = 0:5;
yn = zeros(1, length(n));

for i = 1:length(n)
    if n(i) == 0 then
        yn(i) = 1;
    else
        yn(i) = 3*0.5^n(i);
    end
end

disp("Output samples for n = 0, 1, ..., 5:");
disp(yn);

scf();

subplot(2, 1, 1);
plot(w/%pi, A, "b");
xtitle("Amplitude spectrum of y(n)", ...
       "Normalized frequency w/pi", "|Y|");
xgrid();

subplot(2, 1, 2);
plot(w/%pi, P, "r");
xtitle("Phase spectrum of y(n)", ...
       "Normalized frequency w/pi", "Phase (rad)");
xgrid();