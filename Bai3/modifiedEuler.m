
function returnData = modifiedEuler()

%% input chung
[a,b,c,d] = feval(@(x) x{:}, num2cell([1.2,0.6,0.8,0.3]));
t=10;
h=0.625;
%% input dx
dx= @(t,x,y) a*x - b*x*y;
x0=2;
%% input dy
dy= @(t,x,y) -c*y+d*x*y;
y0=1;
%% handle
T= [0:h:t]';
X=[x0];
Y=[y0];
K=[0:1:length(T)-1]';
for k=2:length(T)
    K1x(k,1)=h*dx(T(k-1),X(k-1),Y(k-1));
    K1y(k,1)=h*dy(T(k-1),X(k-1),Y(k-1));
    K2x(k,1)= h*dx(T(k),X(k-1)+K1x(k),Y(k-1)+K1y(k));
    K2y(k,1)= h*dy(T(k),X(k-1)+K1x(k),Y(k-1)+K1y(k));
    X(k,1)=X(k-1)+(K1x(k)+K2x(k))/2;
    Y(k,1)=Y(k-1)+(K1y(k)+K2y(k))/2;
end
returnData =table(K,T,K1x,K1y,K2x,K2y,X,Y);