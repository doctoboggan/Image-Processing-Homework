function [output LUT] = gamma2(I, gma)
%[output LUT] = gamma2(I, gma) adjusts the gamma of image I by gma. The
%look up table is also returned

LUT = (0:255).^(1/gma);
LUT = LUT*255/LUT(end);

if ndims(I) == 2
    loopEnd = 1;
else
    loopEnd = 3;
end

for i=1:loopEnd
    output(:,:,i) = uint8(LUT(I(:,:,i)+1));
end