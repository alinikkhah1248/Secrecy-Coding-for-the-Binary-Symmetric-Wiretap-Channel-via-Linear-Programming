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
while df==1 
    
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
    
    con_1=0;
    con_2=0;
    
    c_0=0;
    c_2=0;
    c_4=0;

    for uu=1:8
        
        if r(1,uu,1)==0
            c_0=c_0+1;
        end
        
        if r(1,uu,1)==2
            c_2=c_2+1;
        end
            
        if r(1,uu,1)==4
            c_4=c_4+1;
        end
    
   
    end
    
     if c_0==1 && c_2==6 && c_4==1
        con_1=1;
    end
    
    
    c_1=0;
    c_3=0;

    for uu=1:8
        
        if r(1,uu,2)==1
            c_1=c_1+1;
        end
        
        if r(1,uu,2)==3
            c_3=c_3+1;
        end     
    
    end
    
    if c_1==4 && c_3==4
        con_2=1;
    end
    
    
    if con_1==1 && con_2==1
       gg(:,:,df)=g;
        df=df+1; 
    end
    
    df
    emt=emt+1;
end
emt
r
g