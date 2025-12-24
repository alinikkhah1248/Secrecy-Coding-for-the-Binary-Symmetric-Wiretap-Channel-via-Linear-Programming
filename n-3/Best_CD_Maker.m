function [c] = Best_CD_Maker(n,k)

% clc      %for script
% clear    %for script

% n=5;     %for script
% k=2;     %for script
l=n-k;


%%%%%%%%%%%%%%%%%%%%%%%%%%%% Half Recursive Scheme Coding
D=cell(l+1,1);

D{1}=[0;
      1];

for kk=1:l

c=repmat(D{kk},2,1);
                               
for i=1:(2*(2^kk))       
    
    j=ceil(i/ ((2^kk)/2) );
    

    if j==1 || j==4
c(i,kk+1)=0;
    end
    
     if j==2 || j==3
c(i,kk+1)=1;
     end
 
end

D{kk+1}=c;

end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Recursive Scheme Coding

if k~=1
    


ttt=c;
     

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
end
end

% cc=c';            %for script form
% ss=sum(cc);
% s=n-ss;
% for i=1:2^l:2^n
% s(i:i+ ((2^l)-1) )
% end
