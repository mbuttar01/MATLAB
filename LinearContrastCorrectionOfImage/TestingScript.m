
originalImage = imread('Fig0316b.tif');
%imshow(originalImage);
%[min1, max1, mean, standardDeviation, imageVariance, SNR] = firstFunction (equalizedHistogramImage);
%imshow(originalImage);
%disp (min1);
%disp(max1);
%disp(mean);
%disp(standardDeviation);
%disp(imageVariance);
%disp(SNR);

%plotHistogram = secondFunction(originalImage);

%equalizedHistogramImage = thirdFunction(originalImage);

%imshow(originalImage);

%plotHistogram = secondFunction(equalizedHistogramImage);
   
%imshow(equalizedHistogramImage);

linearContractCorrectedImage = fourthFunction(130, 20, originalImage);

plotHistogram = secondFunction(linearContractCorrectedImage);

%[min1, max1, mean, standardDeviation, imageVariance, SNR] = firstFunction (linearContractCorrectedImage);
%imshow(originalImage);
%disp (min1);
%disp(max1);
%disp(mean);
%disp(standardDeviation);
%disp(imageVariance);
%disp(SNR);

%imshow(linearContractCorrectedImage);
%equalizedHistogramImageee = histeq(originalImage);
%imshow(equalizedHistogramImageee);

