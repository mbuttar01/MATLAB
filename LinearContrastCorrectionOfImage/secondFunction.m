	
	function [levels, pixelIntensityOccurrence] = secondFunction(image)

                                                % need to count the number of pixels with each 
                                                % intensity value to calculate the histogram of the 
                                            	% gray-scale image

	[n, m] = size(image);                       % store image in N x M matrix
	pixelIntensityOccurrence = 1:256; % setup array to count number of intensity occurences: 256-1 = 255
	freqOfPixels = 0;

	for i = 1 : 256                             % iterating through the intensity occurrence calculator to record occurences
		for x = 1 : n                           % iterating through image matrix
			for y = 1 : m                       % iterating through image matrix
				if image(x, y) == i-1
					freqOfPixels = freqOfPixels+1;
				end
			end
		end

	pixelIntensityOccurrence(i) = freqOfPixels; % set occurence value of that intensity value
	freqOfPixels = 0;                           % reset to 0 for next intensity value
	end

	levels = 0 : 255;
	bar(levels, pixelIntensityOccurrence);
	xlabel('pixelIntensity');
	ylabel('pixelIntensityOccurrence');
	title('Histogram');
	grid on;

	end