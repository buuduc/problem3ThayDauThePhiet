function [A,B]= bac1(X,Y)
i1=length(X); 
i2=sum(X);
j1=sum(X);
j2=sum(X.^2);
mt=[i1 i2;j1 j2];
resu=[sum(Y);X*Y']; % nhan ma tran de tim tong x*y 
ketqua=inv(mt)*resu; % tim ketqua bang ma tran nghich dao
% fprintf('Xap xi ham tuyen tinh :')
A=round(ketqua(1),4);
B=round(ketqua(2),4);
%% ve do thi
figure % goi cua so ra de ve
plot(X,Y,'.','markersize',20)
hold on
X=sort(X); % sap xep lai mang X tu be den lon de ve do thi
plot(X,A+B*X)
syms x
y=A+B*x;
title(strcat('y=',char(y)))