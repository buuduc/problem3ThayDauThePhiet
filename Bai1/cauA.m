function [f_v,returnData] = cauA()
syms v t C_d M
global g m c_d t0 t_max h

%% handle
T= [t0:h:t_max]';
dv=@(t,v) g-(C_d/M)*v.^2;
%% Tinh toan
f_v =v-int(dv,t); %% Lay nguyen ham cua dv theo dt 
F_v =subs(f_v,{t,C_d,M},{T,c_d,m});
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

