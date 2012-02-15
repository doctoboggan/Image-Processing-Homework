function [ convI ] = convFreqSingle( I, h )
%CONVFREQSINGLE returns the convolution of image I and weight matrix h. 
%   This is a helper function that only operates on one band.

h_padded = zeros(size(I),'double');
[m n] = size(h);
[r c] = size(I);
if (sum(h(:)) == 0)
    hsf = 1;
else
    hsf = double(sum(h(:)));
end
h_padded(ceil(r/2-m/2)+1:ceil(r/2-m/2)+m, ceil(c/2-n/2)+1:ceil(c/2-n/2)+n) = double(h)/hsf;

inner = ifft2(fft2(double(I)).*fft2(ifftshift(h_padded)));

convI = (real(inner));

end

