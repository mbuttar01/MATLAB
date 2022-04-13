
originalImage = imread('Fig0316b3.tif');


%imshow(originalImage);

%I_noisy = imnoise(originalImage, 'gaussian', 0, 0.1);
%imshow(I_noisy);

%gaussianNoiseImage = originalImage;
gaussianNoiseImage = secondAssingmentSecondFunc(originalImage, 3.46);

%[RMSE, PSNR] = secondAssignmentFirstFunc(originalImage, gaussianNoiseImage);

%disp(RMSE);
%disp(PSNR);
%imshow(gaussianNoiseImage);

firstKernel = [1 1 1;1 1 1;1 1 1;];
firstKernel = (1/9) *firstKernel;

secondKernel = [1 2 1; 2 4 2; 1 2 1;];
secondKernel = (1/16) *secondKernel;

gaussianNoiseImage = mirrorImage(gaussianNoiseImage, secondKernel);

linearFilteredImage = secondAssignmentThirdFunc(gaussianNoiseImage, secondKernel);

[RMSE, PSNR] = secondAssignmentFirstFunc(originalImage, linearFilteredImage);

disp(RMSE);
disp(PSNR);

%imshow(linearFilteredImage);

