function [ Jout ] = grayReconstruction( J, I)
%GRAYRECONSTRUCTION performs the binary reconstruction of the image

T=0;

while (1)
    T = double(J);
    J = double(grayDilate(J, 8));
    J = min(double(I), J);
    if J == T
        break
    end
end

Jout = uint8(J);

end

