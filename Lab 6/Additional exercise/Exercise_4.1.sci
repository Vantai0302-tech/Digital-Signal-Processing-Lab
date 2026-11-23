clc;
close;
clear;

A = 1;
tau = 1;
F0 = 1/tau;

t = linspace(-tau, 2*tau, 3001);
xa = A * abs(sin(%pi*t/tau));

Kplot = 10;
k = -Kplot:Kplot;
F = k * F0;

Ck = (-2*A/%pi) ./ (4*k.^2 - 1);

amplitude = abs(Ck);

power_lines = abs(Ck).^2;

P_exact = A^2/2;

tp = linspace(0, tau, 10001);
xp = A * abs(sin(%pi*tp/tau));

dt = tp(2) - tp(1);
xp2 = xp.^2;

P_time = dt/tau * (sum(xp2) ...
         - 0.5*xp2(1) - 0.5*xp2($));

Kcheck = 1000;
kc = -Kcheck:Kcheck;

Cc = (-2*A/%pi) ./ (4*kc.^2 - 1);
P_frequency = sum(abs(Cc).^2);

relative_error = abs(P_time - P_frequency)/P_exact;

mprintf("A = %g, tau = %g s, F0 = %g Hz\n", A, tau, F0);
mprintf("P exact = %.6f\n", P_exact);
mprintf("P time  = %.6f\n", P_time);
mprintf("P freq  = %.6f\n", P_frequency);
mprintf("Relative error = %.3e\n", relative_error);

scf();

subplot(3, 1, 1);
plot(t, xa, "b");
xtitle("Rectified sine", "t (s)", "x(t)");
xgrid();

subplot(3, 1, 2);
plot2d3(F, amplitude, style=2);
p = gce();
p.children.thickness = 3;
xtitle("Amplitude spectrum", "F (Hz)", "|Ck|");
xgrid();

subplot(3, 1, 3);
plot2d3(F, power_lines, style=5);
p = gce();
p.children.thickness = 3;
xtitle("Power spectrum", "F (Hz)", "|Ck|^2");
xgrid();