clc
close all
clear all
%% cau a
resultEuler=modifiedEuler()


%% cau b
X=resultEuler.X;
Y=resultEuler.Y;
T=resultEuler.T;

%% 3 splice Y(x)
resultSplineYx=naturalSpline(X,Y)
listSplineYx={};
for i= 1: size(resultSplineYx,1)
    listSplineYx{i}= @(x) resultSplineYx(i,1)+resultSplineYx(i,2)*(x-X(i))+resultSplineYx(i,3)*(x-X(i))^2+resultSplineYx(i,4)*(x-X(i))^3;
end

%% 3 splice Y(t)
resultSplineYt=naturalSpline(T,Y)
listSplineYt={};
for i= 1: size(resultSplineYt,1)
    listSplineYt{i}= @(x) resultSplineYt(i,1)+resultSplineYt(i,2)*(x-X(i))+resultSplineYt(i,3)*(x-X(i))^2+resultSplineYt(i,4)*(x-X(i))^3;
end

%% 3 splice X(t)
resultSplineXt=naturalSpline(T,X)
listSplineXt={};
for i= 1: size(resultSplineXt,1)
    listSplineXt{i}= @(x) resultSplineXt(i,1)+resultSplineXt(i,2)*(x-X(i))+resultSplineXt(i,3)*(x-X(i))^2+resultSplineXt(i,4)*(x-X(i))^3;
end
%%
% Kiem tra ket qua spline bac 3 co dung hay k
% listSplineYx{2}(2.9551)
% listSplineYx{1}(2.9551)

%% Lay so luong con moi tai thang thu 0.5 (0 < 0.5 < 0.625)
    conMoi0_5=listSplineXt{1}(0.5) % Lay ham splice thu 1 X(t), the vao t=0.5

%% Lay so luong thu san moi vao thang thu 0.8 (0.625 <0.8 < 1.25)   
    thuSanMoi0_8=listSplineYt{2}(0.8) % Lay ham splice thu 2 Y(t), the vao t=0.8
%% Ve do thi
hold on
plot(T,X,'color','r') 
plot(T,Y,'color','b')
xlabel('time T (months)')
ylabel('number')

