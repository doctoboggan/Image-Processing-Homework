function [ convI ] = convFreq( I, h )
%CONVFREQSINGLE returns the convolution of image I and weight matrix h. 
%   It performs the convolution by multiplying the fourrier transforms of I
%   and h and then taking the inverse transform of the result. size(I) must
%   be greater than size(h)

if (ndims(I) == 3 && ndims(h) == 3)
    convI = zeros(size(I), 'uint8');
    convI(:,:,1) = convFreqSingle(I(:,:,1), h(:,:,1));
    convI(:,:,2) = convFreqSingle(I(:,:,2), h(:,:,2));
    convI(:,:,3) = convFreqSingle(I(:,:,3), h(:,:,3));
elseif (ndims(I) == 3 && ndims(h) ==1)
    convI = zeros(size(I), 'uint8');
    convI(:,:,1) = convFreqSingle(I(:,:,1), h);
    convI(:,:,2) = convFreqSingle(I(:,:,2), h);
    convI(:,:,3) = convFreqSingle(I(:,:,3), h);
else
    convI = convFreqSingle(I,h);
end


end

