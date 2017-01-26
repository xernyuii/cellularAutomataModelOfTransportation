function [plaza,type] = new_cars2(plaza,type,entry,L)
global A_num;
global B_num;
global C_num;

L=L*2;
[l,w]=size(plaza);
sb=(w-L)/2;
global l1;
global l2;
global l3;

s=l1+l2+l3;

l1=floor(l1/s*L);

l3=floor(l3/s*L);
l2=L-l1-l3;
l2_1=floor(l2/2);
l2_2=l2-l2_1;

rk_A=A_num/(A_num+B_num+C_num);
rk_B=B_num/(A_num+B_num+C_num);
%rk_C=C_num/(A_num+B_num+C_num);

if entry > 0 
    % Find the empty lanes of the entrance where a new car can be add.
    unoccupied= find( plaza(1,:) == 0 );
    
    n = length(unoccupied); 

    for i = 1:min(entry,n)
    pp2_1=plaza(1,[sb+1:sb+l2_1]);
    pp1=plaza(1,[sb+l2_1+1:sb+l2_1+l1]);
    pp3=plaza(1,[sb+l2_1+l1+1:sb+l2_1+l1+l3]);
    pp2_2=plaza(1,[sb+l2_1+l1+l3+1:sb+l2_1+l1+l3+l2_2]);
    tp2_1=type(1,[sb+1:sb+l2_1]);
    tp1=type(1,[sb+l2_1+1:sb+l2_1+l1]);
    tp3=type(1,[sb+l2_1+l1+1:sb+l2_1+l1+l3]);
    tp2_2=type(1,[sb+l2_1+l1+l3+1:sb+l2_1+l1+l3+l2_2]);

    unoccupied2_1 = find( pp2_1 == 0 );
    unoccupied1= find( pp1 == 0 );
    unoccupied3 = find( pp3 == 0 ); 
    unoccupied2_2 = find( pp2_2 == 0 );
    x2_1 = randperm(length(unoccupied2_1));
    x1 = randperm(length(unoccupied1));
    x3 = randperm(length(unoccupied3));
    x2_2 = randperm(length(unoccupied2_2));
        rk=rand(1);
        if rk<=rk_A
            if size(x1)~=[0,0]
            pp1(1, unoccupied1(x1(1)) ) = 1;
            tp1(1, unoccupied1(x1(1)) ) = 1;
            end
        elseif rk>rk_A&&rk<=rk_B+rk_A
            if rand>0.5
            if size(x2_1)~=[0,0]
            pp2_1(1, unoccupied2_1(x2_1(1)) ) = 1;
            tp2_1(1, unoccupied2_1(x2_1(1)) ) = 2;
            elseif size(x2_2)~=[0,0]
            pp2_2(1, unoccupied2_2(x2_2(1)) ) = 1;
            tp2_2(1, unoccupied2_2(x2_2(1)) ) = 2;   
            end
            else
            if size(x2_2)~=[0,0]
            pp2_2(1, unoccupied2_2(x2_2(1)) ) = 1;
            tp2_2(1, unoccupied2_2(x2_2(1)) ) = 2;
            elseif size(x2_1)~=[0,0]
            pp2_1(1, unoccupied2_1(x2_1(1)) ) = 1;
            tp2_1(1, unoccupied2_1(x2_1(1)) ) = 2;
            end
            end
           else
            if size(x3)~=[0,0]
            pp3(1, unoccupied3(x3(1)) ) = 1;
            tp3(1, unoccupied3(x3(1)) ) = 3;
            end
            
        end
          plaza(1,[sb+1:sb+L])=[pp2_1,pp1,pp3,pp2_2];
          type(1,[sb+1:sb+L])=[tp2_1,tp1,tp3,tp2_2];
    end
end