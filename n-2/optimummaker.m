n=7;

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
cc=c';
s=size(c);
ccc=sum(cc)
