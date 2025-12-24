function [output11] = innersolve11(n,a)

solve=11;
o(1:solve-1)=1;
neshan(1:solve-1)=0;
g = combntns(a,solve);
ff=size(g);
for i=1:ff(1,1)
    
    
    for tt=1:solve-1
        
        if n~=solve || tt==solve-1
            
            u=1;
            p=1;
            while p==1
                
                if tt==solve-1
                    zeorone=0;
                else zeorone=1;
                end
                
                
                if n-(solve*u)>=zeorone
                    if n-(solve*u)>=zeorone
                        
                          if tt==10
                            is=innersolve10(n-(solve*u),g(i,:));
                          end
                        
                        if tt==9
                            is=innersolve9(n-(solve*u),g(i,:));
                        end
                        
                        if tt==8
                            is=innersolve8(n-(solve*u),g(i,:));
                        end
                        
                         if tt==7
                            is=innersolve7(n-(solve*u),g(i,:));
                        end
                        
                        
                        if tt==6
                            is=innersolve6(n-(solve*u),g(i,:));
                        end
                        
                        
                        if tt==5
                            is=innersolve5(n-(solve*u),g(i,:));
                        end
                        
                        if tt==4
                            is=innersolve4(n-(solve*u),g(i,:));
                        end
                        
                        if tt==3
                            is=innersolve3(n-(solve*u),g(i,:));
                        end
                        
                        if tt==2
                            is=innersolve2(n-(solve*u),g(i,:));
                        end
                        
                        if tt==1
                            is=innersolve1(n-(solve*u),g(i,:));
                        end
                        
                        
                        
                        if n-(solve*u)==0
                            dd=1;
                        else
                            d=size(is);
                            dd=d(1,1);
                        end
                        
                            if tt==10
                            output10(o(tt):dd+o(tt)-1,:)=[repmat(g(i,:),dd,u),is];
                            neshan(tt)=1;
                        end
                        
                        
                         if tt==9
                            output9(o(tt):dd+o(tt)-1,:)=[repmat(g(i,:),dd,u),is];
                            neshan(tt)=1;
                        end
                        
                        
                        if tt==8
                            output8(o(tt):dd+o(tt)-1,:)=[repmat(g(i,:),dd,u),is];
                            neshan(tt)=1;
                        end
                        
                        if tt==7
                            output7(o(tt):dd+o(tt)-1,:)=[repmat(g(i,:),dd,u),is];
                            neshan(tt)=1;
                        end
                        
                         if tt==6
                            output6(o(tt):dd+o(tt)-1,:)=[repmat(g(i,:),dd,u),is];
                            neshan(tt)=1;
                        end
                        
                        
                        if tt==5
                            output5(o(tt):dd+o(tt)-1,:)=[repmat(g(i,:),dd,u),is];
                            neshan(tt)=1;
                        end
                        
                        
                        
                        if tt==4
                            output4(o(tt):dd+o(tt)-1,:)=[repmat(g(i,:),dd,u),is];
                            neshan(tt)=1;
                        end
                        
                        if tt==3
                            output3(o(tt):dd+o(tt)-1,:)=[repmat(g(i,:),dd,u),is];
                            neshan(tt)=1;
                        end
                        
                        if tt==2
                            output2(o(tt):dd+o(tt)-1,:)=[repmat(g(i,:),dd,u),is];
                            neshan(tt)=1;
                        end
                        
                        if tt==1
                            output1(o(tt):dd+o(tt)-1,:)=[repmat(g(i,:),dd,u),is];
                            neshan(tt)=1;
                        end
                        
                        
                        o(tt)=o(tt)+dd;
                    else is=[];
                        p=0;
                    end
                    u=u+1;
                else p=0;
                end
            end
        end
        
    
        
    end
    
end

if neshan(1)==0
    output1=[];
end

if neshan(2)==0
    output2=[];
end

if neshan(3)==0
    output3=[];
end

if neshan(4)==0
    output4=[];
end

if neshan(5)==0
    output5=[];
end

if neshan(6)==0
    output6=[];
end

if neshan(7)==0
    output7=[];
end

if neshan(8)==0
    output8=[];
end

if neshan(9)==0
    output9=[];
end

if neshan(10)==0
    output10=[];
end

output11=[output1;output2;output3;output4;output5;output6;output7;output8;output9;output10];
end

