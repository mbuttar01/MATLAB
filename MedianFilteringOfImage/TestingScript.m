
originalImage = imread('Fig0316b2.tif');

%imshow(originalImage);

%noisyImage = addSAndPNoise(originalImage, 5);

noisyImage = addRandomImpulseNoise(originalImage, 20);
%imshow(noisyImage);


medianFilteredImage = medianFilteringImage(noisyImage); % Applying median filter to image;
%[RMSE, PSNR] = findRMSEandPSNRDiffFunc(originalImage, medianFilteredImage);

%disp(RMSE);
%disp(PSNR);
imshow(medianFilteredImage);
