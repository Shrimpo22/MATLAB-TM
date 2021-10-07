
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
    y=complex((1/8)*exp(i*20*pi*t))+z;  %%%% mudanca de centro
    %z=complex(sin(t1*pi*t)*exp(i*2*pi*t)); %%% raio dinamico petalas 
    %%%%%
    pause(0.005);    %%%% para a execucao por t segundos
        plot(z,'x','MarkerSize',8)
    plot(y,'x','MarkerSize',8)
    xlim([-5 5])   %%% establece limites horizontais da figura
    ylim([-5 5])   %%% establece limites verticais da figura
    hold on 
end