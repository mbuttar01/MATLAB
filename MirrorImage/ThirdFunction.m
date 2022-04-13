
function [outputimage] = secondAssignmentThirdFunc(image, kernelMask)

    [k, l] = size(kernelMask);      %get our size for our kernel mask
    [p, q] = size(image);           %get our size for the image inputted
    m=floor(k/2);                   % get floored value of kernel mask rows
    n=floor(l/2);                   % get floored value of kernel mask columns
    
    addZeroRow=size(kernelMask,1)-1;            %need to pad the rows with zeroes for the pixel windows
    addZeroColumn=size(kernelMask,2)-1;           %need to pad the rows with zeroes for the pixel windows
    outputimage=double(zeros(size(image)));     %converting to double
    
    modifyImage=zeros(p+addZeroRow,q+addZeroColumn);
    sizerow=size(modifyImage,1)-addZeroRow;
    sizeColumn=size(modifyImage,2)-addZeroColumn;


     for i=1:p
         for j=1:q
            modifyImage(i+m,j+n)=image(i,j);        %based on kernel we move our image
         end
     end

    for i=1:sizerow
        for j=1:sizeColumn
            sum=0;
            m=i;
            n=j;
            for x=1:k
              for y=1:l
                   sum = sum+(modifyImage(m,n)*kernelMask(x,y));%here trying to calulate the w from the expression
                   n =n+1;                    
              end
                 n=j;
                m=m+1;
            end
            outputimage(i,j)= sum;
        end
    end
    
    
end
     
   
