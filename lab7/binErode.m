function [ J ] = binErode( I, Z )
%BINERODE Performs the binary erode operation on I with structuring element
%Z
%   This function simply calles the binary dilate function with the
%   compliment of I and Z flipped as arguments and then compliments the
%   output. This is equal to the erode function


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

%Compliment I and flip Z
Icomp = (I==0)*255;
Zflip = rot90(Z,2);

%The output of the dilate is the compliment of the answer we are seeking
Jcomp = binDilate(Icomp, Zflip);

%Set the compliment as the output
J = (Jcomp==0)*255;

end

