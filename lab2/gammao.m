function output = gammao(I, gma)
%gamma(I, gma) applies a gamma transform to image I

x = 0:361;
coefs = [0 0 1;127^2 127 1;361^2 361 1]\[0 20*(gma-1) 0]';
A = coefs(1);
B = coefs(2);
C = coefs(3);
parabola = A*x.^2 + B*x + C;

plot(parabola)
hold on

for i=1:361
    newXY(:,i) = [1/sqrt(2) -1/sqrt(2);1/sqrt(2) 1/sqrt(2)]*[i parabola(i)]';
end

newXY
plot(newXY(1,:), newXY(2,:))