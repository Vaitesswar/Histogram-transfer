%% Histogram Transfer

I2 = imread('pout.PNG');
I1 = imread('bright_flower.PNG');
TransIm = histTransfer(I1,I2); % Transfer histogram of image 1 to image 2

figure('Name','Image 2 (Original)','NumberTitle','off');
imshow(I2)
figure('Name','Image 2 (Transformed)','NumberTitle','off');
imshow(TransIm)
figure('Name','Image 1','NumberTitle','off');
imshow(I1)