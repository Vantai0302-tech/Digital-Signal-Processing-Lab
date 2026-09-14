clc;
close;
clear;

n = -1:3;
x1 = [0, 0, 1, 3, -2];
x2 = [0, 1, 2, 3, 0];
y = x1 + x2;

subplot(3, 1, 1);
plot2d3(n, x1, style=color("blue"));
bars = gce();
bars.children.thickness = 4;
title("Signal x1");
xlabel("n");
ylabel("x1(n)");
a = gca();
a.data_bounds = [-2, -3; 4, 7];
xgrid();

subplot(3, 1, 2);
plot2d3(n, x2, style=color("green"));
bars = gce();
bars.children.thickness = 4;
title("Signal x2");
xlabel("n");
ylabel("x2(n)");
a = gca();
a.data_bounds = [-2, -3; 4, 7];
xgrid();

subplot(3, 1, 3);
plot2d3(n, y, style=color("red"));
bars = gce();
bars.children.thickness = 4;
title("Signal y");
xlabel("n");
ylabel("y(n)");
a = gca();
a.data_bounds = [-2, -3; 4, 7];
xgrid();





