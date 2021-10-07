%%% Complexos
%%%

clc %%%% limpa Command Window

%% imaginário 

i^2

%% complexos

z1=i
z2=1 
z3=conj(i)
z4=2+3*i
z5=conj(z4)

ListaComp=[z1,z2,z3,z4,z5,-z5,0]

plot(ListaComp,'X','MarkerSize',12)


%% Parte real, imaginaria, modulo, argumento 

z1=i 
z4=2+3*i

Re4=real(z4)  %%%% parte real de z4
Im4=imag(z4)  %%%% parte imaginaria de z4 
Re1=real(z1)  
Im1=imag(z1)

mod1=abs(z1)  %%%% modulo de z1 
mod4=abs(z4)

teta1=angle(z1) %%% argumento em ]-pi,pi]
teta4=angle(z4) 
tetaTeste=angle(-1)

%% forma polar

iPolar=exp(i*pi/2)

exp(i*pi/2)== i

figure %%%% cria nova janela para grafico

for k=0:3 
    z=complex(2*exp(i*k*pi/2)) %%%% comando complex serve para garantir que o MATLAB intrepreta exp(0)=1 como complexo
    plot(z,'O','MarkerSize',12)
    hold on 
end

%%

close all %%% fecha figuras anteriores

figure 

z=1+i;

for k=1:4 
    z=z*i;
    plot(z,'O','MarkerSize',12)
    hold on 
end


%% raizes da unidade de ordem N 

N=50; 


figure %%%% cria nova janela para grafico


close all


for k=0:N-1
    z=complex(exp(i*k*2*pi/N));  %%%% complex para garantir que o MATLAB intrepreta e^0=1 como complexo
    pause(.1);    %%%% para a execucao por t segundos 
    plot(z,'O','MarkerSize',12)
    xlim([-1 1])   %%% establece limites horizontais da figura
    ylim([-1 1])   %%% establece limites verticais da figura
    hold on 
end

%% poligonos regulares com N lados usando raizes da unidade  

close all  
figure

N=98654; 

raizesUnid=zeros(1,N+1); %%%% cria um array com 1 linha e N colunas de zeros. 

for k=0:N-1
    raizesUnid(k+1)=complex(exp(i*k*2*pi/N));  
end

raizesUnid(N+1)=complex(1);  %%% acrescentado para fechar o poligono 
plot(raizesUnid)


%% A sucessao de complexos z^n

r0=0.95;            %%% raio/modulo inicial
teta0=pi/6;      %%% angulo inicial 
z0=r0*exp(i*teta0) %%%% posicao inicial 
N=1000;           %%% num de etermos da sucessao

close all 
figure

 for k=1:N
    z=z0^k;  %%%% complex para garantir que o MATLAB intrepreta e^0=1 como complexo
    pause(.1);    %%%% para a execucao por t segundos 
    plot(z,'x','MarkerSize',12)
    %xlim([-1 1])   %%% establece limites horizontais da figura
    %ylim([-1 1])   %%% establece limites verticais da figura
    hold on 
 end



%%  Sucessao de complexos z_n geral

zn=@(n) 1/n + i;  %%% define uma funcao zn de n usando uma...
                  %%% ... uma handle @ ...
                  %%% ... ver o novo objeto no Workspace

%%%% outros exemplos de sucessoes

zn=@(n) 1/n + i*n/(n+1); 
%zn=@(n) n + i*1/n;
%zn=@(n) n + i*n^2;

%%%%

N=20;   %%% numero de termos

close all 
figure

 for k=1:N
    z=zn(k)  %%%% complex para garantir que o MATLAB intrepreta e^0=1 como complexo
    pause(.1);    %%%% para a execucao por t segundos 
    plot(z,'x','MarkerSize',12)
    %xlim([-1 1])   %%% establece limites horizontais da figura
    %ylim([-1 1])   %%% establece limites verticais da figura
    hold on 
end
    
%% mais coordenadas polares (tempo "continuo") 

t0=0;
t1=2;
h=.005;
T=t0:h:t1;

figure %%%% cria nova janela para grafico


close all


for t=T
    % Manter so um dos exs z=... ligado
    %%%%%
    z=complex(exp(i*2*pi*t));  %%%% circulo
    %z=complex(exp(i*2*pi*t))+i;  %%%% mudanca de centro
    z=complex(sin(t1*pi*t)*exp(i*2*pi*t)); %%% raio dinamico petalas 
    %%%%%
    pause(0.05);    %%%% para a execucao por t segundos 
    plot(z,'x','MarkerSize',8)
    xlim([-1 1])   %%% establece limites horizontais da figura
    ylim([-1 1])   %%% establece limites verticais da figura
    hold on 
end


%% mais coordenadas polares (tempo "continuo") 

t0=0;
t1=2;
h=.005;
T=t0:h:t1;

figure %%%% cria nova janela para grafico


close all


for t=T
    % Manter so um dos exs z=... ligado
    %%%%%
    z=complex(exp(i*2*pi*t)); 
    w=complex(exp(i*2*pi*t))+z;
    %%%%%
    pause(.05);    %%%% para a execucao por t segundos 
    plot(z,'x','MarkerSize',8)
    xlim([-1 1])   %%% establece limites horizontais da figura
    ylim([-1 1])   %%% establece limites verticais da figura
    hold on 
end

 

