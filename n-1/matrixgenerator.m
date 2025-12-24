clear 
clc
n=5;
l=1;
k=n-l;
s = dec2bin(2^k-1:-1:0)-'0';
v = dec2bin(2^l-1:-1:0)-'0';
s = flipud(s);
v = flipud(v);

for i=1:2^k
    for j=1:2^l
        sv(j,:,i)=[s(i,:),v(j,:)];
    end
end



    
g=ones(n,n);
for i=1:k
g(i,i)=0;
end





h=zeros(n,k);
h(n,:)=1;
for i=1:k
    h(i,i)=1;
end





for i=1:2^k
x(:,:,i)=rem(sv(:,:,i)*g,2);
end

for i=1:2^k
xx(:,:,i)=x(:,:,i)';
end
r=sum(xx);


for i=1:2^k
xxx(:,:,i)=rem(x(:,:,i)*h,2);
end