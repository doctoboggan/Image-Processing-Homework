function [ J ] = grayErode( I, Z )
%GRAYERODE Performs the binary erode operation on I with structuring element
%Z
%   This function simply calles the binary dilate function with the
%   compliment of I and Z flipped as arguments and then compliments the
%   output. This is equal to the erode function


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

%Compliment I and flip Z
Icomp = uint8(double(I)*-1 + 255);
Zflip = rot90(Z,2);

%The output of the dilate is the compliment of the answer we are seeking
Jcomp = grayDilate(Icomp, Zflip);

%Set the compliment as the output
J = uint8(double(Jcomp)*-1 + 255);

end

