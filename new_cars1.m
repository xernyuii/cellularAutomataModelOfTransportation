function [plaza,type] = new_cars1(plaza,type,entry,L)

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
l2=floor(l2/s*L);
l3=L-l1-l2;

rk_A=A_num/(A_num+B_num+C_num);
rk_B=B_num/(A_num+B_num+C_num);
%rk_C=C_num/(A_num+B_num+C_num);

if entry > 0 

    unoccupied= find( plaza(1,:) == 0 );   
    n = length(unoccupied); % number of available lanes
    for i = 1:min(entry,n)
    pp1=plaza(1,[sb+1:sb+l1]);
    pp2=plaza(1,[sb+l1+1:sb+l1+l2]);
    pp3=plaza(1,[sb+l1+l2+1:sb+l1+l2+l3]);
    tp1=type(1,[sb+1:sb+l1]);
    tp2=type(1,[sb+l1+1:sb+l1+l2]);
    tp3=type(1,[sb+l1+l2+1:sb+l1+l2+l3]);
    unoccupied1 = find( pp1 == 0 );
    unoccupied2= find( pp2 == 0 );
    unoccupied3 = find( pp3 == 0 );   
    x1 = randperm(length(unoccupied1));
    x2 = randperm(length(unoccupied2));
    x3 = randperm(length(unoccupied3));

        rk=rand(1);
        if rk<=rk_A
            if size(x1)~=[0,0]
            pp1(1, unoccupied1(x1(1)) ) = 1;
            tp1(1, unoccupied1(x1(1)) ) = 1;

            end
        elseif rk>rk_A&&rk<=rk_B+rk_A
            if size(x2)~=[0,0]
            pp2(1, unoccupied2(x2(1)) ) = 1;
            tp2(1, unoccupied2(x2(1)) ) = 2;

            end
            else
            if size(x3)~=[0,0]
            pp3(1, unoccupied3(x3(1)) ) = 1;
            tp3(1, unoccupied3(x3(1)) ) = 3;

            end
            
        end
          plaza(1,[sb+1:sb+L])=[pp1,pp2,pp3];
          type(1,[sb+1:sb+L])=[tp1,tp2,tp3];
    end
end