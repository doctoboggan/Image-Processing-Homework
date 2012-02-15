function [ J ] = binClose( I, Z )
%BINCLOSE performs the binary close on the binary image I
%   A binary close is a dilation using Z flipped followed by an erosion
%   using Z flipped

%Check to see if a preset SE was selected
if Z==8
    Z = [255 255 255; ...
        255 255 255;...
        255 255 255];
elseif Z==4
    Z = [0 255 0;...
        255 255 255;...
        0 255 0];
elseif sum(sum(Z=='L')) || sum(sum(Z=='l'))
    Z = [255 0;...
        255 0;...
        255 255];
end

%Flip Z
Zflip = rot90(Z,2);

J = binErode(binDilate(I, Zflip), Zflip);


end

