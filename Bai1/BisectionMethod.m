function [table,x0]=BisectionMethod(x,f,range,saiSoChoPhep)
beginPoint= range(1);
endPoint=range(2);
i=0;
table=cell(i+2,6);
table(1,:)={'Lan','begin','end','x = (a+b)/2 ','f(x)','Sai so'};
saiSo=100;
while saiSo>saiSoChoPhep
    x0=(beginPoint+endPoint)/2;
    fx=subs(f,x,x0);
    fa=subs(f,x,beginPoint);
    fb=subs(f,x,endPoint);
    saiSo= double(abs(fb-fa)/(2^(i+1)));
    table(i+2,:)={i,beginPoint,endPoint,x0,'f(x)',saiSo};
    if fx*fa<0
        endPoint=x0;
        table(i+2,5)={'+'};
    end

    if fx*fb<0
        beginPoint =x0;
        table(i+2,5)={'-'};
    end
    i=i+1;
end
