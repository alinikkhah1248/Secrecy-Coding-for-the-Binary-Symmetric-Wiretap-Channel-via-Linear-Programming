%this mfile creates diffrent and random distribution spaces and
%compares theirs entropty with eachother
%notice that here we dont have a channel
%we dont make a basic coset to transform it into the 2^n Zs
%and there is no XOR here
%here we make different distributions and compare them togheter
%but it is written for any "n" and you can change it 
%and because of that it is not very fast
%it compares for all p our optimum answer of distribution
%with other random ones
%here we are more working with piq terms other than codewords
clear all
clc
n=5;  %you can change it
k=n-1;   %considers the k
adad=2^n;  %considers the number of all piq terms 
syms pp   %takes pp as the symbolic variable to make piq terms symbolically
qq=1-pp;    %makes q symbolically
for l=0:n
    x(l+1)=(qq^(n-l))*(pp^l);   %making n+1 different piq terms symbolically 
end
t1=0;  
t2=0;
for t=1:n+1    
    t2=nchoosek(n,t-1)+t1;  
    a(t1+1:t2)=x(t);    %now we want to make 2^n of them in order
    t1=t2;
end
aa=a;
tt=1;
bbi(1,:)=a(1,:);  %we put the first one which is in order to be used later
tedad=11;        %how many random distribution we want to observe
for j=2:tedad  %we want to put the other ones randomly
    aa=a;
for i=1:adad
    s=ceil((adad-(i-1))*rand);  %here every time we pick a number randomly 
   bbi(j,i)=aa(s);             %between 1 to the number of numbers which are left!
   aa(s)=[];  %we consider the selected number gone and shift left all the cells
end
end
%we have made our random combination and we want to draw them
for o=1:tedad
    for i=1:51         %number of our p
        ppi=(i-1)/100;    %making them in right scale
        bb=subs(bbi,pp,ppi);  %substituting symboloc piq terms with real p and q 
        fff=0;
  for l=1:adad/2
            fff=entropy(bb(o,l)+bb(o,adad-l+1))+fff;  %calculateing...
  end         %the entropy of those combinations by considering the piq terms
     f(i)=fff;   %for each p puts the value
    end  
    ppp=0:0.01:0.5;  %we want to have plot
    hold on
    if o==1        %i said before that we want to save in first row...
        plot(ppp,f,'r');  %the optimum combination, now we plot it with a differrent color
    else plot(ppp,f,'b');  %plot others with default blue
    end 
    o    %indicates where the program is in iterations for plot
end   %ends the iterations