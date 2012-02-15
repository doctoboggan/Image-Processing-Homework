function [ J ] = grayscale( I )
%GRAYSCALE converts 3 band image I to grayscale
%   The luminance value of each pixel is calculated by the following: 
%   L = 0.299R + 0.587G + 0.114B, which is the NTSC standard

J = .299*I(:,:,1) + .587*I(:,:,2) + .114*I(:,:,3);


end

