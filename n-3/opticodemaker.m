clear 
clc
n=5;

ttt=[0,0,0,0;
     0,0,1,1;
     0,1,1,0;
     1,1,0,0;
     1,0,0,1;
     1,0,1,0;
     0,1,0,1;
     1,1,1,1;
    
     0,0,0,1;
     0,0,1,0;
     0,1,0,0;
     1,0,0,0;
     0,1,1,1;
     1,0,1,1;
     1,1,0,1;
     1,1,1,0];

for fph=4:n
  if fph==4
      c=repmat(ttt,1,1);
  else
      c=repmat(c,2,1);
  end
  if fph~=4
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
end




cc=c';
ss=sum(cc);
s=n-ss;
for i=1:8:2^n
s(i:i+7)
end
