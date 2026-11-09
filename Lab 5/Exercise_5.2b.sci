clc;
close;
clear;

// Bien doi Z
z = poly(0, "z");

X1 = z / (z - 1/5);
X2 = z / (z - 2);
Yz = X1 * X2;

// Tim he so 
ab = [1, 1; 2, 1/5] \ [1; 0];

a = a(1);
b = b(2);

// Hien thi theo dang mu am
mprintf("Y(z) = 1/((1 - 0.2*z^(-1))*(1 - 2*z^(-1)))\n");
mprintf("A = %g, B = %g\n", a, b);
mprintf("y(n) = [-(1/9)*(1/5)^n + (10/9)*2^n]*u(n)\n");
mprintf("ROC: |z| > 2\n");

// Tinh cac mau tu ket qua Z nguoc
n = -5:5;
yn = zeros(1, length(n));

for i = 1:length(n)
    if n(i) >= 0 then
        yn(i) = a*(1/5)^n(i) + b*2^n(i);
    end
end

disp("Output samples for n = 0, 1, ..., 5:");
disp(yn(find(n >= 0)));

// Ve dau ra
scf();
plot2d3(n, yn, style=5);
p = gce();
p.children.thickness = 3;
a = gca();
a.data_bounds = [-5, -1; 5, max(yn)+2];
a.y_location = "origin";
xtitle("Output y(n)", "n", "y(n)");
xgrid();