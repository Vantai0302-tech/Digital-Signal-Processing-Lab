Fs = 8000;
t = (0:Fs-1)/Fs;
x = 0.5*sin(2*%pi*440*t);
wavwrite(x, Fs, "tone440.wav");
[y, Fs_read] = wavread("tone440.wav");
playsnd(y, Fs_read);