	
function [outputImage] = fourthFunction(mean2, standardDeviation2, image)

	[n, m] = size(image);                       %getting input image dimensions
    
	outputImage = image;                        %making copy of image for new output image matrix
    
	mean = (sum(outputImage(:)) / (n*m));       %getting mean of current image
    
    totaldifference = (outputImage - mean) .^2;	% dot product for total difference
    
	totalsum = sum(totaldifference(:));         
    
	t = (n*m)-1;
	imageVariance = totalsum/t;                  
    standardDeviation = sqrt(imageVariance);     %stdev of current image
    standardDeviationRatio = standardDeviation2/standardDeviation;
	for n = 1 : n   % iterating through image matrix
		for m = 1 : m  % iterating through image matrix
            
            outputImage(n,m) = (( (image(n,m) * (standardDeviationRatio)) + (mean2 - ((mean*(standardDeviationRatio))))));
		end
	end

end