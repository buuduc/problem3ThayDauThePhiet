clc 
clear all
close all
S=[1.3 1.8 3 4.5 6 8 9];
V= [0.07  0.13 0.22 0.275 0.335 0.35 0.36] ;

%% Tim Phuong trinh bac 1
[A1,B1]=bac1(S,V);
f_bac1=@(x) A1+B1*x;
%% Tim Phuong trinh bac 2
[A2,B2,C2]= bac2(S,V);
f_bac2=@(x) A2+B2*x+C2*x.^2;
%% Lay so lieu ket qua bac1 va bac 2 de so sanh
V_bac1=f_bac1(S);
V_bac2=f_bac2(S);

%% Tao bang ket qua va tinh sai  so
bangBac1=table(S',V',V_bac1','VariableNames',{'S','v','vXapXiBac1'});
bangBac1.saiSo= abs((bangBac1.v-bangBac1.vXapXiBac1)./bangBac1.v);

bangBac2=table(S',V',V_bac2','VariableNames',{'S','v','vXapXiBac2'});
bangBac2.saiSo= abs((bangBac2.v-bangBac2.vXapXiBac2)./bangBac2.v);

%% In ket qua 
fprintf("Ket qua cua xap xi dang A+Bx: \n")
disp(bangBac1)
fprintf("Ket qua sai so trung binh cua dang A+Bx: " )
disp(mean(bangBac1.saiSo))
fprintf("================================================ \n")
fprintf("Ket qua cua xap xi dang A+Bx+Cx^2: \n")
disp(bangBac2)
fprintf("Ket qua sai so trung binh cua dang A+Bx+Cx^2: ")
disp(mean(bangBac2.saiSo))