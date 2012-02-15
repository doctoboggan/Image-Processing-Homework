function output = histEQ(I)
%output = histEQ(I) remaps I so that its histogram is as close to constant
%as possible

cdff = floor(cdfo(I)*255);
mi = min(I(:)); %min
Mi = max(I(:)); %max

%new min and max
mj = 00;
Mj = 255;

output = (Mj - mj) * (cdff(I+1) - cdff(mi+1))/(cdff(Mi+1)-cdff(mi+1)) + mj;
output = uint8(floor(output));