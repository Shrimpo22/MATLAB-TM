function ficha2Ex3alinea2

clc

close all

T = readtable('covid192020PT.xlsx');

ndias=30;
diaPrev=31;

X=(1:ndias)';
Y=T{X,2};

lenX=length(X);
Z=[ones(lenX,1),X,X.^2,X.^3,X.^4,X.^5];

beta=inv(Z'*Z)*Z'*Y

x = (X(1):.1:X(end))';
z = [ones(length(x),1),x,x.^2,x.^3,x.^4,x.^5];
y = z * beta;

%%%gráficos escala linera/original

figure(1)
plot(X,Y,'+')
hold on
plot(x,y,'b')

%%%PREVISAO

yPrev=beta(1)+beta(2)*diaPrev+beta(3)*diaPrev^2+beta(4)*diaPrev^3+beta(5)*diaPrev^4+beta(6)*diaPrev^5;
yReal=T{diaPrev,2};
dia=T{diaPrev,1};
disp(strcat('Previsão:', num2str(yPrev)))
disp(strcat('Real:', num2str(yReal)))
disp(strcat('Data:', datestr(dia)))


end
