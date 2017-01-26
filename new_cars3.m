function [plaza,type] = new_cars3(plaza,type,entry,L)

A_num=1;
B_num=1;
C_num=1;
L=L*2;
[l,w]=size(plaza);
sb=(w-L)/2;
l1=1;
l2=1;
l3=1;
s=l1+l2+l3;
l1=floor(l1/s*L);
l2=floor(l2/s*L);
l3=L-l1-l2;
rk_A=A_num/(A_num+B_num+C_num);
rk_B=B_num/(A_num+B_num+C_num);
%rk_C=C_num/(A_num+B_num+C_num);

if entry > 0 
    % Find the empty lanes of the entrance where a new car can be add.
    unoccupied= find( plaza(1,:) == 0 );
    
    n = length(unoccupied); % number of available lanes
     x = randperm(n); 
    for i = 1:min(entry,n)


        rk=rand(1);
        if rk<=rk_A
             plaza(1, unoccupied(x(i)) ) = 1;
             type(1, unoccupied(x(i)) ) = 1;

        elseif rk>rk_A&&rk<=rk_B+rk_A
              plaza(1, unoccupied(x(i)) ) = 1;
              type(1, unoccupied(x(i)) ) = 2;
            else
              plaza(1, unoccupied(x(i)) ) = 1;
              type(1, unoccupied(x(i)) ) = 3;

            
        end
            plaza(1, unoccupied(x(i)) ) = 1;
            
    end
end