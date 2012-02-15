%% 2a
I = imread('pleiades.jpg');
h = zeros(size(I));
h(100,150,:) = [1 1 1];
convI = convFreq(I,h);
imshow(convI)


%% 2b and 2c
I = zeros(512); %change to ones for 2b.2
I(257-10,257) = 1; %change position to 100,100 for 2c
result = fftshift(fft2(ifftshift(I)));
maxreal = max(max(real(result)))
minreal = min(min(real(result)))
maximag = max(max(imag(result)))
minimag = min(min(imag(result)))
maxabs = max(max(abs(result)))
minabs = min(min(abs(result)))
maxangl = max(max(angle(result)))
minangl = min(min(angle(result)))
%not sure if right

figure,imagesc(imag(result)),colormap(gray(256)),truesize;


%% 2d
R = 385;
C = floor(3*R/2);
I = zeros([R C]);
I(ceil(R/2)-10, ceil(C/2)+10) = 1;
I(ceil(R/2)+10, ceil(C/2)-10) = 1;
ift = fft2(ifftshift(I));
imshow(real(ift))
%not working

%% 2e
R = 385;
C = floor(3*R/2);
I = zeros([R C]);
I(floor(R/2)-10, floor(C/2)+10) = 1;
I(floor(R/2)+10, floor(C/2)-10) = 1;
I(floor(R/2)+10, floor(C/2)+10) = 1;
I(floor(R/2)-10, floor(C/2)-10) = 1;
ift = fft2(ifftshift(I));
imshow(real(ift))
%not working same as 2d