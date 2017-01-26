function[plaza,v_cars,type]= change_v(plaza,v_cars,type)
global GETOUTNUM;
global GETOUTITEM;
global CHANGELINENUM;
vmaxh=3;
vmaxl=2;
alfa=1;
[L, W] = size(plaza); %get its dimensions
for i = (L-1):-1:((L + 1)/2 + 1)
    for j = 1:W
        if plaza(i,j) == 1
            gc=sy_cars(plaza,i,j);
            [a,b]=size(gc);
           if [a,b]==[0,0]
              v_cars(i,j)=0;
              plaza(i,j)=0;
              type(i,j)=0;
              GETOUTNUM(GETOUTITEM)=GETOUTNUM(GETOUTITEM)+1;
              continue
           end
           if gc(1)+gc(3)>gc(2)
            if rand<0.5
              if gc(1)>alfa*gc(2)
                  CHANGELINENUM(GETOUTITEM)=CHANGELINENUM(GETOUTITEM)+1;
                  v_cars(i,j-1)=v_cars(i,j);
                  plaza(i,j-1)=plaza(i,j);
                  v_cars(i,j)=0;
                  plaza(i,j)=0;
                  type(i,j-1)=type(i,j);
                  type(i,j)=0;
                  continue
              elseif gc(3)>alfa*gc(2)
                  CHANGELINENUM(GETOUTITEM)=CHANGELINENUM(GETOUTITEM)+1;
                  v_cars(i,j+1)=v_cars(i,j);
                  plaza(i,j+1)=plaza(i,j);
                  v_cars(i,j)=0;
                  plaza(i,j)=0;
                  type(i,j+1)=type(i,j);
                  type(i,j)=0;
                  continue
              end
            else
                if gc(3)>alfa*gc(2)
                  CHANGELINENUM(GETOUTITEM)=CHANGELINENUM(GETOUTITEM)+1;
                  v_cars(i,j+1)=v_cars(i,j);
                  plaza(i,j+1)=plaza(i,j);
                  v_cars(i,j)=0;
                  plaza(i,j)=0;
                  type(i,j+1)=type(i,j);
                  type(i,j)=0;
                  continue
              elseif gc(1)>alfa*gc(2)
                  CHANGELINENUM(GETOUTITEM)=CHANGELINENUM(GETOUTITEM)+1;
                  v_cars(i,j-1)=v_cars(i,j);
                  plaza(i,j-1)=plaza(i,j);
                  v_cars(i,j)=0;
                  plaza(i,j)=0;
                  type(i,j-1)=type(i,j);
                  type(i,j)=0;
                  continue
                end
            end
           end
           gs=v_cars(i,j);
           if gc(2)<=gs
              if gc(2)>0
                 v_cars(i,j)=max(0,v_cars(i,j)-2);
              else
                  if plaza(i+1,j)==-888
                      plaza(i,j)=-1;
                      v_cars(i,j)=0;
                  else
                  plaza(i,j)=-2;
                  v_cars(i,j)=0;
                  end
                  continue
              end
           elseif rand<gs/(gs+0.8*gc(2))
             dv=0;
             v_cars(i,j)=v_cars(i,j)+dv;
           else
             dv=1;
             if type(i,j)==2
                 v_cars(i,j)=min(v_cars(i,j)+dv,vmaxl);
             else
                 v_cars(i,j)=min(v_cars(i,j)+dv,vmaxh);
             end
           end
          

        end
    end
end

for i = (L-1)/2:-1:1

    for j = 1:W
        if plaza(i,j) == 1
           gc=sy_cars(plaza,i,j);
           gs=v_cars(i,j)+1;
           if gc(1)+gc(3)>2*gc(2)
            if rand>0.5
              if gc(1)>alfa*gc(2)
                  CHANGELINENUM(GETOUTITEM)=CHANGELINENUM(GETOUTITEM)+1;
                  v_cars(i,j-1)=v_cars(i,j);
                  plaza(i,j-1)=plaza(i,j);
                  v_cars(i,j)=0;
                  plaza(i,j)=0;
                  type(i,j-1)=type(i,j);
                  type(i,j)=0;
                  continue
              elseif gc(3)>alfa*gc(2)
                  CHANGELINENUM(GETOUTITEM)=CHANGELINENUM(GETOUTITEM)+1;
                  v_cars(i,j+1)=v_cars(i,j);
                  plaza(i,j+1)=plaza(i,j);
                  v_cars(i,j)=0;
                  plaza(i,j)=0;
                  type(i,j+1)=type(i,j);
                  type(i,j)=0;
                  continue
              end
            else
                if gc(3)>alfa*gc(2)
                  CHANGELINENUM(GETOUTITEM)=CHANGELINENUM(GETOUTITEM)+1;
                  v_cars(i,j+1)=v_cars(i,j);
                  plaza(i,j+1)=plaza(i,j);
                  v_cars(i,j)=0;
                  plaza(i,j)=0;
                  type(i,j+1)=type(i,j);
                  type(i,j)=0;
                  continue
              elseif gc(1)>alfa*gc(2)
                  CHANGELINENUM(GETOUTITEM)=CHANGELINENUM(GETOUTITEM)+1;
                  v_cars(i,j-1)=v_cars(i,j);
                  plaza(i,j-1)=plaza(i,j);
                  v_cars(i,j)=0;
                  plaza(i,j)=0;
                  type(i,j-1)=type(i,j);
                  type(i,j)=0;
                  continue
                end
            end
           end

           if gc(2)<gs
              if gc(2)~=0
                 v_cars(i,j)=max(0,v_cars(i,j)-1);
              else
                  if plaza(i+1,j)== -888
                      plaza(i,j)=-1;
                      v_cars(i,j)=0;
                  else
                  plaza(i,j)=-2;
                  v_cars(i,j)=0;
                  end
                  continue
              end
              
           elseif rand<gs/(gs+0.7*gc(2))
             dv=0;
             v_cars(i,j)=v_cars(i,j)+dv;
           else
             dv=1;
             if type(i,j)==2
                 v_cars(i,j)=min(v_cars(i,j)+dv,vmaxl);
             else
                 v_cars(i,j)=min(v_cars(i,j)+dv,vmaxh);
             end
           end
          
        end
    end
end


