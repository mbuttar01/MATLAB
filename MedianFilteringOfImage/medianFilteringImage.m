function [filteredImage] = medianFilteringImage(image)

    filteredImage=zeros(size(image));
    modifyImage = paddingNewMatrix(image);
    [n, m] = size(modifyImage);
    
    for i= 1:n-2
        for j=1:m-2
            Localwindow=zeros(9,1);
            inc=1;
            for a=1:3     
                for b=1:3
                    Localwindow(inc)=modifyImage(i+a-1,j+b-1); %making variational series
                    inc=inc+1;
                end
            end
            
            CalculatingMedian=sort(Localwindow);             % Need to remove impulse value and put median
            
            filteredImage(i,j)=CalculatingMedian(5);         % median value would be 9/2, rounded to 5 since integer
        end
    end
    filteredImage=uint8(filteredImage);

        
    function modifyImage = paddingNewMatrix(image)
        [o ,p] = size(image);
        modifyImage=zeros(size(image)+2); 
            for x=1:o
                for y=1:p
                    modifyImage(x+1,y+1)=image(x,y);
                end
            end
    end

end