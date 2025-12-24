% p=0.1;
% q=1-p;         this is for n=6 and k=3
hold on
clear
n=6;

ae=0:2^n-1;
z = de2bi(ae);
z=fliplr(z);

y=0:0.01:0.5;


%  hold on   %we want to draw Shannon limit too
 k=n-3;       %giving k=n-3
for i=1:51   %for each p
    u(i)=Hfunc((i-1)/100); %calculates the hfunction of p (as one shannon limit for this channel)
    if u(i)>(k/n)  %calculates k/n as another shannon limit and says consider the minimum between these two limits
        u(i)=(k/n);   %consider k/n if it was smaller
    end  %ends the if
end    %end this prosses of shannon limit considration
y=0:0.01:0.5;
plot(y,u,'k')  %plot Shannon limit with black color
hold on

% load isavesh

% plot(p,isavesh/5,'g');

tedad=1;

for o=1:tedad
    o
    rr=randperm(2^n);
    for e=1:2^n
        c(e,:)=z(rr(e),:);
    end

 if o==1


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
c=Best_CD_Maker(6,3);



end




for j=1:2^n
for i=1:2^n
h(i,:,j)=xor(c(i,:),z(j,:));
end
end

for j=1:2^n
t(:,:,j)=h(:,:,j)';
f(1,:,j)=sum(t(:,:,j));
end

for pp=1:51
    p=(pp-1)/100;
    q=1-p;



for j=1:2^n
for i=1:8:2^n
    aaa=0;
    for uy=0:7
         aaa=((q^(n-f(1,i+uy,j)))*(p^(f(1,i+uy,j))))+aaa;  %+((q^(n-f(1,i+1,j)))*(p^(f(1,i+1,j))))+((q^(n-f(1,i+2,j)))*(p^(f(1,i+2,j))))+((q^(n-f(1,i+3,j)))*(p^(f(1,i+3,j))))
    end
    k(i)=se(aaa);
end
fg(j)=sum(k);
end
% w(o)=sum(fg)/32;
w(pp)=sum(fg)/2^n;
% ww=w/n;
%vv(:,:,o)=c;

if pp==21
    tashkhis(o)=w(pp)/n;
    sdg(:,:,o)=c;
end

end
ww=w/n;


%[value,cell]=max(ww);
%vvo=vv(:,:,cell)'
%sum(vvo)
%maghadir(pp)=value;

hold on
p=0:0.01:0.5;
if o==1
plot(p,ww,'g');
else plot(p,ww);
end

end


[value,cell]=max(tashkhis)

% legend('Shannon and entropy limit','our limit','The optimum one','The random ones');
% xlim([0 0.5]);
% ylim([0 0.65]);
% ylabel('$\displaystyle{\frac{1}{n}H(M|Z^n)}$','interpreter','latex')
% xlabel('$\displaystyle{p}$','interpreter','latex')