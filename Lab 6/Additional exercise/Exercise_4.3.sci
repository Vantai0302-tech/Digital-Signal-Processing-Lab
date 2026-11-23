clc;
close;
clear;

function s = sincN(v)
    if v == 0 then
        s = 1;
    else
        s = sin(%pi*v)/(%pi*v);
    end
endfunction

function y = triangle(t, tau)
    if abs(t) <= tau then
        y = 1 - abs(t)/tau;
    else
        y = 0;
    end
endfunction

tau = 1;
Tp = 4;

F = linspace(-5, 5, 1001);

for i = 1:length(F)
    X(i) = tau*sincN(F(i)*tau)^2;
    P(i) = 0;

    if X(i) < 1e-12 then
        P(i) = %nan;
    end
end

scf();

subplot(2, 1, 1);
plot(F, X);
xtitle("Magnitude", "F (Hz)", "|Xa(F)|");
xgrid();

subplot(2, 1, 2);
plot(F, P);
xtitle("Phase", "F (Hz)", "Phase (rad)");
xgrid();

t = linspace(-Tp, Tp, 2001);

for i = 1:length(t)
    xp(i) = triangle(t(i)+Tp, tau) ...
          + triangle(t(i), tau) ...
          + triangle(t(i)-Tp, tau);
end

k = -10:10;

for i = 1:length(k)
    ck(i) = (tau/Tp)*sincN(k(i)*tau/Tp)^2;
end

disp("Fourier coefficients [k, ck]:");
disp([k', ck]);

scf();
plot(t, xp);
xtitle("Periodic signal", "t (s)", "xp(t)");
xgrid();