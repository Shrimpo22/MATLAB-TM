close all
T=readtable('covid192020PT.xlsx');

nDias=280;

X=(1:nDias)';
Y=T{X,2};
Z=ones(length(X),1);
grauOP=1;
erroOP=10000000000000000000000000000;
plot(X,Y,'color', 'r');
hold on
pause(0.5)
close all
for k = 1:30
    %     disp('grauOP');
    %     disp(grauOP);
    %     disp('erroOP');
    %     disp(erroOP);
    Z=ones(length(X),1);
    close all
    for j=1:k
        Z=[Z X.^j];
    end
    
    beta = inv(Z'*Z)*Z'*Y;
    x = (X(1):.1:X(end))'; %<--------- Se der granel é daqui boi
    
    y = beta(1);
    
    for i=1:k
        y = y + beta(i+1)*x.^i;
    end
    
    erroTotal=0;
    for i = 1:length(Y)
        %         disp('length(Y)')
        %         disp(length(Y))
        %
        yi=T{i,2};
        %         disp('yi')
        %         disp(yi)
        
        erroPrevisao=(yi-y(i))^2;
        %         disp('erroP')
        %         disp(erroPrevisao)
        erroTotal=erroTotal+erroPrevisao;
        %         disp('erroT')
        %         disp(erroTotal)
        erroPs=sqrt(erroPrevisao);
        %         disp('erroPs')
        % %         disp(erroPs)
        %         disp('--------------------------------------')
        
    end
    %erroTotal=abs(erroTotal);
    %     disp('erroT')
    %     disp(erroTotal)
    %     disp('--------------------------------------')
    if erroTotal < erroOP
        erroOP=erroTotal;
        grauOP=k;
    end
    %     disp('GrauOP=');
    %     disp(grauOP);
    figure(1)
    plot(X,Y,'color', 'r');
    hold on
    %plot(x,y,'b');
    %pause(5)
end

% disp('grauOP=');
% disp(grauOP);
%
% disp('erroOP=');
% disp(erroOP);