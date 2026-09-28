clc;
close;
clear;


function [yn, yorigin] = fold (xn, xorigin)
    N = length(xn);
    yn = xn($:-1:1);
    yorigin = N + 1 - xorigin;

    nx = (1:N) - xorigin;
    ny = (1:N) - yorigin;

    nmin = min([nx, ny]) - 1;
    nmax = max([nx, ny]) + 1;
    vmin = min([0, xn]) - 1;
    vmax = max([0, xn]) + 1;

    scf();

    subplot(2, 1, 1);
    plot2d3(nx, xn, style = 1);
    h = gce();
    h.children.thickness = 3;
    a = gca();
    a.data_bounds = [nmin, vmin; nmax, vmax];
    xtitle("Original signal x(n)", "n", "x(n)");
    xgrid();

    subplot(2, 1, 2);
    plot2d3(ny, yn, style = 2);
    h = gce();
    h.children.thickness = 3;
    a = gca();
    a.data_bounds = [nmin, vmin; nmax, vmax];
    xtitle("Folding signal y(n) = x(-n)", "n", "y(n)");
    xgrid();
endfunction

