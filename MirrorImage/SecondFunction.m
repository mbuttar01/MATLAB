
function [noisyImage] = secondAssingmentSecondFunc(image, standardDeviation)

    image = im2double(image);
    [n, m] = size(image);
     mean = (sum(image(:)) / (n*m));	 
    noisyImage = image + (standardDeviation*randn(size(image))) - mean;
    
end

