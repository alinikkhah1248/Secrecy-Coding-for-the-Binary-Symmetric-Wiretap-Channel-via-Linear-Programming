function [um] = MatrixConfirmation(A,B)
%clc
%clear % a code which takes two matrices and determines if they are 
      % alike or not arraywise.
      
%a=[1,2,1,1;
  %  2,4,6,8;
  %  9,3,18,4;
  %  4,12,8,14];

 % b=[4,3,18,9;
  %  12,4,14,8;
  %  4,2,8,6;
  %  1,1,1,2];
    

um=0;
j=1;
if row(A)==row(B)
    while j <= row(B)
     if ArrayConfirmation(A(1,:),B(j,:))==1
         A(1,:)=[];
         B(j,:)=[];
         um=1;
         j=1;
     else j=j+1;
         um=0;
     end
    end
else um=0;
end
if um==1
   disp("matche")
else disp("no matche")
end
end

