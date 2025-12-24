function [ua] = ArrayConfirmation(a,b)
%clc
%clear % a code which takes two array and determines if they are 
      % alike or not elementwise.
      
%a=[1,2,1,1,3];
%b=[1,1,1,2,3];

ua=0;
j=1;
if length(a)==length(b)
    while j <= length(b)
     if a(1)==b(j)
         a(1)=[];
         b(j)=[];
         ua=1;
         j=1;
     else j=j+1;
         ua=0;
     end
    end
else ua=0;
end
if ua==1
   %disp("matche");
else %disp("no matche");
end
end

