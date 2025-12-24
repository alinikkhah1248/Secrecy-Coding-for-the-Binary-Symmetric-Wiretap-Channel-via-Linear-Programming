clc
clear all
n=4;
df=1;
l=3; %do not alter it
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
emt=0;

    
  g1 = randi([0 1], 4,4 );
    g=g1;

%     g=[1,1,1,0;   % g dorost for n=4 , k=1
%        1,0,1,0;
%        1,1,0,0;
%        1,1,1,1];
    
    for i=1:2^k
        x(:,:,i)=rem(sv(:,:,i)*g,2);
    end
    
    for i=1:2^k
        xx(:,:,i)=x(:,:,i)';
    end
    r=n-sum(xx);
    
 