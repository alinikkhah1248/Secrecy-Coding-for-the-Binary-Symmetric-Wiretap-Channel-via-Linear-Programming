function [finaloutput] = innersolvefinal(n,a)
output1=innersolve1(n,a);
output2=innersolve2(n,a);
output3=innersolve3(n,a);
output4=innersolve4(n,a);
output5=innersolve5(n,a);
output6=innersolve6(n,a);
output7=innersolve7(n,a);
output8=innersolve8(n,a);
finaloutput=[output1;output2;output3;output4;output5;output6;output7;output8];
end