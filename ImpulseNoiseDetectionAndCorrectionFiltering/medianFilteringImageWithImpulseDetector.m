function [filteredImage] = medianFilteringImageWithImpulseDetector(image, r, s)

    filteredImage=zeros(size(image));

    modifyImage = paddingNewMatrix(image); 
    n = size(modifyImage,1);
    m = size(modifyImage,2); 
    
    for i= 1:n-2
        for j=1:m-2
                                                                    %below code will keep making variational series for all the                                                                  %pixels;
            Localwindow=zeros(9,1);
            inc=1;
            for a=1:3                                               %looking at 3x3 values close to this particular pixel 
                for b=1:3
                Localwindow(inc)=modifyImage(i+a-1,j+b-1);          %making variational series
                    inc=inc+1;
                end
            end
            
            centerValue = Localwindow(5);                           %getting the value 5 for the window of interest for this pixel
            
            SortingForMedian=sort(Localwindow); 
            
              cVI = find(centerValue); 
              
              if(cVI > 1)
                  sizeOfcVI= size(cVI);
                  rankInInterval = 0;
                  temp = 0;
                  for incre = 1:size(cVI)
                      
                        if (cVI(incre) > r && cVI(incre) < (sizeOfcVI-r))
                                cVI(cVI == cVI(incre)) = [];
                        end
                                                                                        % Need to sort in ascending order
                        rankInInterval = find(Localwindow(cVI)) - 5;  
                        if(rankInInterval > temp && cVI > 1)           % we want the lowest value to be closest to median
                             cVI(cVI == cVI(incre)) = [];
                        end                                    %getting distance from mean
                        temp = rankInInterval;                 %holds old value of rank to compare if it is more it is discarded
                                                       % need to create loop
                                                      % over the elements
                  end
              end                                     % found if cvi more than 1, need to compare indexes
                                                      % where which index is located closer to the end of the r interval                                                                     
                                                      %finding center value index to check later
            
            median = Localwindow(5);
            
                                                                    %Need to check here if the pixel of interest satisfies our detector conditions
                                                                    %what i need is the center value in the new 
            sizeOfLw = size(Localwindow);
            incr = 1;
            flag = 0; 
                                                                     %maybe i will have to put a while loop here that goes on until or maybe
            
            for c=1:size(Localwindow)                                 %need to find a way to see which side is closer to median
                
                    if (cVI > r && cVI < (sizeOfLw-r))
                        break;
                    end
                    if(cVI < median)
                        if((Localwindow(cVI) - Localwindow(cVI + 1) > s)) %subtracted from some value close to median
                                                                    % find if index is less than end value (9)-r and its also
                                                                    % less than first value 1 + r
                            flag = 1;
                        else 
                            continue;
                        end
                        
                    else
                        if((Localwindow(cVI) - Localwindow(cVI - 1) > s)) %subtracted from some value close to median
                                                                    % find if index is less than end value (9)-r and its also                                                                    % less than first value 1 + r
                            flag = 1;
                            break;
                        else 
                            continue;
                        end
                    end
                        
                   incr = incr+1;
            end
            
            if(flag == 1)
                filteredImage(i,j)=SortingForMedian(5);         % median value would be 9/2, rounded to 5 for 9 since integer
            else 
                continue;
            end
            
        end
    end
    
    filteredImage=uint8(filteredImage);

        
    function modifyImage = paddingNewMatrix(image)
        modifyImage=zeros(size(image)+2); 
            for x=1:size(image,1)
                for y=1:size(image,2)
                    modifyImage(x+1,y+1)=image(x,y);
                end
            end
    end

end   