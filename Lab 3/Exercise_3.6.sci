clc;
close;
clear;

function [yn, yorigin] = convolution (xn, xorigin, hn, horigin)
    nx = length(xn);
    nh = length(hn);
    
    yn = zeros(1, nx + nh - 1);

    for i = 1:nx
        for j = 1:nh
            yn(i+j-1) = yn(i+j-1) + xn(i)*hn(j);
        end
    end

    yorigin = xorigin + horigin -  1;
    
    nx = (1:nx) - xorigin;
    nh = (1:nh) - horigin;
    ny = (1: length(yn)) - yorigin;

    nmin = min([nx, nh, ny]) - 1;
    nmax = max([nx, nh, ny]) + 1;
    vmin = min([0, xn, hn, yn]) - 1;
    vmax = max([0, xn, hn, yn]) + 1;

    scf();

    subplot(3, 1, 1);
    plot2d3(nx, xn, style=1);
    h = gce();
    h.children.thickness = 3;
    a = gca();
    a.data_bounds = [nmin, vmin; nmax, vmax];
    xtitle("Input signal x(n)", "n", "x(n)");
    xgrid();

    subplot(3, 1, 2);
    plot2d3(nh, hn, style=2);
    h = gce();
    h.children.thickness = 3;
    a = gca();
    a.data_bounds = [nmin, vmin; nmax, vmax];
    xtitle("Impulse response h(n)", "n", "h(n)");
    xgrid();

    subplot(3, 1, 3);
    plot2d3(ny, yn, style=5);
    h = gce();
    h.children.thickness = 3;
    a = gca();
    a.data_bounds = [nmin, vmin; nmax, vmax];
    xtitle("Convolution y(n) = x(n) * h(n)", "n", "y(n)");
    xgrid();
endfunction