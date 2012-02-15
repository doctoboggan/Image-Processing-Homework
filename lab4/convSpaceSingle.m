function [ convI ] = convSpaceSingle( I, hh )
%convI = convSpaceSingle(I,h)
%   This function takes an image I and a weight matrix h and performs the
%   convolution in the space domain using the shift-multiply-accumulate
%   approach. The is a helper function that only operates on 1 band

[m n] = size(hh);
cpad = floor(n/2);
rpad = floor(m/2);

[h w] = size(I);
%Build the padded matrix
padded = zeros(h+2*rpad, w+2*cpad, 'double');

%loop over every element in the kernel
for i=1:m
    for j=1:n
        %perform the scaled sum
        padded(i:i+h-1, j:j+w-1) = padded(i:i+h-1, j:j+w-1) + double(I)*double(hh(i,j));
    end
end

%return the padded image cropped and normalized
convI = uint8(padded(rpad+1:end-rpad,cpad+1:end-cpad)/sum(hh(:)));

end

