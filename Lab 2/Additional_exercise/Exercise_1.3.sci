clear;
clc;

t = linspace(0, 4, 2000);
n = 0:64;

// a
Omega = 5;
T0 = 2*%pi/Omega;
xa = 3*cos(Omega*t + %pi/6);

mprintf("a) Periodic: T0 = 2*pi/5 = %.6f s\n", T0);

scf(1);
clf();
plot(t, xa, "b-");
title("(a) Periodic: T0 = 2*pi/5 s");
xlabel("t (s)");
ylabel("xa(t)");
xgrid();

// b
xb = 3*cos(5*n + %pi/6);

disp("b) Non-periodic: 5/(2*pi) is irrational.");

scf(2);
clf();
plot2d3(n, xb, style=color("red"));
title("(b) Non-periodic");
xlabel("n");
ylabel("x(n)");
xgrid();

// c
xc = 2*exp(%i*(n/6 - %pi));

disp("c) Non-periodic: 1/(12*pi) is irrational.");

scf(3);
clf();

subplot(2,1,1);
plot2d3(n, real(xc), style=color("purple"));
title("(c) Real part - Non-periodic");
xlabel("n");
ylabel("Re[x(n)]");
xgrid();

subplot(2,1,2);
plot2d3(n, imag(xc), style=color("orange"));
title("(c) Imaginary part - Non-periodic");
xlabel("n");
ylabel("Im[x(n)]");
xgrid();

// d
xd = cos(n/8).*cos(%pi*n/8);

disp("d) Non-periodic: x(N) = x(0) requires N = 8*k*pi.");
disp("   No positive integer N satisfies this condition.");

scf(4);
clf();
plot2d3(n, xd, style=color("forestgreen"));
title("(d) Non-periodic");
xlabel("n");
ylabel("x(n)");
xgrid();

// e
w1 = %pi/2;
w2 = %pi/8;
w3 = %pi/4;

N1 = 2*%pi/w1;
N2 = 2*%pi/w2;
N3 = 2*%pi/w3;
N0 = lcm([N1 N2 N3]);

xe = cos(w1*n) - sin(w2*n) + 3*cos(w3*n + %pi/3);

mprintf("e) Periodic: N0 = LCM(%.0f, %.0f, %.0f) = %.0f samples\n", ..
        N1, N2, N3, N0);

scf(5);
clf();
plot2d3(n, xe, style=color("brown"));
title("(e) Periodic: N0 = 16 samples");
xlabel("n");
ylabel("x(n)");
xgrid();