function output = brightness(I, p)
%output = brightness(I, percent) increases the brightness of image I by p*100
%percent. p is calculated as a percentage of the mean intensity value of the
%whole image

output = I + (mean(I(:))*p);