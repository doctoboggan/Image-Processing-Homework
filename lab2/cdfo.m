function cdf = cdfo(I)
%cdfo(I) takes a 1-band image and returns a PDF of its values

cdf = zeros(1,256);
pdf = probo(I);
for i=1:256
    cdf(i) = sum(pdf(1:i));
end