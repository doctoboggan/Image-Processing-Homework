function [ R, G, B ] = HSVtoRGB( H, S, V )
%[R,G,B] = HSVtoRGB(H,S,V) Takes matrices of hue, saturation, and value and
%converts them into their corresponding RGB representation. H ranges from 0
%to 2?. S ranges from 0 to 1 with 1 = full saturation. V ranges from 0 to 255

[m n] = size(H);

R = zeros(size(H),'uint8');
G = zeros(size(H),'uint8');
B = zeros(size(H),'uint8');
for i=1:m
    for j=1:n
        h = H(i,j);
        s = S(i,j)*208.2066;
        v = double(V(i,j));
        
        sHat_rgb = s*(sqrt(6)/6)*cos(h)*[2 -1 -1]' + s*(sqrt(2)/2)*sin(h)*[0 1 -1]';
        vHat_rgb = v*sqrt(3)*[1/3 1/3 1/3]';
        
        pHat_rgb = sHat_rgb + vHat_rgb;
        
        R(i,j) = uint8(pHat_rgb(1));
        G(i,j) = uint8(pHat_rgb(2));
        B(i,j) = uint8(pHat_rgb(3));
    end
end

end

