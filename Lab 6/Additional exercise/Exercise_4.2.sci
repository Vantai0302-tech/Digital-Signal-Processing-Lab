clc;
close;
clear;

A = 1;
a = 1;

if a <= 0 then
    error("a must be greater than 0.");
end

F = linspace(-5, 5, 2001);

Xa = A ./ (a + %i*2*%pi*F);
Xb = (2*A*a) ./ (a^2 + (2*%pi*F).^2);

Ma = abs(Xa);
Pa = atan(imag(Xa), real(Xa));

Mb = abs(Xb);
Pb = atan(imag(Xb), real(Xb));

mprintf("A = %g, a = %g\n", A, a);
mprintf("Xa(F) = A/(a + j*2*pi*F)\n");
mprintf("Xb(F) = 2*A*a/(a^2 + (2*pi*F)^2)\n");

scf();

subplot(2, 2, 1);
plot(F, Ma, "b");
xtitle("(a) Magnitude", "F (Hz)", "|Xa(F)|");
xgrid();

subplot(2, 2, 3);
plot(F, Pa, "r");
xtitle("(a) Phase", "F (Hz)", "Phase (rad)");
xgrid();

subplot(2, 2, 2);
plot(F, Mb, "b");
xtitle("(b) Magnitude", "F (Hz)", "|Xb(F)|");
xgrid();

subplot(2, 2, 4);
plot(F, Pb, "r");
ax = gca();
ax.data_bounds = [-5, -0.5; 5, 0.5];
xtitle("(b) Phase", "F (Hz)", "Phase (rad)");
xgrid();