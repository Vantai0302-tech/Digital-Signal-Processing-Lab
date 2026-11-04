clc;
close;
clear;

x_n = [1, 2, -3, 2, 1];
h_n = [1, 0, -1];

Nx = length(x_n);
Nh = length(h_n);
Ny = Nx + Nh - 1;

nx = 0:Nx-1;
ny = 0:Ny-1;

// Folding and shifting

y_fold = zeros(1, Ny);

for n = 0:Ny-1
    for k = 0:Nh-1
        j = n - k;

        if (j >= 0 & j < Nx) then
            y_fold(n + 1) = y_fold(n + 1)...
                        + h_n(k + 1)*x_n(j + 1);
        end
    end
end

//Matrix method

H = zeros(Ny, Nx);

for column = 1:Nx;
    for row = 1:Nh;
        H(column + row - 1, column) = h_n(row);
    end
end

y_matrix = (H * x_n')';

// Energy

energy_x  = abs(x_n).^2;
energy_y  = abs(y_fold).^2;

Ex = sum(energy_x);
Ey = sum(energy_y);

disp("Convolution - folding and shifting:");
disp(y_fold);

disp("Convolution matrix H:");
disp(H);

disp("Convolution - matrix method:");
disp(y_matrix);

mprintf("Maximum difference: %g\n", ...
        max(abs(y_fold - y_matrix)));

mprintf("Input energy Ex = %g\n", Ex);
mprintf("Output energy Ey = %g\n", Ey);

scf();

subplot(2, 2, 1);
plot2d3(nx, x_n, style=2);
p = gce();
p.children.thickness = 3;
xtitle("Input x(n)", "n", "Amplitude");
xgrid();

subplot(2, 2, 2);
plot2d3(ny, y_fold, style=5);
p = gce();
p.children.thickness = 3;
xtitle("Output y(n)", "n", "Amplitude");
xgrid();

subplot(2, 2, 3);
plot2d3(nx, energy_x, style=2);
p = gce();
p.children.thickness = 3;
xtitle("Input energy per sample", "n", "|x(n)|^2");
xgrid();

subplot(2, 2, 4);
plot2d3(ny, energy_y, style=5);
p = gce();
p.children.thickness = 3;
xtitle("Output energy per sample", "n", "|y(n)|^2");
xgrid();


