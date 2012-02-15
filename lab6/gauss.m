function [ g ] = gauss( r, c, sigma )
%GAUSS returns a 2d gaussian distribution
%   r and c are the rows and columns of the output, and var is the varience

R = repmat((1:r)', 1, c);
C = repmat((1:c), r, 1);

mu_r = ceil(r/2)+1;
mu_c = ceil(c/2)+1;

g = (1/(sigma^2*2*pi)) * exp((-1) * ((R-mu_r).^2 + (C-mu_c).^2)/(2*sigma^2) );

m = min(g(:));
M = max(g(:));

g = (g-m)/(M-m);


end

