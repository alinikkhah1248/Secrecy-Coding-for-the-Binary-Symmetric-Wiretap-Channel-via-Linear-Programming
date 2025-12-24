clear
clc

for p=0.01:0.01:0.5
% p=0.22;
q=1-p
n=5;
k=n-3;
a=0:n;
e=8;

b=innersolvefinal(8,a);


tt=size(b);
tt=tt(1,1);
 
for i=1:tt
ff(i)=((q.^b(i,1)).*(p.^(n-b(i,1))))  +  ((q.^b(i,2)).*(p.^(n-b(i,2))))+  ((q.^b(i,3)).*(p.^(n-b(i,3))))+  ((q.^b(i,4)).*(p.^(n-b(i,4)))) +   ((q.^b(i,5)).*(p.^(n-b(i,5))))  +  ((q.^b(i,6)).*(p.^(n-b(i,6))))+  ((q.^b(i,7)).*(p.^(n-b(i,7))))+  ((q.^b(i,8)).*(p.^(n-b(i,8))));
f(i,1)=se(ff(i));
end
 
for i=0:n
    h(i+1)=nchoosek(n,i);
end
 
beq=h';
beq(n+2,1)=2^k;

d=size(b);

for i=1:tt
    hh=h;
    w=0;
    u=1;
    while u==1
for j=1:8
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
        for kk=1:8
        if b(j,kk)==i-1;
        xx=xx+1;
        end
Aeq(i,j)=xx;
        end
    end
end
Aeq(n+2,:)=ones(1,tt);


A=[zeros(tt,1)]';
bb=0;
clearvars x
x = linprog(-f,A,bb,Aeq,beq,lb,ub);

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

% ery=round(x);
% load Entropy_values
Entropy_values(round((100*p)+1))=f'*x;
clearvars -except Entropy_values
save Entropy_values
end
%f'*ery

% load r
%  %r=round(x);
% %
% sav=f'*r;
% clearvars -except isavesh r