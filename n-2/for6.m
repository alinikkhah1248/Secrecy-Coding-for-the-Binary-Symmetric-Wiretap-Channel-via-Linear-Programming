clear
n=6;
p=0.1;
q=1-p;




ae=0:2^n-1;
z = de2bi(ae);
z=fliplr(z);


tedad=100;

for o=1:tedad
    rr=randperm(64);
    for e=1:64
        c(e,:)=z(rr(e),:);
    end

    

ttt=[0,0,0;
     0,1,1;
     1,1,0;
     1,0,1;
    
     1,1,1;
     1,0,0;
     0,0,1;
     0,1,0];

for fph=3:n
    if fph==3
        c=repmat(ttt,1,1);
    else ttt=[];
ttt=c;
c=[];
c=repmat(ttt,2,1);
    end
for i=1:2^fph
    re=rem(i,2);
    if i<=(2^fph)/2
        if re==1
            c(i,fph)=0;
        else c(i,fph)=1;
        end
    else
        if re==1
            c(i,fph)=1;
        else c(i,fph)=0;
        end
    end
end

end





for j=1:64
for i=1:64
h(i,:,j)=xor(c(i,:),z(j,:));
end
end
for j=1:64
t(:,:,j)=h(:,:,j)';
f(1,:,j)=sum(t(:,:,j));
end

for j=1:64
for i=1:4:64
k(i)=se(((q^(n-f(1,i,j)))*(p^(f(1,i,j))))+((q^(n-f(1,i+1,j)))*(p^(f(1,i+1,j))))+((q^(n-f(1,i+2,j)))*(p^(f(1,i+2,j))))+((q^(n-f(1,i+3,j)))*(p^(f(1,i+3,j)))));
end
fg(j)=sum(k);
end
w(o)=sum(fg)/64;
vv(:,:,o)=c;
end
[value,cell]=max(w)
vvo=vv(:,:,cell)'
sum(vvo)