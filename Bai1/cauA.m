function returnData = cauA()
syms v t
%CAUA Summary of this function goes here
%   Detailed explanation goes here
%% input
g=9.8;
m=68.1;
c_d=0.25;
t0=0;
t_max=10;
h=1;
%% handle
T= [t0:h:t_max]';
dv=@(t,v) g-(c_d/m)*v.^2;

%% Tinh toan
f_v =v-int(dv,t); %% Lay nguyen ham cua dv theo dt 
F_v =subs(f_v,t,T);
for i=1:length(F_v)
    resolve=solve(F_v(i),v);
    if length(resolve)>1
         V_Real(i,1)=double(resolve(2));
    else
         V_Real(i,1)=double(resolve);
    end
end
returnData=table(T,V_Real);
end

