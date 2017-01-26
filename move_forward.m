function [new,v_carsnew,type] = move_forward(old ,v_cars,type)

new = old;
[L, W] = size(new); %get its dimensions
v_carsnew=zeros(L,W);
prob = .7;

for i = (L-1):-1:((L + 1)/2 + 1)

    for j = 1:W
        if new(i,j) == 1
           if new(i+v_cars(i,j),j)==0
           new(i,j) =0;
            new(i+v_cars(i,j),j)=1;
            type(i+v_cars(i,j),j)=type(i,j);
            type(i,j)=0;
            v_carsnew(i+v_cars(i,j),j)=v_cars(i,j);
            v_cars(i,j)=0;
            
           else
            continue
           end

        end
    end
end


global X_rate;
global Y_rate;
delayA_X = 8;
delayA_Y = 8;
delayB_X = 10;
delayB_Y = 10;
delayC_X = 8;
delayC_Y = 0;

X_toll=round(W*X_rate/(X_rate+Y_rate));
Y_toll=W-X_toll;

used_X=0;
used_Y=0;

for i = (L+1)/2
    % toll type X
    for j = 1:W
        %1
        if new(i,j) > 0 &&type(i,j) == 1
            if used_X<=X_toll 
                if new(i,j) > delayA_X&&new(i+1,j)==0 
                    new(i,j) = 0;
                    new(i+1,j) = 1;
                    type(i+1,j) = 1;
                    type(i,j)=0;
                    v_carsnew(i,j)=0;
                    v_carsnew(i+1,j)=0;
                    
                    used_X=used_X+1;
                else
                    new(i,j) =new(i,j) + 1;
                    v_carsnew(i,j)=0;
                end
                
            else
                new(i,j) =new(i,j) + 1;
                v_carsnew(i,j)=0;
            end
        %2
        elseif new(i,j) > 0 &&type(i,j) == 2
            if used_X<=X_toll
                if new(i,j) > delayB_X&&new(i+1,j)==0 
                    new(i,j) = 0;
                    new(i+1,j) = 1;
                    type(i+1,j) = 2;
                    type(i,j)=0;
                    v_carsnew(i,j)=0;
                    v_carsnew(i+1,j)=0;
                    used_X=used_X+1;
                else
                    new(i,j) =new(i,j) + 1;
                    v_carsnew(i,j)=0;
                end
            else
                new(i,j) =new(i,j) + 1;
                v_carsnew(i,j)=0;
            end
        %3
        elseif new(i,j) > 0 &&type(i,j) == 3
            if used_Y<=Y_toll
                if new(i,j) > delayC_Y&&new(i+1,j)==0 
                    new(i,j) = 0;
                    new(i+1,j) = 1;
                    type(i+1,j) = 3;
                    type(i,j)=0;
                    v_carsnew(i,j)=0;
                    v_carsnew(i+1,j)=0;
                    used_Y=used_Y+1;
                else
                    new(i,j) =new(i,j) + 1;
                    v_carsnew(i,j)=0;
                end
            else
                new(i,j) =new(i,j) + 1;
                v_carsnew(i,j)=0;
            end
        elseif new(i,j) > 0
            new(i,j) = 0;
        end
        
    end

 
end


for i = (L-1)/2:-1:1
    for j = 1:W
        if new(i,j) == 1
             if (L+1)/2-i<3
                if new(i+1, j) ~= 0
                    %%
                   new(i,j) = -2;
                   v_carsnew(i,j)=0;
                else
                   new(i,j) = 0;
                   new(i+1, j) = 1;
                   type(i+1,j)=type(i,j);
                   type(i,j)=0;
                   v_carsnew(i+1,j)=0;
                   v_carsnew(i,j)=0;
                end
                continue
             end
           new(i,j) =0;
            new(i+v_cars(i,j),j)=1;
            type(i+v_cars(i,j),j)=type(i,j);
            type(i,j)=0;
            v_carsnew(i+v_cars(i,j),j)=v_cars(i,j);
       end
    end
end
