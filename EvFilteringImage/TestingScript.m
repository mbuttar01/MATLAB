
originalImage = imread('Fig0316b5.tif');

%I_noisy = addGaussianNoiseForEvFilterTestImage(originalImage, 0.1);
%imshow(I_noisy);

%[ C ] = mirrorImage(I_noisy,3);

%EV_filtered = EVFilteringImage(C);

[RMSE, PSNR] = findRMSEandPSNRDiffFuncc(originalImage, EV_filtered);

disp(RMSE);
disp(PSNR);

%imshow(EV_filteredd);


