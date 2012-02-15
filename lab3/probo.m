function prob = probo(I)
%probo(I) takes a 1-band image and returns a probability density function
%of its values.

prob = histo(I)/length(I(:))*100;