clc;
close;
clear;

function y = x(n)
    y = zeros(1, length(n));
    for i = 1 : length(n)
        if (n(i) >= -3 && n(i) <= -1) then
            y(i) = 1 + n(i)/3;
        elseif (n(i) >= 0 && n(i) <= 3) then
            y(i) = 1;
        else 
            y(i) = 0;
        end
    end

// a) The original signal
scf(0);
clf()
plot2d3(n, y, style = 1);
h = gce();
h.children.thickness = 3;
a = gca();
xtitle("Original signal x(n)","n","x(n)");
xgrid();
// b.1) Fold and then delay the signal
n_fold1 = -n($:-1:1);
y_fold1 = y($:-1:1);

n_delay1 = n_fold1 + 4;
y_delay1 = y_fold1;

scf(1);
clf()
plot2d3(n_delay1, y_delay1, style = 2);
h = gce();
h.children.thickness = 3;
a = gca();
xtitle("Signal x(-n + 4)","n","x(-n + 4)");
xgrid();
// b.2) Delay and then fold the signal
n_delay2 = n + 4;
y_delay2 = y; 
n_fold2 = -n_delay2($:-1:1);
y_fold2 = y_delay2($:-1:1);

scf(2);
clf()
plot2d3(n_fold2, y_fold2, style = 3);
h = gce();
h.children.thickness = 3;
a = gca();
xtitle("Signal x(-n - 4)","n","x(-n - 4)");
xgrid();
// c) Sketch the signal x(-n+4)
scf(3);
clf()
plot2d3(n_delay1, y_delay1, style = 4);
h = gce();
h.children.thickness = 3;
a = gca();
xtitle("Signal x(-n + 4)","n","x(-n + 4)");
xgrid();

endfunction 
n = -10:10;
y = x(n);
