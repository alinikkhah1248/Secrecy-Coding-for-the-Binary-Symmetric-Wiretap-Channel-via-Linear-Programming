clear 
clc
n=15;

l=12; %do not alter it   %for even $n$s
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
for i=2:n
g(i,i)=0;
end

h=zeros(n,k);
h(1,:)=1;
h(:,1)=1;
for i=1:k
    h(i,i)=1;
end
if rem(n,2)==0
    h(1,1)=0;
end



for i=1:2^k
x(:,:,i)=rem(sv(:,:,i)*g,2);
end

for i=1:2^k
xx(:,:,i)=x(:,:,i)';
end
r=sum(xx);

 for i=1:2^k
     rrr(i,:)=r(:,:,i);
 end
    

for i=1:2^k
xxx(:,:,i)=rem(x(:,:,i)*h,2);
end