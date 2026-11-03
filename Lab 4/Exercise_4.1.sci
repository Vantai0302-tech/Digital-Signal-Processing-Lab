clc;
close;
clear;

n = -2:2;
x_n = [2, -1, 2, -3, 4];

z = poly(0, "z");

p = 0;
for i = 1:length(x_n)
    p = p + x_n(i) * z^(2-n(i));
end

Xz = p/z^2;

disp("Z transform X(z):");
disp(Xz);

disp("ROC: 0 < |z| < infinity");

scf();

plot2d3(n, x_n, style = 1);
h = gce();
h.children.thickness = 3;
a = gca();
a.data_bounds = [-3, -4; 3, 5];
xtitle("Input signal x(n)", "n", "x(n)");
xgrid();
