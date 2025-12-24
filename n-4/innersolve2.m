function [output2] = innersolve2(n,a)
solve=2;
o(1:solve-1)=1;
neshan(1:solve-1)=0;
g = nchoosek(a,solve);
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
                        
                      
                        
                      
                        
                        if tt==1
                            is=innersolve1(n-(solve*u),g(i,:));
                        end
                        
                        
                        
                        if n-(solve*u)==0
                            dd=1;
                        else
                            d=size(is);
                            dd=d(1,1);
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



output2=[output1];
end

