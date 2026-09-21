// Task 1
f0 = 50;
T0 = 0.02;

t = linspace(0, 5*T0, 100);

xa = 3*sin(2*%pi*f0*t);
disp("Task 1:");
plot(t, xa);
/*
// Task 2 
    Ta có: fs = 300 samples/s => Tính được Ts = 1/Fs = 1/300 s
    sau đó thế vào phương trình sóng ta có được phương trình x(n) = 3sin(pi/3 * n);

// Task 3
    Với phương trình x(n) = 3sin(pi/3 * n) ta tìm periodic property bằng cách thấy Ω0 = pi/3
    Sau đó kiểm tra xem tín hiệu này có tuần hoàn không bằng cách lấy (pi/3)/(2pi) xem có ra một
    số hữu tỷ không, ta thấy bằng 1/6 thì đây là tín hiệu tuần hoàn.
    Từ đó ta tìm periodic property bằng cách tìm chu kỳ nhỏ nhất N0 = 6 samples
    Tìm tần số của phương trình x(n): với f0 = 1/6 * 300 = 50 Hz
    Tìm chu kỳ của phương trình x(n): với T0 = N0 * Ts = 6/300 = 0.02s
    Muốn vẽ 5 periods 
*/
clf();

subplot(3,1,2);

N0 = 6;

n = 0:(5*N0-1);

xn = 3*sin(%pi*n/3);

plot2d3(n, xn, style=2);

xtitle("x[n] = 3sin(pi*n/3)", "n", "x[n]");

xgrid();

Delta = 0.1;

xq = Delta * int(xn / Delta);

subplot(3,1,3);
plot2d3(n, xq, style=2);
xtitle("Quantized signal xq[n]", "n", "xq[n]");