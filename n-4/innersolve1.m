function [output1] = innersolve1(n,a)
oo=1;
g = nchoosek(a,1);
for i=1:length(g)
output1(oo,1:n)=g(i);
oo=oo+1;
end
end

