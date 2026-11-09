clc;
close;
clear;

// Câu a
x1 = [1 2 3 4 5];
x2 = [1, 1, 1];

X1 = poly(x1, "q", "coeff");
X2 = poly(x2, "q", "coeff");

Y = X1 * X2;

yn = coeff(Y);
n = 0:length(yn)-1;

// Hien thi ket qua
mprintf("Here q represents z^(-1).\n");

disp("X1(z):");
disp(X1);

disp("X2(z):");
disp(X2);

mprintf("Y(z) = %g", yn(1));

for i = 2:length(yn)
    mprintf(" %+g*z^(-%d)", yn(i), i-1);
end

mprintf("\n");

disp("Output y(n), starting at n = 0:");
disp(yn);

mprintf("ROC of Y(z): |z| > 0\n");

scf();
plot2d3(n, yn, style=5);
p = gce();
p.children.thickness = 3;
a = gca();
a.data_bounds = [-1, -1; 7, 13];
xtitle("Convolution y(n) = x1(n) * x2(n)", ... 
"n", "y(n)");
xgrid();