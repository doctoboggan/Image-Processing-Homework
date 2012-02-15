function [ J ] = grayOpen( I, Z )
%GRAYOPEN performs a grayscale open on the grayscale image I
%   A grayscale open is an erosion followed by a dilation

J = grayDilate(grayErode(I, Z), Z);


end

