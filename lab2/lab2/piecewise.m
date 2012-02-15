function [output LUT] = piecewise(I, slope)
%LUT = piecewise(I, slope) generates a lookup table LUT where the middle
%third of the intensity values are remapped using the slope supplied. It
%then applies that LUT to the image I and sets it as output

CDF = cdfo(I);
g33 = sum(CDF<(100/3));
g66 = sum(CDF<(200/3));
run = g66 - g33;
rise = (slope-1)*run;

%play with these to slide the pivot points up and down individually
X=0;
Y=0;

pivot1 = (g33-rise/2)+X;
if(pivot1<0)
    pivot1 = 0;
end

pivot2 = (g66+rise/2)+Y;
if(pivot2>255)
    pivot2 = 255;
end

LUT = floor([linspace(0, pivot1, g33) linspace(pivot1, pivot2, g66-g33) linspace(pivot2, 255, 255-g66)]);

if ndims(I) == 2
    loopEnd = 1;
else
    loopEnd = 3;
end

for i=1:loopEnd
    output(:,:,i) = uint8(LUT(I(:,:,i)+1));
end