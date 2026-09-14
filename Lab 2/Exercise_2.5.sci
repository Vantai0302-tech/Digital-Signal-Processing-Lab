clc;
close;
clear;

n = -1:1;
x = [1 3 -2];


xr = x($:-1:1);

// Even component
x_e = (x + xr) / 2;

// Odd component
x_o = (x - xr) / 2;

// Tin hieu ban dau
subplot(3, 1, 1);
plot2d3(n, x, style=color("blue"));
bars = gce();
bars.children.thickness = 4;
title("Original signal x(n)");
xlabel("n");
ylabel("x(n)");
xgrid();
a = gca();
a.data_bounds = [-2, -2.5; 2, 3.5];
xgrid();

// Thanh phan le
subplot(3, 1, 2);
plot2d3(n, x_o, style=color("forestgreen"));
bars = gce();
bars.children.thickness = 4;
title("Odd component x_o(n)");
xlabel("n");
ylabel("x_o(n)");
xgrid();
a = gca();
a.data_bounds = [-2, -2; 2, 2];
xgrid();

// Thanh phan chan
subplot(3, 1, 3);
plot2d3(n, x_e, style=color("red"));
bars = gce();
bars.children.thickness = 4;
title("Even component x_e(n)");
xlabel("n");
ylabel("x_e(n)");
xgrid();
a = gca();
a.data_bounds = [-2, -1; 2, 3.5];
xgrid();




