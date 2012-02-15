function [ Jout ] = binReconstruction( J, I)
%BINRECONSTRUCTION performs the binary reconstruction of the image

T=0;

while (1)
    T = J;
    J = binDilate(J, 8);
    J = I & J;
    if J == T
        break
    end
end

Jout = J;

end

