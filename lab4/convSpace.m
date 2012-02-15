function [ convI ] = convSpace( I, h )
%CONVSPACE is a wrapper function to handle images with multiple bands
%   This function calls convSpaceSingle for each band of an image and then
%   recombines the image on output.

if (ndims(I) == 3)
    convI = zeros(size(I), 'uint8');
    convI(:,:,1) = convSpaceSingle(I(:,:,1), h);
    convI(:,:,2) = convSpaceSingle(I(:,:,2), h);
    convI(:,:,3) = convSpaceSingle(I(:,:,3), h);
else
    convI = convSpaceSingle(I,h);
end


end

