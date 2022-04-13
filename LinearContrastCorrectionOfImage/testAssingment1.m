
image = imread('Fig0316b.tif');

[min, max, mean, standardDeviation, imageVariance, SNR] = firstFunction(image);

imshow(image);
%disp(min);
%disp(max);
disp("mean is: " + mean);
disp("standard Deviation is: " + standardDeviation);
disp("Variance is: " + imageVariance);
disp("Signal-to-Noise ratio is: " + SNR);

[levels, intensityCount] = secondFunction(image);
%mean2 = ;
%standardDeviation2 = ;
%[A] = fourthFunction(mean2, standardDeviation2, image);

%imshow(A);