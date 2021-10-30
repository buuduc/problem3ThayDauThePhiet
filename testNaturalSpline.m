clc 
clear all
X=[0,1,2,3];
Y=[1,2,4,8];
resultSpline=naturalSpline(X,Y)
% y=f(x)
i=2
fx= @(x) resultSpline(i,1)+resultSpline(i,2)*(x-X(i))+resultSpline(i,3)*(x-X(i))^2+resultSpline(i,4)*(x-X(i))^3;
fx(1.5)
