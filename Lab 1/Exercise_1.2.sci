clc;
close;
clear;

// ======================================
// Task 1: Analog signal
// ======================================

f0 = 50;
T0 = 1/f0;

t = linspace(0, 5*T0, 1000);
xa = 3*sin(2*%pi*f0*t);

// ======================================
// Task 2 & 3: Sampling
// ======================================

Fs = 300;
Ts = 1/Fs;

N0 = 6;
n = 0:(5*N0 - 1);

xn = 3*sin(%pi*n/3);

// ======================================
// Task 4: Quantization
// ======================================

Delta = 0.1;
xq = Delta*fix(xn/Delta);

// ======================================
// Plot all signals in one window
// ======================================

clf();

// --------------------------------------
// Analog signal - RED
// --------------------------------------
subplot(3,1,1);

plot(t, xa, "r");

title("Analog signal x_a(t)");
xlabel("Time t (s)");
ylabel("Amplitude");

// --------------------------------------
// Discrete-time signal - BLUE
// --------------------------------------
subplot(3,1,2);

plot2d3(n, xn, style=color("blue"));

title("Discrete-time signal x(n)");
xlabel("Sample index n");
ylabel("Amplitude");

// --------------------------------------
// Quantized signal - GREEN
// --------------------------------------
subplot(3,1,3);

plot2d3(n, xq, style=color("green"));

title("Quantized signal x_q(n)");
xlabel("Sample index n");
ylabel("Amplitude");