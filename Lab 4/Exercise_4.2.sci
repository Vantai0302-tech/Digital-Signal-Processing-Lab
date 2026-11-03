clc;
close;
clear;

z = poly(0, "z");

X1 = z/(z - 0.5);
X2 = z/(z - 0.4);
Xz = X1 + X2;

mprintf("Z-transform X(z):\n");
mprintf("X(z) = 1/(1 - 0.5*z^(-1)) + 1/(1 - 0.4*z^(-1))\n");
mprintf("ROC: |z| > 0.5\n");

n = -5:20;
x_n = zeros(1, length(n));

for i = 1:length(n)
    if n(i) >= 0 then
        x_n(i) = 0.5^n(i) + 0.4^n(i);
    end 
end

scf();

plot2d3(n, x_n, style = 2);
h = gce();
h.children.thickness = 3;
a = gca();
a.data_bounds = [-5, -0.2; 20, 2.2];
xtitle("x(n) = 0.5^n u(n) + 0.4^n u(n)", "n", "x(n)");
xgrid();

