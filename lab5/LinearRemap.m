function [ J ] = LinearRemap( I, X, Y, mode )
%LINEARREMAP this function linearly remaps image I based on the coordinates
%in X and Y
%   I can be 1 or 3 bands. X is a 2xn set of pixel coordinates and Y is a
%   2xn set of pixel coordinates that X maps to. Set mode to 1 or 2
%   depending on which version of A is desired

[~, b] = size(X);

%Build A
if (mode == 1)
    r = 2*b;
    A = zeros(r,9);
    for j=1:r
        i = ceil(j/2);
        if (mod(j,2)) %odd
            A(j,:) = [-X(1,i) -X(2,i) -1 0 0 0 X(1,i)*Y(1,i) X(2,i)*Y(1,i) Y(1,i)];
        else %even
            A(j,:) = [0 0 0 -X(1,i) -X(2,i) -1 X(1,i)*Y(2,i) X(2,i)*Y(2,i) Y(2,i)];
        end    
    end
elseif (mode == 2)
    %Build A (The second method)
    r = 2*b;
    A = zeros(r,9);
    for j=1:r
        i = ceil(j/2);
        if (mod(j,2)) %odd
            A(j,:) = [0 0 0 -X(1,i) -X(2,i) -1 X(1,i)*Y(2,i) X(2,i)*Y(2,i) Y(2,i)];
        else %even
            A(j,:) = [X(1,i) X(2,i) 1 0 0 0 -X(1,i)*Y(1,i) -X(2,i)*Y(1,i) -Y(1,i)];
        end    
    end
end

%compute the singular value decomposition
[~, S, V] = svd(A);

%find the min value and select the proper v vector
minVal = min(diag(S));
[~, n] = find(S == minVal);
v_k = V(:,n);

%Reshape into h and then find h inverse
h = reshape(v_k, [3 3])';
hInv = inv(h);

%Allocate J
J = zeros(size(I), 'uint8');

[r c z] = size(I);

%Build J
for ii = 1:z
    for i = 1:r
        for j = 1:c
            %Find the reverse mapping
            newPoint = hInv * [i j 1]';
            %Normalize
            newPointNorml = ceil(newPoint/newPoint(3));
            %pull out x and y
            x = abs(newPointNorml(1));
            y = abs(newPointNorml(2));
            %Fix x and y if they are out of bounds
            if (x == 0)
                x = 1;
            end
            if (x > r)
                x = r;
            end
            if (y > c)
                y = c;
            end
            if (y == 0)
                y = 1;
            end
            %Set values of J
            J(i,j,ii) = I(x, y,ii);
        end
    end
end


end

