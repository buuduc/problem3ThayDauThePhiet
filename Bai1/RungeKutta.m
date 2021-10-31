
function returnData = RungeKutta()

%% input
g=9.8;
m=68.1;
c_d=0.25;
t0=0;
t_max=10;
h=1;
%% input dv
% Mot chut kien thuc ve vat ly, khi t=0 => vat chua di chuyen => t=0 la
% dieu kien ban dau
dv= @(t,v) g- (c_d/m)*v^2;
v0=0;

%% handle
T= [t0];
V=[v0];
T=[t0:h:t_max]';

for k=2:length(T)
    K1(k,1)=h*dv(T(k-1),V(k-1));
    K2(k,1)= h*dv(T(k-1)+h/2,V(k-1)+K1(k)/2);
    K3(k,1)=h*dv(T(k-1)+h/2,V(k-1)+K2(k)/2);
    K4(k,1)=h*dv(T(k-1)+h,V(k-1)+K3(k));
    V(k,1)=V(k-1)+(K1(k)+2*K2(k)+2*K3(k)+K4(k))/6;
end
returnData=table(T,K1,K2,K3,K4,V);