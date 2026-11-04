clc;
close;
clear;

x_n = [1, 2, -3, 2, 1];
h_n = [1, 0, 1];

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
        H(coulumn + row - 1, column) = h_n(row);
    end
end

y_matrix = (H * x_n')';

// Energy

energy_x  = abs(x_n).^2;
energy_y  = abs(y_fold).^2;

Ex = sum(energy_x);
Ey = sum(energy_y);


