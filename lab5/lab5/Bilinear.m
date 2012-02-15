function [ J ] = Bilinear( I, R_prime, C_prime )
%BILINEAR resizes image I to new dimension R_prime x C_prime
%   I can be 1 or 3 channels and the dimensions must be integers


%Grab the size and define the scale factors
[R C Z] = size(I);
s_R = R/R_prime;
s_C = C/C_prime;

%Build the prime vectors
r_prime_vector = 1:R_prime;
c_prime_vector = 1:C_prime;

J = zeros(R_prime, C_prime, Z, 'uint8');

%Duplicate the edges to account for the last pixel row
I(:,end+1,:) = I(:,end,:);
I(end+1,:,:) = I(end,:,:);

for z = 1:Z
    for i = 1:R_prime
        for j = 1:C_prime
            %Define the parameters we need
            r_prime = r_prime_vector(i);
            c_prime = c_prime_vector(j);
            r_f = r_prime*s_R;
            c_f = c_prime*s_C;
            
            %The floor of the first pixel row and column is 0 so we need to
            %fix that
            r = floor(r_f);
            if (r == 0)
                r = 1;
            end
            c = floor(c_f);
            if (c == 0)
                c = 1;
            end
            Deltar = r_f - r;
            Deltac = c_f - c;
            
            %Do the actual interpolation
            J(r_prime, c_prime, z) = I(r,c,z) * (1-Deltar) * (1-Deltac) ...
                + I(r+1, c, z) * Deltar * (1-Deltac) ...
                + I(r, c+1, z) * (1-Deltar) * Deltac ...
                + I(r+1, c+1, z) * Deltar * Deltac;
        end
    end
end

end

