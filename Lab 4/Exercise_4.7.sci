clc;
close;
clear;

x_n = [1, 2, -3, 2, 1];

h_n = [1, 0, -1, -1, 1];

N = length(x_n);
M = length(h_n);
n = 0:N-1;

// Folding and shifting

y_fold = zeros(1, N);

for i = 0:N-1
    for k = 0:M-1
        j = pmodulo(i - k, N);

        y_fold(i + 1) = y_fold(i + 1)...
                    + h_n(k + 1)*x_n(j + 1);
    end
end

// Matrix 
H = zeros(N, N);

for i = 0:N-1
    for k = 0:M-1
        j = pmodulo(i - k, N);

        H(i + 1, j + 1) = H(i + 1, j + 1) + h_n(k + 1);
    end
end

y_matrix = (H * x_n')';

// Energy

energy_x = abs(x_n).^2;
energy_y = abs(y_fold).^2;

Ex = sum(energy_x);
Ey = sum(energy_y);

disp("Circular convolution - folding and shifting:");
disp(y_fold);

disp("Circular convolution matrix H:");
disp(H);

disp("Circular convolution - matrix method:");
disp(y_matrix);

mprintf("Maximum difference: %g\n", ...
        max(abs(y_fold - y_matrix)));

mprintf("Input energy per period Ex = %g\n", Ex);
mprintf("Output energy per period Ey = %g\n", Ey);

scf();

subplot(2, 2, 1);
plot2d3(n, x_n, style=2);
p = gce();
p.children.thickness = 3;
xtitle("Input x(n) - One period", "n", "Amplitude");
xgrid();

subplot(2, 2, 2);
plot2d3(n, y_fold, style=5);
p = gce();
p.children.thickness = 3;
xtitle("Output y(n) - One period", "n", "Amplitude");
xgrid();

subplot(2, 2, 3);
plot2d3(n, energy_x, style=2);
p = gce();
p.children.thickness = 3;
xtitle("Input energy per sample", "n", "|x(n)|^2");
xgrid();

subplot(2, 2, 4);
plot2d3(n, energy_y, style=5);
p = gce();
p.children.thickness = 3;
xtitle("Output energy per sample", "n", "|y(n)|^2");
xgrid();