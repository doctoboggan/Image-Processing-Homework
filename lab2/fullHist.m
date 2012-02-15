function fullHist(I)

k=floor(sum(I,3)/3);
h=figure();
hold on
set(gca,'XLim',[0 256])
stairs(histo(I(:,:,1)), 'r');
stairs(histo(I(:,:,2)), 'g')
stairs(histo(I(:,:,3)), 'b')
stairs(histo(k), 'k')