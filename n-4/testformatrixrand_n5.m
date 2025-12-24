clc
clear all
n=6;
df=1;
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
emt=0;
while df==1 
    
  g1 = randi([0 1], 4,5 );
  g=g1;
    g=[g1;      
        1,1,1,1,1];
    
 if n==5
    g=[1,1,1,1,1;   % g dorost for n=5 , k=1
       1,0,1,1,1;
       1,1,0,1,1;
       1,1,1,0,1;
       1,1,1,1,0];
 end
 
 if n==6
     g=randi([0 1],6,6);


     



 end
 
 
    for i=1:2^k
        x(:,:,i)=rem(sv(:,:,i)*g,2);
    end
    
    for i=1:2^k
        xx(:,:,i)=x(:,:,i)';
    end
    r=n-sum(xx);
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%% H section    
%     if n==5
%     h=[1;
%        1;
%        1;
%        1;
%        1];
%     end
%     
%     if n==6
%     h=[0,1;
%        1,1;
%        1,0;
%        1,0;
%        1,0;
%        1,0];
%     end
    
% for i=1:2^k
% xxx(:,:,i)=rem(x(:,:,i)*h,2);
% end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    for j=1:4
    for i=1:16
        if r(1,i,j)==0
u=j;
        end
    end
    end
    
    
    cont_0=0;
    for i=1:16
        if r(1,i,u)==0
           cont_0=cont_0+1;
        end
    end
    
    cont_2=0;
    for i=1:16
        if r(1,i,u)==2
           cont_2=cont_2+1;
        end
    end
    
    cont_3=0;
    for i=1:16
        if r(1,i,u)==3
           cont_3=cont_3+1;
        end
    end
    
    
    cont_4=0;
    for i=1:16
        if r(1,i,u)==4
           cont_4=cont_4+1;
        end
    end
    
    cont_5=0;
    for i=1:16
        if r(1,i,u)==5
           cont_5=cont_5+1;
        end
    end
    
    
    
    
    if cont_0==1 &&  cont_2==5 && cont_3==5 && cont_4==2 && cont_5==3
        df=0;
    end  
    

    
    emt=emt+1
    end