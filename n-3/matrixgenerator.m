clear 
clc
n=4;


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


g=ones(n,n);
for i=1:k
g(i,i)=0;
end

% g=ones(n,n);
% for i=1:n-1
% g(i,i)=0;
% end

% g=[1,0,0,0;
%    1,1,0,0;
%    1,0,1,0;
%    1,1,1,1];
h=[1;1;1;1];
% h=zeros(n,k);
% h(n,:)=1;
% for i=1:k
%     h(i,i)=1;
% end

% g=ones(n,n);
% for i=2:n
% g(i,i)=0;
% end



% if n==4
% g=[1,1,1,1;   % g dorost for n=4 , k=1
%    1,0,1,1;
%    1,1,0,1;
%    1,1,1,0]
% end
% 
% if n==5
% g=[1,0,0,0,1;
%    1,1,0,0,0;
%    1,1,1,0,0;
%    1,0,0,1,0;
%    1,1,1,1,1]
% end


% g=[1,0,0,0,0;
%    1,1,0,0,0;
%    0,0,1,0,0;
%    1,0,0,1,0;
%    1,1,1,1,1]

% if n==6
% g=[1,1,1,1,1,0;
%    1,0,1,1,1,0;
%    1,1,0,1,1,0;
%    1,1,1,0,1,0;
%    1,1,1,1,0,0;
%    1,1,1,1,1,1];
% end

% if n==4
% h=[1;  
%    1;
%    1;
%    1];
% end

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
     rrr(i,:)=r(:,:,i);
 end
    

for i=1:2^k
xxx(:,:,i)=rem(x(:,:,i)*h,2);
end
xxx