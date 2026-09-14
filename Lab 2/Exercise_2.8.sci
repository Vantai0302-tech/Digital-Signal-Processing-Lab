clc;
close;
clear;

n = -2:1;
x = [1, -2, 3, 6];

n1 = -n;
y1 = x;

n2 = n - 3;
y2 = x;

n3 = -n - 2;
y3 = 2 * x;

// Cua so 1: x(n) va y1(n)
scf(1);
clf();

subplot(2, 1, 1);
plot2d3(n, x, style=color("blue"));
bars = gce();
bars.children.thickness = 4;
title("Signal x(n)");
xlabel("n");
ylabel("x(n)");
a = gca();
a.data_bounds = [-3, -3; 3, 7];
xgrid();

subplot(2, 1, 2);
plot2d3(n1, y1, style=color("red"));
bars = gce();
bars.children.thickness = 4;
title("y1(n) = x(-n)");
xlabel("n");
ylabel("y1(n)");
a = gca();
a.data_bounds = [-3, -3; 3, 7];
xgrid();

// Cua so 2: x(n) va y2(n)
scf(2);
clf();

subplot(2, 1, 1);
plot2d3(n, x, style=color("blue"));
bars = gce();
bars.children.thickness = 4;
title("Signal x(n)");
xlabel("n");
ylabel("x(n)");
a = gca();
a.data_bounds = [-6, -3; 2, 7];
xgrid();

subplot(2, 1, 2);
plot2d3(n2, y2, style=color("red"));
bars = gce();
bars.children.thickness = 4;
title("y2(n) = x(n+3)");
xlabel("n");
ylabel("y2(n)");
a = gca();
a.data_bounds = [-6, -3; 2, 7];
xgrid();

// Cua so 3: x(n) va y3(n)
scf(3);
clf();

subplot(2, 1, 1);
plot2d3(n, x, style=color("blue"));
bars = gce();
bars.children.thickness = 4;
title("Signal x(n)");
xlabel("n");
ylabel("x(n)");
a = gca();
a.data_bounds = [-4, -5; 2, 13];
xgrid();

subplot(2, 1, 2);
plot2d3(n3, y3, style=color("red"));
bars = gce();
bars.children.thickness = 4;
title("y3(n) = 2x(-n-2)");
xlabel("n");
ylabel("y3(n)");
a = gca();
a.data_bounds = [-4, -5; 2, 13];
xgrid();


