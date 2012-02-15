function [ J ] = removeNoise( I, points )
%REMOVENOISE Removes noise from I by zeroing out the peaks
%       Supply the points to be masked out with the argument points. If you
%       want to select them graphicaly enter 0 for points

if (points == 0)
    imshow(fftshift(uint8(log(abs(fft2(I)).^2)))*10)
    points = ginput();
end

[m n ~] = size(I);

M = ones(m,n, 'double');

%take the FFT of the input image
F = fft2(I);

%loop through each point that needs to be zeroed
for i=1:size(points,1)
    %put a 10x10 square of zeros over each selected point
    M(points(i,2)-5:points(i,2)+5,points(i,1)-5:points(i,1)+5) = 0;
end


%if we made M too big, trim it down
M = M(1:m,1:n);


%blur M
M = convFreq(M, gauss(10,10,3));

imshow(M)

%ifftshift M
M = ifftshift(M);

%Mask out the peaks
G(:,:,1) = F(:,:,1) .* M;
G(:,:,2) = F(:,:,2) .* M;
G(:,:,3) = F(:,:,3) .* M;

%Produce the output image
J = uint8(real(ifft2(G)));


end

