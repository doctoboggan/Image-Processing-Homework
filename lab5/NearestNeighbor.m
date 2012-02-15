function [ J ] = NearestNeighbor( I, r, c )
%NEARESTNEIGHBOR returns image J which is image I scaled from its original
%size to contain rxc pixels.
%   This function uses the nearest neighbor technique.


[m n z] = size(I);
J = zeros(r,c,z, 'uint8');

%If we are expanding we need to add one to fix the algorithm
if (r>m)
    fixR = 1;
else
    fixR = 0;
end

if (c>n)
    fixC = 1;
else
    fixC = 0;
end

%Build the needed vectors and scale factors
scaleR = m/r;
scaleC = n/c;
selectionR = floor(1:scaleR:m+fixR);
selectionC = floor(1:scaleC:n+fixC);


for i = 1:z
    for ii = 1:r
        for jj = 1:c
            %Populate the new image
            J(ii,jj,i) = I(selectionR(ii), selectionC(jj), i);
        end
    end
end


end

