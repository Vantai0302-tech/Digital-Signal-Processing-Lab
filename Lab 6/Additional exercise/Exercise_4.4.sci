clc;
clear;

x = [3, 2, 1, 0, 1, 2];
N = length(x);

n = -6:11;
xn = [x, x, x];

k = 0:N-1;
C = fft(x)/N;

amp = abs(C);
phase = atan(imag(C), real(C));

for i = 1:N
    if amp(i) < 1e-10 then
        phase(i) = %nan;
    end
end

P_time = sum(x.^2)/N;
P_freq = sum(abs(C).^2);

mprintf("P time = %.6f\n", P_time);
mprintf("P freq = %.6f\n", P_freq);

scf();

subplot(3, 1, 1);
plot2d3(n, xn);
p = gce();
p.children.thickness = 3;
xtitle("Signal", "n", "x(n)");
xgrid();

subplot(3, 1, 2);
plot2d3(k, amp);
p = gce();
p.children.thickness = 3;
xtitle("Magnitude", "k", "|Ck|");
xgrid();

subplot(3, 1, 3);
plot(k, phase, "ro");
p = gce();
p.children.mark_size_unit = "point";
p.children.mark_size = 8;
p.children.mark_foreground = color("red");
p.children.mark_background = color("red");
xtitle("Phase", "k", "Phase (rad)");
xgrid();