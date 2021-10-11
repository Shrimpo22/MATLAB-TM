function ficha2Ex1

clc

close all

X=[1 2 3 4]';

Y=[1 1 3 5]';

lenX=length(X)

%phi1=@(x) ones(Length(x),1);
%phi2=@(x) sin(x);
%phi3=@(x) cos(x);

plot(X, Y, 'O')

Z=[ones(lenX,1) X];

beta = pinv(Z'*Z)*Z'*Y

x=X(1):.1:X(end);
y=beta(1)+beta(2)*x;

figure(1)
plot(X,Y,'ro','Markersize',12);
hold on
plot(x,y,'b')

y(5)

end
