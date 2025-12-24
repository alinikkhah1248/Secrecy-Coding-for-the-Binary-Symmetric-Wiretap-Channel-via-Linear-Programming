%this program is fixed for n=5
%so its requairments for optimization are givven manually
clear all
p=0.1;   %giving p
n=5;     %giving n
q=1-p;     %calculating q
%here we want to manually give the points
f=[ -((p.^0).*(q.^(n-0))+(p.^0).*(q.^(n-0))).*log2((p.^0).*(q.^(n-0))+(p.^0).*(q.^(n-0)));
    -((p.^0).*(q.^(n-0))+(p.^1).*(q.^(n-1))).*log2((p.^0).*(q.^(n-0))+(p.^1).*(q.^(n-1)));
    -((p.^0).*(q.^(n-0))+(p.^2).*(q.^(n-2))).*log2((p.^0).*(q.^(n-0))+(p.^2).*(q.^(n-2)));
    -((p.^0).*(q.^(n-0))+(p.^3).*(q.^(n-3))).*log2((p.^0).*(q.^(n-0))+(p.^3).*(q.^(n-3)));
    -((p.^0).*(q.^(n-0))+(p.^4).*(q.^(n-4))).*log2((p.^0).*(q.^(n-0))+(p.^4).*(q.^(n-4)));
    -((p.^0).*(q.^(n-0))+(p.^5).*(q.^(n-5))).*log2((p.^0).*(q.^(n-0))+(p.^5).*(q.^(n-5)));
    -((p.^1).*(q.^(n-1))+(p.^1).*(q.^(n-1))).*log2((p.^1).*(q.^(n-1))+(p.^1).*(q.^(n-1)));
    -((p.^1).*(q.^(n-1))+(p.^2).*(q.^(n-2))).*log2((p.^1).*(q.^(n-1))+(p.^2).*(q.^(n-2)));
    -((p.^1).*(q.^(n-1))+(p.^3).*(q.^(n-3))).*log2((p.^1).*(q.^(n-1))+(p.^3).*(q.^(n-3)));
    -((p.^1).*(q.^(n-1))+(p.^4).*(q.^(n-4))).*log2((p.^1).*(q.^(n-1))+(p.^4).*(q.^(n-4)));
    -((p.^1).*(q.^(n-1))+(p.^5).*(q.^(n-5))).*log2((p.^1).*(q.^(n-1))+(p.^5).*(q.^(n-5)));
    -((p.^2).*(q.^(n-2))+(p.^2).*(q.^(n-2))).*log2((p.^2).*(q.^(n-2))+(p.^2).*(q.^(n-2)));
    -((p.^2).*(q.^(n-2))+(p.^3).*(q.^(n-3))).*log2((p.^2).*(q.^(n-2))+(p.^3).*(q.^(n-3)));
    -((p.^2).*(q.^(n-2))+(p.^4).*(q.^(n-4))).*log2((p.^2).*(q.^(n-2))+(p.^4).*(q.^(n-4)));
    -((p.^2).*(q.^(n-2))+(p.^5).*(q.^(n-5))).*log2((p.^2).*(q.^(n-2))+(p.^5).*(q.^(n-5)));
    -((p.^3).*(q.^(n-3))+(p.^3).*(q.^(n-3))).*log2((p.^3).*(q.^(n-3))+(p.^3).*(q.^(n-3)));
    -((p.^3).*(q.^(n-3))+(p.^4).*(q.^(n-4))).*log2((p.^3).*(q.^(n-3))+(p.^4).*(q.^(n-4)));
    -((p.^3).*(q.^(n-3))+(p.^5).*(q.^(n-5))).*log2((p.^3).*(q.^(n-3))+(p.^5).*(q.^(n-5)));
    -((p.^4).*(q.^(n-4))+(p.^4).*(q.^(n-4))).*log2((p.^4).*(q.^(n-4))+(p.^4).*(q.^(n-4)));
    -((p.^4).*(q.^(n-4))+(p.^5).*(q.^(n-5))).*log2((p.^4).*(q.^(n-4))+(p.^5).*(q.^(n-5)));
    -((p.^5).*(q.^(n-5))+(p.^5).*(q.^(n-5))).*log2((p.^5).*(q.^(n-5))+(p.^5).*(q.^(n-5)));];
Aeq=[2,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;      %we are forming Aeq
     0,1,0,0,0,0,2,1,1,1,1,0,0,0,0,0,0,0,0,0,0;
     0,0,1,0,0,0,0,1,0,0,0,2,1,1,1,0,0,0,0,0,0;
     0,0,0,1,0,0,0,0,1,0,0,0,1,0,0,2,1,1,0,0,0;
     0,0,0,0,1,0,0,0,0,1,0,0,0,1,0,0,1,0,2,1,0;
     0,0,0,0,0,1,0,0,0,0,1,0,0,0,1,0,0,1,0,1,2;
     1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1];
beq=[1,5,10,10,5,1,16]';    %forming beq
lb=[0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0]; %forming lower bound
ub=[0;1;1;1;1;1;2;5;5;5;0;5;10;5;1;5;5;1;2;1;0];  %forming upper bound
%%%%%%
display('CVX solves')
cvx_begin       %begins cvx
num=21;  %number og variables
variable x(num)   %considering variables
maximize( f'*x )    %maximizing objective function
subject to
lb <= x <= ub;    %constraints
beq-eps<=Aeq*x<=beq;  %Aeq*x==beq   %explained at the end of the report   %constraints
cvx_end       %ends cvx
x_CVX=x     %displays the answer
%%%%%%%
display('linprog solves')
%A and b below are sth extra that linprog needs when for initializing that in our problem they should be zero
A=[0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0]';   %this is sth extra that linprog needs
b=0;  %this is sth extra that linprog needs
x_linprog = linprog(-f,A,b,Aeq,beq,lb,ub)   %linprog also solves our problem and displays the answer
x_linprog'*f