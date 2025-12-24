clc
clear

C=cell(10,2);

for i=1:10
    
C{i,1}=i;
C{i,2}=[10*i,20*i;
        30*i,40*i];

end

C{11,1}=11;
C{11,2}=1000; 