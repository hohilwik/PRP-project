function C = barray(X,k,n)
C=zeros(2^k,n);
A=zeros(1,n);
for m=1:2^k
for l=1:n
    A(1,l)=floor(X(1,m)./2^(n-l));
    X(1,m) = X(1,m)-2^(n-l)*floor(X(1,m)/2^(n-l));
    C(m,l)=A(1,l);
end
end
end