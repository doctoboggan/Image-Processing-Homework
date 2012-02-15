function output = histMatch(I,J)
%output = histMatch(I,J) matches the histogram of image I as closely as
%possible to image J

Pi = cdfo(I);
Pj = cdfo(J);

LUT = zeros(256,1);
gJ = 0;
for gI = 0:255
    while Pj(gJ +1) < Pi(gJ +1) && gJ < 255 
        gJ = gJ+1
    end
    LUT(gI +1)=gJ;
end

LUT
output = uint8(LUT(I+1));