function [A,B,C]= bac2(X,Y)
i1=length(X);
i2=sum(X);
i3=sum(X.^2);
j1=sum(X);
j2=sum(X.^2);
j3=sum(X.^3);
k1=sum(X.^2);
k2=sum(X.^3);
k3=sum(X.^4);
resu=[sum(Y);X*Y';(X.^2)*Y']; %ma tran ben ve ben phai
mt=[i1 i2 i3;j1 j2 j3;k1 k2 k3];
ketqua=inv(mt)*resu; %inv la nghich dao cua ma tran
% fprintf('Xap xi ham bac 2:')
A=round(ketqua(1),4);
B=round(ketqua(2),4);
C=round(ketqua(3),4);
%% ve do thi
figure
plot(X,Y,'.','markersize',20)
hold on
syms x
y=A+B*x+C*(x.^2);
X=sort(X); % sap xep lai mang X tu be den lon de ve do thi
plot(X,A+B*X+C*(X.^2))
title(strcat('y=',char(y)))