clc
clear all
close all

img = imread('D:\BT22ECI007/8x8 image gray scale.png');
if size(img, 3) == 3, img = rgb2gray(img); end
img = img(1:8, 1:8);
figure;

subplot(2, 3, 1), imshow(img, []), title('Original');
subplot(2, 3, 2), imhist(uint8(img)), title('Original Histogram');
img_eq = histeq(uint8(img));

subplot(2, 3, 3), imshow(img_eq, []), title('Equalized');
subplot(2, 3, 4), imhist(uint8(img_eq)), title('Equalized Histogram');
subplot(2, 3, 5), plot(cumsum(imhist(img))/numel(img), 'r', 'LineWidth', 2);
hold on, plot(cumsum(imhist(img_eq))/numel(img_eq), 'b', 'LineWidth', 2);
