function [ J ] = grayDilate( I, Z )
%GRAYDILATE performs a grayscale dilation on image I using structuring element
%Z
%   If  Z=8 then the SE used is Z8, if Z=4 then the SE used is Z4, and if
%   Z='L' then the SE used is ZL. If anything else is input, it will be
%   used as the SE.

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

%Define the parameters we need
[R C] = size(I);
[N M] = size(Z);
rho = ceil(N/2);
chi = ceil(M/2);

%Allocate our temporary image
T = zeros((R+N-1),(C+M-1));

%Loop over every pixel in Z and check if it is in the foreground (0)
for i=1:N
    for j=1:M
        if Z(i,j) == 0
            T(i:i+R-1, j:j+C-1) = max(T(i:i+R-1, j:j+C-1), double(I));
        end
    end
end

%Grab the part of T that we need
J = uint8(T(rho:rho+R-1, chi:chi+C-1));


end

