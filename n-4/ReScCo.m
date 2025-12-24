clear                      %this code combined with HfRcScCo made up Best CD Maker
clc
n=5;
l=4;  %do not change it
k=n-4;



ttt=[0,0,0,0,0;   %javabe behine
     0,0,1,1,0;
     0,1,1,0,0;
     1,1,0,0,0;
     1,0,0,1,0;
     1,0,1,0,0;
     0,1,0,1,0;
     1,1,1,1,0;
     0,0,0,1,1;
     0,0,1,0,1;
     0,1,0,0,1;
     1,0,0,0,1;
     0,1,1,1,1;
     1,0,1,1,1;
     1,1,0,1,1;
     1,1,1,0,1;
 
     0,0,0,0,1;   
     0,0,1,1,1;
     0,1,1,0,1;
     1,1,0,0,1;
     1,0,0,1,1;
     1,0,1,0,1;
     0,1,0,1,1;
     1,1,1,1,1;
     0,0,0,1,0;
     0,0,1,0,0;
     0,1,0,0,0;
     1,0,0,0,0;
     0,1,1,1,0;
     1,0,1,1,0;
     1,1,0,1,0;
     1,1,1,0,0];
     

for fph=l+1:n
  if fph==l+1
      c=repmat(ttt,1,1);
  else
      c=repmat(c,2,1);
  end
  if fph~=l+1
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
for i=1:2^l:2^n
s(i:i+ ((2^l)-1) )
end
