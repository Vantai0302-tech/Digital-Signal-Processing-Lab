clc;
close;
clear;

n = -5:5;

for i = 1 : length(n) 
    if (n(i) >= 0) then 
        ur(i) = n(i);
    else 
        ur(i) = 0;
    end
end

plot2d3(n, ur);
xtitle("Unit ramp signal", "n", "ur(n)");
xgrid();



