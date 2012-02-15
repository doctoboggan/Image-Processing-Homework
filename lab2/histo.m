function hist = histo(I)
%histo(I) takes a 1-band image and returns a hisogram of its values

hist = zeros(1,256);
list = I(:);
for i=1:length(I(:))
    hist(list(i)+1) = hist(list(i)+1) + 1;
end