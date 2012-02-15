function [ J ] = QuantImg( I, n )
%QUANTIMG takes an image I and returns a quantized version down to n bits.
%   I should be a true color image and n should be an interger between 1
%   and 7


J = zeros(size(I), 'uint8');

%Check if 1 or 3 band image
dims = ndims(I);
if (dims == 3)
    loop = 3;
else
    loop = 1;
end

%Do the quantizing
for i = 1:loop
    J(:,:,i) = uint8(floor(double(I(:,:,i)/(2^(8-n))))*(2^(8-n)));
end


end

