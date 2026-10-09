clc;
close;
clear;

function y = x(n)
    y = zeros(1, length(n));

    for i = 1:length(n)
        if n(i) >= 0 & n(i) <= 3 then
            y(i) = 1;
        end
    end
    // (b) System: y(n) = x(n^2)

    scf(0);
    clf();
    plot2d3(n, y, style = 2);
    h = gce();
    h.children.thickness = 3;
    xtitle("(b1) x(n)", "n", "x(n)");
    xgrid();

    // Output
    y1 = zeros(1, length(n));

    for i = 1:length(n)
        if n(i)^2 >= 0 & n(i)^2 <= 3 then
            y1(i) = 1;
        end
    end

    scf(1);
    clf();
    plot2d3(n, y1, style = 3);
    h = gce();
    h.children.thickness = 3;
    xtitle("(b2) y(n) = x(n^2)", "n", "y(n)");
    xgrid();

    // Delayed output
    n_delay = n + 2;
    y2 = y1;

    scf(2);
    clf();
    plot2d3(n_delay, y2, style = 4);
    h = gce();
    h.children.thickness = 3;
    xtitle("(b3) y(n-2)", "n", "y(n-2)");
    xgrid();

    // Delayed input
    n2 = n + 2;
    x2 = y;

    scf(3);
    clf();
    plot2d3(n2, x2, style = 5);
    h = gce();
    h.children.thickness = 3;
    xtitle("(b4) x2(n) = x(n-2)", "n", "x2(n)");
    xgrid();

    // Response to delayed input
    y3 = zeros(1, length(n));

    for i = 1:length(n)
        if n(i)^2 - 2 >= 0 & n(i)^2 - 2 <= 3 then
            y3(i) = 1;
        end
    end

    scf(4);
    clf();
    plot2d3(n, y3, style = 6);
    h = gce();
    h.children.thickness = 3;
    xtitle("(b5) y2(n) = x(n^2-2)", "n", "y2(n)");
    xgrid();

    // (c) System: y(n) = x(n) - x(n-1)

    x_prev = zeros(1, length(n));

    for i = 1:length(n)
        if n(i)-1 >= 0 & n(i)-1 <= 3 then
            x_prev(i) = 1;
        end
    end

    y4 = y - x_prev;

    scf(5);
    clf();
    plot2d3(n, y4, style = 2);
    h = gce();
    h.children.thickness = 3;
    xtitle("(c) y(n) = x(n)-x(n-1)", "n", "y(n)");
    xgrid();

    scf(6);
    clf();
    plot2d3(n_delay, y4, style = 3);
    h = gce();
    h.children.thickness = 3;
    xtitle("(c) y(n-2)", "n", "y(n-2)");
    xgrid();

    x2_n = zeros(1, length(n));
    x2_prev = zeros(1, length(n));

    for i = 1:length(n)
        if n(i) >= 2 & n(i) <= 5 then
            x2_n(i) = 1;
        end

        if n(i)-1 >= 2 & n(i)-1 <= 5 then
            x2_prev(i) = 1;
        end
    end

    y5 = x2_n - x2_prev;

    scf(7);
    clf();
    plot2d3(n, y5, style = 4);
    h = gce();
    h.children.thickness = 3;
    xtitle("(c) y2(n) = x2(n)-x2(n-1)", "n", "y2(n)");
    xgrid();

    // (d) System: y(n) = n*x(n)

    y6 = n .* y;

    scf(8);
    clf();
    plot2d3(n, y6, style = 5);
    h = gce();
    h.children.thickness = 3;
    xtitle("(d) y(n) = n*x(n)", "n", "y(n)");
    xgrid();

    scf(9);
    clf();
    plot2d3(n_delay, y6, style = 6);
    h = gce();
    h.children.thickness = 3;
    xtitle("(d) y(n-2)", "n", "y(n-2)");
    xgrid();

    y7 = n .* x2_n;

    scf(10);
    clf();
    plot2d3(n, y7, style = 2);
    h = gce();
    h.children.thickness = 3;
    xtitle("(d) y2(n) = n*x2(n)", "n", "y2(n)");
    xgrid();
endfunction

n = -8:8;
y = x(n);