clc;
close;
clear;

atomsLoad("IPCV");

img = imread("C:/DSP/Lab 4/input.jpg");

gray = rgb2gray(img);

// Histogram display
H = imhist(gray);

scf();
imshow(img);
xtitle("Original image");

scf();
imshow(gray);
xtitle("Grayscale image");

// Histogram equalization

equalization = imhistequal(gray);
H_equalization = imhist(equalization);

scf();
imshow(equalization);
xtitle("Equalization");

scf();

subplot(2, 1, 1);
plot(0:255, matrix(H, 1, -1));
xtitle("Histogram before equalization", "Gray level", "Pixels");
xgrid();

subplot(2, 1, 2);
plot(0:255, matrix(H_equalization, 1, -1));
xtitle("Histogram after equalization", "Gray level", "Pixels");
xgrid();

// Blur
kernel = ones(9, 9) / 81;
blur = imfilter(img, kernel);

scf();
imshow(blur);
xtitle("Blur image - 9x9 average filter");


// Watermarking
scf();
watermark = imaddtext(img, "DSP LAB 4",...
                    20, 30, 5, 6, "white");
scf();
imshow(watermark);
xtitle("Image with watermark");
