clc
close all
clear all
%% cau a
resultEuler=modifiedEuler()
%% cau b
X=resultEuler.X;
Y=resultEuler.Y;
T=resultEuler.T;
%% lay he so cua spline  
resultSpline=naturalSpline(X,Y)
%% tao mot array chua cac ham spline
listSpline={};
for i= 1: size(resultSpline,1)
    listSpline{i}= @(x) resultSpline(i,1)+resultSpline(i,2)*(x-X(i))+resultSpline(i,3)*(x-X(i))^2+resultSpline(i,4)*(x-X(i))^3;
end
 

% Kiem tra ket qua spline bac 3 co dung hay k
% listSpline{2}(2.9551)
% listSpline{1}(2.9551)

listSpline{3}(5)

% Ve do thi
hold on
plot(T,X,'color','r') 
plot(T,Y,'color','b')
xlabel('time T (months)')
ylabel('number')

