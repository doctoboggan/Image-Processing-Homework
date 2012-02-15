function [ t ] = testSpeed()
%TESTSPEED Summary of this function goes here
%   Detailed explanation goes here

I=ones(512,512);
t=zeros(32,2);
for n=1:32
    h=ones(n,n);
    tic;
    J = convSpace(I,h);
    t(n,1) = toc;
    tic;
    J = convFreq(I,h);
    t(n,2) = toc;
end

q=t(:,1)<t(:,2);
if (q(1))
    cross_point = sum(q)+1;
else
    q=t(:,2)<t(:,1);
    cross_point = sum(q)+1;
end


[m n]=size(t);
plot(1:m, t(:,1),'g')
hold on
plot(1:m, t(:,2),'r')
plot(cross_point,t(cross_point,2),'b*')
legend('Space Domain', 'Frequency Domain','Cross Point')



end