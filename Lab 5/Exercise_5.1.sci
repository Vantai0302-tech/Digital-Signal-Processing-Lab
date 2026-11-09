clc;
close;
clear;


n = -10:10;

xn = zeros(1, length(n));

for i = 1:length(n)
    if n(i) == 0 then
        xn(i) = 1;
    end
end

hn = zeros(1, length(n));

for i = 1:length(n)
    if n(i) >= 0 then
        hn(i) = xn(i);

        if i > 2 then
            hn(i) = hn(i) + hn(i-2);
        end
    end
end

disp("Impulse response h(n):");
disp(hn);

scf();

plot2d3(n, hn, style=5);
p = gce();
p.children.thickness = 3;
a = gca();
a.data_bounds = [-10, -0.2; 10, 1.2];
a.y_location = "origin";
xtitle("Impulse response h(n)", "n", "h(n)");
xgrid();