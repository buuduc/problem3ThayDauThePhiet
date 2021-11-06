function [returnTable,returnX]=SecantMethod(x,f,range,saiSoChoPhep)
f=matlabFunction(f);
X=range';
F=f(range);
i=3;
saiSo=[NaN ;abs(range(2)-range(1))];
N=[1;2];
while saiSo(end)>saiSoChoPhep
    X(i)=X(i-2)-f(X(i-2))*(X(i-1)-X(i-2))/(f(X(i-1))-f(X(i-2)));
    F(i)=f(X(i));
    N(i)=i;
    saiSo(i)=abs(X(i)-X(i-1));
    i=i+1;
end
returnX= X(end);
returnTable=table(N,X,F',saiSo,'VariableNames',{'N','V','F_V','saiSo'});