clc
clear all

%% input
global g m c_d t0 t_max h
syms v t M C_d
g=9.8;
m=68.1;
c_d=0.25;
t0=0;
t_max=10;
h=1;

%% Cau A
[hamso,bangV_real]=cauA()
V_Real= bangV_real.V_Real;

%% Cau B
fprintf('----------------------------------------------------------------------------------------')
eulerData=modifiedEuler();
eulerData.V_Real =V_Real;
eulerData.saiSo= abs((eulerData.V_Real-eulerData.V)./eulerData.V_Real)*100
R_KuttaData=RungeKutta();
R_KuttaData.V_Real =V_Real;
R_KuttaData.saiSo= abs((R_KuttaData.V_Real-R_KuttaData.V)./R_KuttaData.V_Real)*100
%% Cau C
fprintf('----------------------------------------------------------------------------------------')
hamsoCauC= subs(hamso,{v,t,M},{46,10,95})
C_d_real=double(solve(hamsoCauC))
PhuongPhapChiaDoi=BisectionMethod(C_d,hamsoCauC,[0,1],0.05)
PhuongPhapSecant=SecantMethod(C_d,hamsoCauC,[0,1],0.05)