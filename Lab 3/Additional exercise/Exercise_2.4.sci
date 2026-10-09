clc;
close;
clear;

function y = x(n)
    y = zeros(1, length(n));

    for i = 1:length(n)
        if (n(i) >= -2 & n(i) <= 2) then
            y(i) = n(i) + 4;
        end
    end

    y_fold = y($:-1:1);

    y_even = (y + y_fold)/2;
    y_odd = (y - y_fold)/2;
    y_sum = y_even + y_odd;

    // Original
    scf(0);
    clf();
    plot2d3(n, y, style = 2);
    h = gce();
    h.children.thickness = 3;
    a = gca();
    xtitle("x(n)", "n", "x(n)");
    xgrid();

    // Even
    scf(1);
    clf();
    plot2d3(n, y_even, style = 3);
    h = gce();
    h.children.thickness = 3;
    a = gca();
    xtitle("x_e(n)", "n", "x_e(n)");
    xgrid();

    // Odd
    scf(2);
    clf();
    plot2d3(n, y_odd, style = 4);
    h = gce();
    h.children.thickness = 3;
    a = gca();
    xtitle("x_o(n)", "n", "x_o(n)");
    xgrid();

    scf(3);
    clf();
    plot2d3(n, y_sum, style = 5);
    h = gce();
    h.children.thickness = 3;
    a = gca();
    xtitle("x_e(n) + x_o(n)", "n", "x(n)");
    xgrid();

    mprintf("Reconstruction error: %g\n", max(abs(y - y_sum)));
endfunction

n = -4:4;
y = x(n);