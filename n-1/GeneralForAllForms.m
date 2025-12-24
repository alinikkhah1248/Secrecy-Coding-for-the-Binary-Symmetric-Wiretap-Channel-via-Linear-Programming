box on
hold on

clear

l=1; %n-k  %do not alter it but you can
n=5;   %you can alter it
k=n-l;

ae=0:(2^n)-1;
z = de2bi(ae);
z=fliplr(z);

y=0:0.01:0.5;


%  hold on   %we want to draw Shannon limit too
for i=1:51   %for each p
    u(i)=Hfunc((i-1)/100); %calculates the hfunction of p (as one shannon limit for this channel)
    if u(i)>(k/n)  %calculates k/n as another shannon limit and says consider the minimum between these two limits
        u(i)=(k/n);   %consider k/n if it was smaller
    end  %ends the if
end    %end this prosses of shannon limit considration

y=0:0.01:0.5;
plot1=plot(y,u,'k','LineWidth',1.2)  %plot Shannon limit with black color
hold on


tedad=100001;

for o=1:tedad
    o;
    rr=randperm(2^n);
    for e=1:2^n
        c(e,:)=z(rr(e),:);
    end

  if o==1
c=Best_CD_Maker(n,k);
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
for i=1:(2^l):2^n
    aaa=0;
    for uy=0:(2^l)-1
         aaa=((q^(n-f(1,i+uy,j)))*(p^(f(1,i+uy,j))))+aaa;  %+((q^(n-f(1,i+1,j)))*(p^(f(1,i+1,j))))+((q^(n-f(1,i+2,j)))*(p^(f(1,i+2,j))))+((q^(n-f(1,i+3,j)))*(p^(f(1,i+3,j))))
    end
    kk(i)=se(aaa);
end
fg(j)=sum(kk);
end
w(pp)=sum(fg)/2^n;

if pp==21
    tashkhis(o)=w(pp)/n;
    sdg(:,:,o)=c;
end

end    %end of: for pp=1:51

ww=w/n;

hold on
p=0:0.01:0.5;
if o==1
plot3=plot(p,ww,'r','LineWidth',1.2);     %comment it for "limitsonly"
ww_modified=[0,ww(2:51)];
plot2=plot(p,ww_modified,'--g','LineWidth',1.2); %and draw it as limit with a different color (dotted green)
else plot4=plot(p,ww,'b','LineWidth',1.2);
end

end


[value,cell]=max(tashkhis)
asdc=sum(sdg(:,:,cell)');


% ttp=0:0.01:0.5;
% ttr=-log2(1-ttp);
% plot5=plot(ttp,ttr,'y');

%legend([plot1 plot2],'The Shannon limit','Our optimum limit'); %for limits only
legend([plot1 plot2 plot3 plot4],'Infinite blocklength limit','LP-derived limit','Ni binning code','Random binning codes','FontSize',13);
legend('Location','southeast')
xlim([0 0.5]);
ylim([0 0.82]);
ylabel('$\displaystyle{R_e}$','interpreter','latex','FontSize',10)
xlabel('$\displaystyle{p}$','interpreter','latex','FontSize',20)
set(gca,'FontSize',15)
grid on
set(gcf,'renderer','Painters');
