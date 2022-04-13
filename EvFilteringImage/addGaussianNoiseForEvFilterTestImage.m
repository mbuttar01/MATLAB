
function [noisyImage] = addGaussianNoiseForEvFilterTestImage(image, standardDeviation)
    
    image = im2double(image);
    noisyImage = image + standardDeviation*randn(size(image));
    
end