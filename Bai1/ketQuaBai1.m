clc
clear all
%% Cau A
ketQuaCauA=cauA()
V_Real= ketQuaCauA.V_Real;

%% Cau B
eulerData=modifiedEuler();
eulerData.V_Real =V_Real;
eulerData.saiSo= abs((eulerData.V_Real-eulerData.V)./eulerData.V_Real)*100
R_KuttaData=RungeKutta();
R_KuttaData.V_Real =V_Real;
R_KuttaData.saiSo= abs((R_KuttaData.V_Real-R_KuttaData.V)./R_KuttaData.V_Real)*100
