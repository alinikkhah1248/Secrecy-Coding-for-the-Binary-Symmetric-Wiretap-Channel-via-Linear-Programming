%HugeNumber
clear 
clc
k=1;
l=4;
n=l+k;
e=2^l;
s=1;
for i=1:2^k
    s=s*nchoosek(e*i-1,e-1);
end
s