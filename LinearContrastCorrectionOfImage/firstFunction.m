	
	function [min1, max1, mean, standardDeviation, imageVariance, SNR] = firstFunction (image)

		[n, m] = size(image);          % store image in N x M matrix
        
		A = double(image);                      % converting to double to accomodate variance

		min1 = min(A(:));
		max1 = max(A(:));

		mean = (sum(A(:)) / (n*m));	  % get the mean of the image
		
		totaldifference = (A - mean) .^2;          % obtain variance of image
		totalsum = sum(totaldifference(:)); 
		t = (n*m) - 1;
        
		imageVariance = totalsum/t;

		standardDeviation = sqrt(imageVariance);

		SNR = (mean/standardDeviation);
		

		end
