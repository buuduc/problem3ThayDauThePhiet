
function result = naturalSpline(X,Y)

h=[];
h_y=[];
for k=2:length(X)
    h=[h X(k)-X(k-1)];
    h_y=[h_y Y(k)-Y(k-1)];
end
%% tao ma tran A
A=[1];
for k = 1:length(h)-1;
    A(k+1,[k,k+1,k+2])=[h(k) 2*(h(k)+h(k+1)) h(k+1)];
end
A(length(X),length(X))=1;
%% tao ma tran B
B=[];
for k=1:length(h_y)-1
    B=[B;3*(h_y(k+1)/h(k+1)-h_y(k)/h(k))];
end
B=[0;B;0];
C=inv(A)*B;
%%  tim cac he so cua da thuc
result=[];
for k=1:length(C)-1
    a=Y(k);
    b=(Y(k+1)-Y(k))/h(k)-(h(k)*(C(k+1)+2*C(k) ))/3;
    d=(C(k+1)-C(k))/(3*h(k));
    result(k,[1,2,3,4])=[a b C(k) d];

end
