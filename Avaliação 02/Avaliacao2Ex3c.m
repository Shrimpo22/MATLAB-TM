clc
close all
T=readtable('covid192020PT.xlsx');

nDias=280;

X=(1:nDias)';
Y=T{X,2};
Z=ones(length(X),1);


% grauOP <--- variável onde irá estar guardado o grau do melhor polinómio
% que aproxima a evolução ao longo dos dias.
%
% erroOP <--- variável onde irá estar guardado o erro associado ao melhor
% polinómio (Inicializa-se com um valor grande para garantir que vai haver
% pelo menos um polinómio com erro associado menor que esse valor)

grauOP=1;
erroOP=100000000000000000000000000000000



close all
for k = 1:30
    Z=ones(length(X),1);
    close all
    for j=1:k
        Z=[Z X.^j];
    end
    
    beta = inv(Z'*Z)*Z'*Y;
    x = (X(1):.1:X(end))';
    
    y = beta(1);
    
    for i=1:k
        y = y + beta(i+1)*x.^i;
    end
 
    erroTotal=0;
    for i = 1:length(Y)
        %disp(num2str(y(i)));
        yr=T{i,2};
        index=find(x==i);
        erroPrevisao=(yr-y(index)).^2;
        erroTotal=erroTotal+erroPrevisao;
        
    end
  
    disp(strcat('erroTotal:',num2str(erroTotal)));

    if erroTotal < erroOP
        erroOP=erroTotal;
        grauOP=k;
    end
end
plot(X,Y,'color', 'r');
hold on
plot(x,y,'b');
disp(strcat('Grau Ótimo:', num2str(grauOP)));
disp(strcat('Erro associado:', num2str(erroOP)));