function ficha2Ex2

clc

close all

T = readtable('covid192020PT.xlsx');

%alinea a para os 15 primeiros dias
%ndias=15;

%alinea b para os 30 primeiros dias 
ndias=30;

X=(1:ndias)';
Y0=T{X,2};

Y=log(Y0);

lenX=length(X);

Z=[ones(lenX,1),X];

beta=inv(Z'*Z)*Z'*Y

%%%gráficos escala linera/original
x=X(1):.1:X(end);
y=exp(beta(1)+beta(2)*x);
y2=beta(1)+beta(2)*x;

figure(1)
plot(X,Y0,'o')
hold on
plot(x,y,'b')

figure(2)
plot(X,Y,'o')
hold on
plot(x,y2,'b')

%%%PREVISAO

y16Prev=exp(beta(1)+beta(2)*16)

y16Real=T{16,2}
dia=T{16,1}

end
