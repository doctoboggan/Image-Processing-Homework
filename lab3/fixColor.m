function [ fixed, B, X, Y ] = fixColor( orig, alt, x, y )
%FIXCOLOR fixes image alt based on colors found in orig. x and y are
%coordinates to use for tge tranform matrix
%   [fixed,B] = fixColor(orig,alt,x,y)

lenx = length(x);
[m n z] = size(alt);

X = zeros(3,lenx);
Y = zeros(3,lenx);

for i=1:lenx
    X(:,i) = alt(y(i), x(i), :);
    Y(:,i) = orig(y(i), x(i), :);
end

B = Y*X'/(X*X');


fixed = reshape(((B*(reshape(double(alt),[m*n 3])'))'),m,n,3);

M = max(fixed(:));
m = min(fixed(:));

fixed = uint8(255*(fixed-m)/(M-m));


end

