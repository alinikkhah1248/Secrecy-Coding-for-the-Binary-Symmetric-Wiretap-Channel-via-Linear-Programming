function [e] = fourcount(a,b,c,d)

aa=0;
for i=1:8    
    if a(i)==4
        aa=aa+1;
    end
end

bb=0;
for i=1:8   
    if b(i)==4
        bb=bb+1;
    end
end

cc=0;
for i=1:8
    if c(i)==4
        cc=cc+1;
    end
end

dd=0;
for i=1:8
    if d(i)==4
 dd=dd+1;
    end
end

e=[aa,bb,cc,dd];
end

