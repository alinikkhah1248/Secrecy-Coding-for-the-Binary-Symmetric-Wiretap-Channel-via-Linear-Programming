%this is a general program in which you can enter "n" and "p" whatever you want
%this program systematically produces requairments for optimization...
%with respect to n
clear all
n=5;     %giving n , you can change it
p=0.1;   %giving p , you can change it
q=1-p;     %calculating q
%making f vector
u=0;
for i=0:n
    for j=i:n   %making systematically all the points and hence f vector
        u=u+1;
        f(u,1)=[-((q.^i).*(p.^(n-i))+(q.^j).*(p.^(n-j))).*log2((q.^i).*(p.^(n-i))+(q.^j).*(p.^(n-j)))];
    end
end
%making Aeq
u=0;
for i=0:n
    t=0;
    for j=i:n
        u=u+1;
        if i==j
            Aeq(i+1,u)=2;
        else t=t+1;
            Aeq(i+1,u)=1;     %forming Aeq systematically
            Aeq(i+1+t,u)=1;
        end
    end
end
Aeq(n+2,:)=(ones(1,(n+1)*(n+2)/2));   %the last row should be all 1
%making beq
for i=0:n
    beq(i+1)=nchoosek(n,i); %forming beq systematically
end
beq(n+2)=(2^n)/2;   %the last component should be 2^k (or here (2^n)/2 )
beq=beq';
%making lb
lb=[zeros((n+1)*(n+2)/2,1)];   %forming lower bound systematically
u=0;
%making ub
for i=0:n
    for j=i:n
        u=u+1;
        if i==j          %forming upper bound systematically
            ub(u,1)=floor((nchoosek(n,i))/2);
        else ub(u,1)=min(nchoosek(n,i),nchoosek(n,j));
        end
    end
end
%now we are going to solve
%%%%%
display('CVX solves')
num=(n+1)*(n+2)/2;  %number og variables
cvx_begin        %begins cvx
variable x(num)   %considering variables
maximize( f'*x )    %maximizing objective function
subject to
lb <= x <= ub;    %constraints
beq-eps<=Aeq*x<=beq; %Aeq*x==beq %explained at the end of the report  %constraints
cvx_end       %ends cvx
x_CVX=x    %displays the answer
%%%%%%%
display('linprog solves')
%A and b below are sth extra that linprog needs when for initializing that in our problem they should be zero
A=[zeros((n+1)*(n+2)/2,1)]';   %this is sth extra that linprog needs
b=0;  %this is sth extra that linprog needs
x_linprog=linprog(-f,A,b,Aeq,beq,lb,ub)   %linprog also solves our problem and displays the answer
%%%%%%%%%%%%%%%%%%%%
%%%%%%%  comparing the objective function with...
%%%%%%%  3 answers of CVX , linprog and rounded of them
%         uncomment these to compare the answers

%         format long   
%         r=round(x_CVX);
%         
%         CVX_ans=f'*x_CVX
%         linprog_ans=f'*x_linprog
%         rounded_ans=f'*r
        