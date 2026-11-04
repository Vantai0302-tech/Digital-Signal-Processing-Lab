clc;
close;
clear;

atomsLoad("IPCV");

img = imread("C:/DSP/Lab 4/input.jpg");

gray = rgb2gray(img);

H = imhist(gray);

scf();
imshow(img);
xtitle("Original image");

scf();
imshow(gray);
xtitle("Grayscale image");

scf();
plot(0:255, matrix(H, 1, -1));
xtitle("Grayscale histogram", "Gray level", "Pixels");
xgrid();