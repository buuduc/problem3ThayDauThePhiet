function returnData = modifiedEuler()

%% input chung
global g m c_d t0 t_max h

%% input dv
% Mot chut kien thuc ve vat ly, khi t=0 => vat chua di chuyen => t=0 la
% dieu kien ban dau
dv= @(v) g- (c_d/m)*v^2;
v0=0;
%% handle
T= [t0:h:t_max]';
V=[v0];
for k=2:length(T)
    K1(k,1)=h*dv(V(k-1));
    K2(k,1)= h*dv(V(k-1)+K1(k));
    V(k,1)=V(k-1)+(K1(k)+K2(k))/2;
end
returnData=table(T,K1,K2,V);