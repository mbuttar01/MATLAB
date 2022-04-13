function [standardDeviation] = EvfilterImageStDevHelperFunction(image)

    [n, m] = size(image);	% store image in N x M matrix
    A = double(image);	% converting to double to accomodate variance
    mean = (sum(A(:)) / (n*m));	  % get the mean of the image
    totaldifference = (A - mean) .^2;	% obtain variance of image
    totalsum = sum(totaldifference(:));
    t = (n*m)-1;
    imageVariance = totalsum/t;
    standardDeviation = sqrt(imageVariance);

end