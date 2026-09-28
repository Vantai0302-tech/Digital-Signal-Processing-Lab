clc;
clear;
close;

function [yn, yorigin] = multi (x1n, x1origin, x2n, x2origin) 
    n1 = (1:length(x1n)) - x1origin;
    n2 = (1:length(x2n)) - x2origin;

    n_begin = min([n1, n2]);
    n_end = max([n1, n2]);
    n = n_begin:n_end;
    x1 = zeros(1, length(n));
    x2 = zeros(1, length(n));

    x1(n1 - n_begin + 1) = x1n;
    x2(n2 - n_begin + 1) = x2n;

    yn = x1 .* x2;
    yorigin = 1 - n_begin;

    vmin = min([0, x1, x2, yn]) - 1;
    vmax = max([0, x1, x2, yn]) + 1;

    scf();

    subplot(3, 1, 1);
    plot2d3(n, x1, style=1);
    h = gce();
    h.children.thickness = 3;
    a = gca();
    a.data_bounds = [n_begin-1, vmin; n_end+1, vmax];
    xtitle("Signal x1(n)", "n", "x1(n)");
    xgrid();

    subplot(3, 1, 2);
    plot2d3(n, x2, style=2);
    h = gce();
    h.children.thickness = 3;
    a = gca();
    a.data_bounds = [n_begin-1, vmin; n_end+1, vmax];
    xtitle("Signal x2(n)", "n", "x2(n)");
    xgrid();

    subplot(3, 1, 3);
    plot2d3(n, yn, style=5);
    h = gce();
    h.children.thickness = 3;
    a = gca();
    a.data_bounds = [n_begin-1, vmin; n_end+1, vmax];
    xtitle("y(n) = x1(n).x2(n)", "n", "y(n)");
    xgrid();
endfunction