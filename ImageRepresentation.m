clc
clear all
close all

rgbImage = imread('D:\BT22ECI007\rs.jpg'); 

redChannel = rgbImage;
redChannel(:, :, 2) = 0;  
redChannel(:, :, 3) = 0;  

imshow(redChannel);
title('Red Color Channel');

Igr = redChannel(:,:,1);
imshow(Igr)