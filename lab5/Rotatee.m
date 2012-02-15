function [ J ] = Rotatee( I, theta )
%ROTATE rotates image I by theta degrees
%   The point of rotation is the center. I can be 1 or 3 bands. Positive
%   theta translates to clockwise rotation


%define the rotation matrix
rotationMatrix = [cosd(-theta) -sind(-theta); sind(-theta) cosd(-theta)];

%define output image
[m n z] = size(I);
D = sqrt(m^2 + n^2);
J = zeros(D,D,z, 'uint8');

%define new origins to be in the center
origR = ceil(m/2);
origC = ceil(n/2);
origNew = ceil(D/2);

for ii = 1:z
    for i = 1:m
        for j = 1:n
            
            
            %I do the floor, ceil, and shifted to cover up black gaps
            newCoords = floor(rotationMatrix * [i-origR j-origC]');
            newR = newCoords(1);
            newC = newCoords(2);
            J(newR+origNew+1, newC+origNew, ii) = I(i, j, ii);
            
            newCoords = floor(rotationMatrix * [i-origR j-origC]');
            newR = newCoords(1);
            newC = newCoords(2);
            J(newR+origNew, newC+origNew, ii) = I(i, j, ii);
            
            newCoords = ceil(rotationMatrix * [i-origR j-origC]');
            newR = newCoords(1);
            newC = newCoords(2);
            J(newR+origNew, newC+origNew, ii) = I(i, j, ii);
        end
    end
end


end

