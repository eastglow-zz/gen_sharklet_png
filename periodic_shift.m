%Loading a new picture
Xc = imread('SharkletRef035.png');
[sizex sizey sizez]= size(Xc);

%Creating a canvas
blank = zeros(sizex,sizey,sizez,class(Xc));

%Setting the new center
xc = 89;
yc = 110;

x0 = int16(0.5*(sizex - 1)) + 1;
y0 = int16(0.5*(sizey - 1)) + 1;

for i=1:sizex
    for j=1:sizey
        itry = i + (x0 - xc);
        if (itry > sizex)
            inew = itry - (sizex - 1);
        elseif (itry < 1)
            inew = itry + (sizex - 1);
        else
            inew = itry;
        end
        
        jtry = j + (y0 - yc);
        if (jtry > sizey)
            jnew = jtry - (sizey - 1);
        elseif (jtry < 1)
            jnew = jtry + (sizey - 1);
        else
            jnew = jtry;
        end
        
        for d=1:3
            blank(i,j,d)=Xc(inew,jnew,d);
        end
    end
end

image(uint8(blank));
fname = ['periodic_shift_pic.png'];
imwrite(blank, fname);

