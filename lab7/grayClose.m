function [ J ] = grayClose( I, Z )
%GRAYCLOSE performs the grayscale close on the grayscale image I
%   A gray close is a dilation using Z flipped followed by an erosion
%   using Z flipped

%Check to see if a preset SE was selected
if Z==8
    Z = [0 0 0; ...
        0 0 0;...
        0 0 0];
elseif Z==4
    Z = [inf 0 inf;...
        0 0 0;...
        inf 0 inf];
elseif sum(sum(Z=='L')) || sum(sum(Z=='l'))
    Z = [0 inf;...
        0 inf;...
        0 0];
end

%Flip Z
Zflip = rot90(Z,2);

J = grayErode(grayDilate(I, Zflip), Zflip);


end

