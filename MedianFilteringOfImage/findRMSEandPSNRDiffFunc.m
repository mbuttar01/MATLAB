
function [RMSE, PSNR] = findRMSEandPSNRDiffFunc(firstImage, secondImage)

    [N, M] = size(firstImage);
    squaredErrorImage = (double(firstImage) - double(secondImage)) .^ 2;
    MSE = sum(sum(squaredErrorImage)) / (N * M);
    RMSE = sqrt(MSE);
    PSNR = 20 * log10(256-1 / RMSE);

end