clear
clc
p=0.14;
q=1-p;
n=3;   %changable for all forms of n and k
l=2;
k=n-l;
a=0:n;
e=2^l;

b=innersolvefinal(e,a);


tt=size(b);
tt=tt(1,1);
 
for i=1:tt
ff(i)=((q.^b(i,1)).*(p.^(n-b(i,1))))  +  ((q.^b(i,2)).*(p.^(n-b(i,2))))+  ((q.^b(i,3)).*(p.^(n-b(i,3))))+  ((q.^b(i,4)).*(p.^(n-b(i,4))));
f(i,1)=se(ff(i));
end
 
for i=0:n
    h(i+1)=nchoosek(n,i);
end
 
beq=h';
% beq(n+2,1)=2^k;

d=size(b);

for i=1:tt
    hh=h;
    w=0;
    u=1;
    while u==1
for j=1:e
y=b(i,j);
hh(y+1)=hh(y+1)-1;
end
if min(hh)>=0
    w=w+1;
else u=0;
end


    end
ub(i)=w;      
end
ub=ub';
lb=(zeros(tt,1));


for i=1:n+1
    for j=1:tt
        xx=0;
        for kk=1:e
        if b(j,kk)==i-1;
        xx=xx+1;
        end
Aeq(i,j)=xx;
        end
    end
end
% Aeq(n+2,:)=ones(1,tt);


A=[zeros(tt,1)]';
bb=0;
clearvars x
x = linprog(-f,A,bb,Aeq,beq,lb,ub)

% num=tt;
% cvx_begin
% variable x(num)
% maximize(f'*x )
% subject to
% lb <= x <= ub;
% beq<=Aeq*x<=beq;
% cvx_end

xxx=x;
ty=0;
tyc=1;
while ty==0
    if max(xxx)>0
 [c_valuesh(tyc),cells(tyc)]= max(xxx);
 xxx(cells(tyc))=0;
 tyc=tyc+1;
    else
    ty=1; 
    end
end

 ery=round(x);
% load Entropy_valuesn10k8
% Entropy_valuesn10k8(round((100*p)+1))=f'*ery;
% clearvars -except Entropy_valuesn10k8
% save Entropy_valuesn10k8
f'*ery