clc
clear all
% function returnData = modifiedEulerX()

%% input chung
t0=1
t_max=1.6;
h=0.2;
%% input dx
dx= @(t,x,y) y;
x0=0.3;
%% input dy
dy= @(t,x,y) 4*y+t^2*x+2.6;
y0=1.1;
%% handle
T= [t0:h:t_max]';
X=[x0];
Y=[y0];
for k=2:length(T)
    K1x(k,1)=h*dx(T(k-1),X(k-1),Y(k-1));
    K1y(k,1)=h*dy(T(k-1),X(k-1),Y(k-1));
    K2x(k,1)= h*dx(T(k),X(k-1)+K1x(k),Y(k-1)+K1y(k));
    K2y(k,1)= h*dy(T(k),X(k-1)+K1x(k),Y(k-1)+K1y(k));
    X(k,1)=X(k-1)+(K1x(k)+K2x(k))/2;
    Y(k,1)=Y(k-1)+(K1y(k)+K2y(k))/2;
end
% returnData=[K,T,K1,K2,X];
table(T,K1x,K1y,K2x,K2y,X,Y)