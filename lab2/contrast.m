function [output, LUT] = contrast(I, slope, midpoint)
%[output LUT] = contrast(I, slope, midpoint) remaps the contrast of the 
%image using a lookup table created with the slope and midpoint provided. 
%The lookup table is also returned

x = 0:255;
rawTable = slope*(x-midpoint)+127;
lessThanOne = rawTable<1;
greaterThan255 = rawTable>255;
setToZero = rawTable.*not(lessThanOne).*not(greaterThan255);
LUT = setToZero + greaterThan255*255;

if ndims(I) == 2
    loopEnd = 1;
else
    loopEnd = 3;
end

for i=1:loopEnd
    output(:,:,i) = uint8(LUT(I(:,:,i)+1));
end