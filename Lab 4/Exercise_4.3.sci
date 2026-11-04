clc;
close;
clear;

z = poly(0, "z");

X1 = z / (z - 0.5);
X2 = -z / (z - 0.9);
Xz = X1 + X2;

mprintf("Z-transform X(z):\n");
mprintf("X(z) = 1/(1 - 0.5*z^(-1)) - 1/(1 - 0.9*z^(-1))\n");
mprintf("ROC: 0.5 < |z| < 0.9\n");

n = -10:10;
x_n = zeros(1, length(n));

for i = 1:length(n)
    if n(i) >= 0 then
        x_n(i) = 0.5^n(i);
    else
        x_n(i) = 0.9^n(i);
    end
end

scf();

plot2d3(n, x_n, style = 3);
h = gce();
h.children.thickness = 3;
a = gca();
a.data_bounds = [-11, -0.2; 11, max(x_n)+0.5];
xtitle("x(n) = 0.5^n u(n) + 0.9^n u(-n-1)", "n", "x(n)");
xgrid();