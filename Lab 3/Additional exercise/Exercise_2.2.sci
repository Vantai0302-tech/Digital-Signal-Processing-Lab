clc;
close;
clear;

function y = x(n)
    y = zeros(1, length(n));

    for i = 1:length(n)
        if (n(i) >= -1 && n(i) <= 2)
            y(i) = 1;
        elseif (n(i) == 3 | n(i) == 4) 
            y(i) = 1/2;
        else 
            y(i) = 0;
        end
    end
    // a) Signal x(n - 2)
    n1 = n + 2;
    y1 = y;

    scf(0);
    clf()
    plot2d3(n1, y1, style = 1);
    h = gce();
    h.children.thickness = 3;
    a = gca();
    xtitle("a) x(n - 2)","n","y1(n)");
    xgrid();

    // b) Signal x(4 - n)
    n_fold = -n($:-1:1);
    y_fold = y($:-1:1);

    n2 = n_fold + 4;
    y2 = y_fold;

    scf(1);
    clf()
    plot2d3(n2, y2, style = 2);
    h = gce();
    h.children.thickness = 3;
    a = gca();
    xtitle("b) x(4 - n)","n","y2(n)");
    xgrid();

    // c) Signal x(n + 2)
    n3 = n - 2;
    y3 = y;

    scf(2);
    clf()
    plot2d3(n3, y3, style = 3);
    h = gce();
    h.children.thickness = 3;
    a = gca();
    xtitle("a) x(n + 2)","n","y3(n)");
    xgrid();

    // d) Signal x(n)u(2 - n)
    y4 = y.*bool2s(n <= 2);

    scf(3);
    clf()
    plot2d3(n, y4, style = 4);
    h = gce();
    h.children.thickness = 3;
    a = gca();
    xtitle("d) x(n)u(2-n)","n","y4(n)");
    xgrid();

    // e) Signal x(n - 1)delta(n - 3)
    n5 = n + 1;
    y5 = y .* bool2s(n5 == 3);

    scf(4);
    clf()
    plot2d3(n5, y5, style = 5);
    h = gce();
    h.children.thickness = 3;
    a = gca();
    xtitle("e) x(n - 1)delta(n - 3)","n","y5(n)");
    xgrid();

    // f) Signal x(n^2)
    y6 = zeros(1, length(n));

    for i = 1:length(n) 
        p = find(n == n(i)^2);

        if size(p, "*") > 0 then
            y6(i) = y(p(1));
        end
    end

    scf(5);
    clf()
    plot2d3(n, y6, style = 6);
    h = gce();
    h.children.thickness = 3;
    a = gca();
    xtitle("f) x(n^2)","n","y6(n)");
    xgrid();

    // g) Even part of x(n)
    y7 = (y + y_fold)/2;

    scf(6);
    clf()
    plot2d3(n, y7, style = 9);
    h = gce();
    h.children.thickness = 3;
    a = gca();
    xtitle("Even part of x(n)","n","y7(n)");
    xgrid();

    // h) Odd part of x(n)
    y8 = (y - y_fold)/2;

    scf(7);
    clf()
    plot2d3(n, y8, style = 9);
    h = gce();
    h.children.thickness = 3;
    a = gca();
    xtitle("Odd part of x(n)","n","y8(n)");
    xgrid();
endfunction

n = -8:8;
y = x(n);
