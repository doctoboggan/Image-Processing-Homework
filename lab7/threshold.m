function [ J ] = threshold( I, t )
%THRESHOLD sets all pixels greater than t to 255 and all pixels less than t
%to 0
% I must be monochrome, use grayscale() to convert beforehand.

greater = I > t;

J = greater*255 + ~greater*0;


end

