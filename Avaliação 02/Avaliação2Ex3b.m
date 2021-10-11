clc
close all

T=readtable('covid192020PT.xlsx');

nDias=30;

X=(1:nDias)';
Y=T{X,2};
Z=[ones(length(X),1),X,X.^2,X.^3,X.^4,X.^5];

beta=inv(Z'*Z)*Z'*Y

x=(X(1):.1:X(end))';
z=[ones(length(x),1),x,x.^2,x.^3,x.^4,x.^5];
y=z*beta;
%y=beta(1)+beta(2)*x+beta(3)*x.^2+beta(4)*x.^3+beta(5)*x.^4+beta(6)*x.^5;

% Calcular y(32), ou seja, y previsto
yi=beta(1)+beta(2)*32+beta(3)*32^2+beta(4)*32^3+beta(5)*32^4+beta(6)*32^5;
disp(strcat('3 de Abril previsto: ', num2str(yi)));

%Ir buscar à tabela o valor associado ao 32º dia, ou seja, y real
yr=T{32,2};
disp(strcat('3 de Abril real: ', num2str(yr)));

%Calcular o erro associado
erroPrevisao=yi-yr;
disp(strcat('Erro de Previsão: ', num2str(erroPrevisao)));


%%% mostra a função aproximada y e os dados reais de y 
hold on
plot(X,Y,'O');
plot(x,y,'b');
pause(2);
close all;


%%% mostra o yi e o yr num gráfico
plot(32,yi,'O');
hold on
plot(32, yr,'O');
text(32, yr, '\leftarrow valor real 32º dia'), 'HorizontalAlignment';
text(32,yi, '\leftarrow Previsão 32º dia');
