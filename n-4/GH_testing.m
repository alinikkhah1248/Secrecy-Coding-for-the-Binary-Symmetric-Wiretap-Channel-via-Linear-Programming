clear 
clc
n=5;


l=4; %do not alter it
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



if n==4
g=[1,0,0,0;   % g dorost for n=4 , k=1
   1,1,0,0;
   1,0,1,0;
   1,1,1,1]
end

% if n==5
% g=[1,0,0,0,1;
%    1,1,0,0,0;
%    1,1,1,0,0;
%    1,0,0,1,0;
%    1,1,1,1,1]
% end
% 
% if n==5
% h=[1,0,0,0;
%    0,1,0,0;
%    0,0,1,0;
%    0,0,0,1;
%    1,1,1,1]
% end



% g=[1,0,0,0,0;
%    1,1,0,0,0;
%    0,0,1,0,0;
%    1,0,0,1,0;
%    1,1,1,1,1]

if n==6
g=[1,1,1,1,1,0;
   1,0,1,1,1,0;
   1,1,0,1,1,0;
   1,1,1,0,1,0;
   1,1,1,1,0,0;
   1,1,1,1,1,1];
end

if n==5
h=[1;  
   1;
   1;
   1;
   1];
end

% if n==5
%     h=[randi([0,1]),1;
%        randi([0,1]),0;
%        randi([0,1]),1;
%        randi([0,1]),1;
%        randi([0,1]),1];
% end    
    
    
    
for i=1:2^k
x(:,:,i)=rem(sv(:,:,i)*g,2);
end

for i=1:2^k
xx(:,:,i)=x(:,:,i)';
end
r=n-sum(xx)


for i=1:2^k
xxx(:,:,i)=rem(x(:,:,i)*h,2);
end
xxx