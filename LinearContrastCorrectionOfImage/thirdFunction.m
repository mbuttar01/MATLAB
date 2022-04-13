	
function[equalizedHistogram] = thirdFunction(image)

    n = size(image,1);                          %size of rows
    m = size(image,2);                          %size of columns
    outputMatrix=zeros(256,1);
    counter=0;
    noOfPossibleValues=255;
    
    totalNumberP=n*m;                                         %rows * columns give total 
    equalizedHistogram = uint8(zeros(n,m));                  %doesn't seem to work without 
    frequencyOfPixels=zeros(256,1);                          %need to find frequency of each pixel value
    probabilityOfPixelOccurrence=zeros(256,1);               %need to find value that occurs most to spread more evenly
    probc=zeros(256,1);
    
    cumProbability=zeros(256,1);                

    for i=1:n
        for j=1:m
            PoI = image(i,j);                               %pixel of interest here
            frequencyOfPixels(PoI+1)= frequencyOfPixels(PoI+1)+1;  %setting up frequencies
            probabilityOfPixelOccurrence(PoI+1) = frequencyOfPixels(PoI+1)/totalNumberP; %setting probabilities
        end
    end
   

    for i=1:size(probabilityOfPixelOccurrence)               %going through probabilities to apply function
       counter = counter + frequencyOfPixels(i);             %increasing counter with value of frequencies of pixel 
                                                               %intensity
                                                               %occurences
       cumProbability(i) = counter;
       probc(i) = cumProbability(i) / totalNumberP;            %values divided amongst all values for probability
       outputMatrix(i) = round(probc(i) * noOfPossibleValues);
    end 

    for i=1:n
        for j=1:m
                equalizedHistogram(i,j)=outputMatrix(image(i,j)+1); %now adding to the new equalized histogram image
        end
    end
    
end
