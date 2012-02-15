function [ J ] = binOpen( I, Z )
%BINOPEN performs a binary open on the binary image I
%   A binary open is an erosion followed by a dilation

J = binDilate(binErode(I, Z), Z);


end

