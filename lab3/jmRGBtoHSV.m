function [ H, S, V ] = jmRGBtoHSV( R, G, B )
%[H,S,V] = RGBtoHSV(R,G,B) where R G and B are the color bands of an image
%and H, S, and V are the corresponding hue, saturation, and value matrices.
%H ranges from 0 to 2?. S ranges from 0 to 1 with 1 = full saturation. 
%V ranges from 0 to 255


[m n] = size(R); %Find the size of our input image

%Initialize the output matrices
H = zeros(size(R));
S = zeros(size(R));
V = zeros(size(R));

%Loop over each element. This could probably be vectorized but I am lazy
for i=1:m
    for j=1:n
        
       %Pull out the elements we need
       r = double(R(i,j));
       g = double(G(i,j));
       b = double(B(i,j));
       c = double(r+g+b);
       
       %Build H, S, and V in accordance with formulas given in class.
       sHat = [r-(1/3)*c g-(1/3)*c b-(1/3)*c]';
       xHat = (c/3)*[2 -1 -1]';
       if norm(sHat) > 1e-7;
            H(i,j) = real(acos(dot(sHat,xHat)/(norm(sHat)*norm(xHat))));
       else
           H(i,j) = 0;
       end
       if (b > g)
           H(i,j) = 2*pi - H(i,j);
       end
       
       V(i,j) = (1/3)*(r + g + b);
       
       S(i,j) = norm(sHat);
       
    end
end

S = S/208.2066;

end

