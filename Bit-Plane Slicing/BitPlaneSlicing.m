img = imread("D:\BT22ECI007\Bit-Plane Slicing\LenaImageProcessing.jpg");

if size(img,3) == 3
    img = rgb2gray(img);
end

[r,c] = size(img);
bit_plane = cell(1,8);

for k=1:8
    bit_plane{k} = bitget(img,k);
end

figure;
subplot(3, 3, 1);
imshow(img);
title('Original Image');

for k = 1:8
    subplot(3, 3, k+1);
    imshow(logical(bit_plane{k}));
    title(['Bit Plane ', num2str(k)]);
end