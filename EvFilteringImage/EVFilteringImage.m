function [filteredImage] = EVFilteringImage(image)

    filteredImage=zeros(size(image));
    modifyImage = paddingNewMatrix(image);
    [n, m] = size(modifyImage);
    stdev = EvfilterImageStDevHelperFunction(image);
    
    for i= 1:n-2
        for j=1:m-2
            Localwindow=double(zeros(9,1));
            inc=1;
            for a=1:3     
                for b=1:3
                    Localwindow(inc)=modifyImage(a+i-1,b+j-1); %making variational series
                    inc=inc+1;
                end
            end
            
            cval = double(image(i,j)); %get current pixel value
            Localwindow=sort(Localwindow);    %sort to get in ascending order since Ranked filter
            
            EV_series = Localwindow(Localwindow>cval-stdev & Localwindow<cval+stdev); %producing EV series

            mean_EV = mean(EV_series);          % change middle pixel with EV series mean                                                    % Need to remove impulse value and put media         
            filteredImage(i,j)=mean_EV;         % putting our new pixel value in output image
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