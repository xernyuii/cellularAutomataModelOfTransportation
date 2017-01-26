function [plaza,v_cars,type] = switch_lanes(plaza,v_cars,type)
global SPEEDDOWNNUM;
global GETOUTITEM;
global CHANGELINENUM;
prob1 = 1;
prob2 = 0.5;
[L,W] = size(plaza);
for i = (L-1):-1:1
    for j = 2:(W-1)
        if plaza(i,j) == -2
            SPEEDDOWNNUM(GETOUTITEM)=SPEEDDOWNNUM(GETOUTITEM)+1;
            if rand < prob2 
                if rand > 0.5 
                    if plaza(i, j-1) == 0 
                        CHANGELINENUM(GETOUTITEM)=CHANGELINENUM(GETOUTITEM)+1;
                        plaza(i, j-1) = 1;
                        plaza(i, j) = 0;
                        v_cars(i,j-1)=0;
                        v_cars(i,j)=0;
                        type(i,j-1)=type(i,j);
                        type(i,j)=0;
                    elseif plaza(i, j+1) == 0
                        CHANGELINENUM(GETOUTITEM)=CHANGELINENUM(GETOUTITEM)+1;
                        plaza(i, j+1) = 1;
                        plaza(i,j) = 0;
                        v_cars(i,j+1)=0;
                        v_cars(i,j)=0;
                        type(i,j+1)=type(i,j);
                        type(i,j)=0;
                    else
                        plaza(i,j) = 1;
                    end
                else
                    if plaza(i, j+1) == 0
                        CHANGELINENUM(GETOUTITEM)=CHANGELINENUM(GETOUTITEM)+1;
                        plaza(i,j+1) = 1;
                        plaza(i,j) = 0;
                        v_cars(i,j+1)=0;
                        v_cars(i,j)=0;
                        type(i,j+1)=type(i,j);
                        type(i,j)=0;
                    elseif plaza(i, j-1) == 0
                        CHANGELINENUM(GETOUTITEM)=CHANGELINENUM(GETOUTITEM)+1;
                        plaza(i, j-1) = 1;
                        plaza(i,j) = 0;
                        v_cars(i,j-1)=0;
                        v_cars(i,j)=0;
                        type(i,j-1)=type(i,j);
                        type(i,j)=0;
                    else
                        plaza(i,j) = 1;
                    end
                end
            else
                plaza(i,j) = 1;
            end
        end
         if plaza(i,j) == -1
            SPEEDDOWNNUM(GETOUTITEM)=SPEEDDOWNNUM(GETOUTITEM)+1;
            CHANGELINENUM(GETOUTITEM)=CHANGELINENUM(GETOUTITEM)+1;
            if rand < prob1 
                gc=sy_cars(plaza,i,j);
                if rand > 0.5 
                    if plaza(i, j-1) == 0 &&gc(1)>=0
                        plaza(i, j-1) = 1;
                        plaza(i, j) = 0;
                        v_cars(i,j-1)=0;
                        v_cars(i,j)=0;
                        type(i,j-1)=type(i,j);
                        type(i,j)=0;
                    elseif plaza(i, j+1) == 0&&gc(3)>=0
                        plaza(i, j+1) = 1;
                        plaza(i,j) = 0;
                        v_cars(i,j+1)=0;
                        v_cars(i,j)=0;
                        type(i,j+1)=type(i,j);
                        type(i,j)=0;
                    else
                        plaza(i,j) = 1;
                        v_cars(i,j)=0;
                    end
                else
                    if plaza(i, j+1) == 0&&gc(3)>=0
                        plaza(i,j+1) = 1;
                        plaza(i,j) = 0;
                        v_cars(i,j+1)=0;
                        v_cars(i,j)=0;
                        type(i,j+1)=type(i,j);
                        type(i,j)=0;
                    elseif plaza(i, j-1) == 0&&gc(1)>=0
                        plaza(i, j-1) = 1;
                        plaza(i,j) = 0;
                        v_cars(i,j-1)=0;
                        v_cars(i,j)=0;
                        type(i,j-1)=type(i,j);
                        type(i,j)=0;
                    else
                        plaza(i,j) = 1;
                        v_cars(i,j)=0;
                    end
                end
            else
                plaza(i,j) = 1;
            end
        end
        
    end
end