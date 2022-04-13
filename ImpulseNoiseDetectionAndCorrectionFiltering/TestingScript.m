
originalImage = imread('Fig0316b4.tif');

%imshow(originalImage);

noisyImage = addRandomImpulseNoisec(originalImage, 10);

%imshow(noisyImage);
RIDMedianFilteredImage = medianFilteringImageWithImpulseDetector(noisyImage, 2, 10);

imshow(RIDMedianFilteredImage);

%firstImage
%secondImage

%[RMSE, PSNR] = compareRMSEandPSNRvalues(firstImage, secondImage);

%disp(RMSE);
%disp(PSNR);