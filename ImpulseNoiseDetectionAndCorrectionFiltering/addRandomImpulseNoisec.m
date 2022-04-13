
function[noisyImage] = addRandomImpulseNoisec(image, pCorruption)

    I = im2double(image); %creating a double of image
    pCorruption = pCorruption/100; %changing to percent 
    noisyImage = (I + pCorruption*rand(size(I)))/(1+pCorruption);
    
end
