
function[noisyImage] = addSAndPNoise(image, pCorruption)
    
    modifiedImage = image;
    Pimage=255*pCorruption/100;  %calculating how much image to corrupt
    noisyImage = modifiedImage; %Make new Matrix by copying image
    newMatrix = randi([0,255],size(image,1),size(image,2)); %Getting random values 
    noisyImage(newMatrix <= Pimage/Pimage) = 0;          %And black values
    noisyImage(newMatrix > Pimage/2 & newMatrix < Pimage) = 255;  %Add white and outputting salt and peppered image

end

