function [plaza,v_cars] = create_plaza(B, L)
global plazalength;
global type;
global k;
global xianxing;
% global v_cars;

topgap = 5;
bottomgap = 1;
plaza = zeros(plazalength,B+2);
v_cars = zeros(plazalength,B+2);
type = zeros(plazalength,B+2);
plaza((plazalength+1)/2:plazalength,[1,2+B]) = -888;
type((plazalength+1)/2:plazalength,[1,2+B]) = -1;
[l,w]=size(plaza);
if mod(B-L,2)==0 
    for col = 2:B/2 - L/2 + 1

         plaza(:,1)=-888;
         plaza(:,B+2)=-888;
         type(:,1)=-1;
         type(:,B+2)=-1;

         if xianxing==2

         row0=(plazalength-1)/2+1;
         col0=w/2;
         r=B/2;
         
         for row=(plazalength+3)/2:plazalength
             if ((row-row0)/k)^2+(col-col0)^2>r^2
                 plaza(row,[col, B+3-col])=-888;
                 type(row,[col, B+3-col]) = -1;
             end
         end
         end
         if xianxing==1
             for row=(plazalength+3)/2:plazalength

            row0=(plazalength+1)/2+1;
            col0=2;
             if (col-col0)/(row-row0)>k
                  plaza(row,[col, B+3-col])=-888;
                 type(row,[col, B+3-col]) = -1;
             end    
           
             end
         end
            
%         for row = (plazalength+3)/2 + bottomgap*(col-1):plazalength
%             plaza(row,[col, B+3-col]) = -888;
%         end
    end
else
    plaza(1:plazalength, B+3) = -888;
    type(1:plazalength, B+3) = -1;
    for col = 2:(B+1)/2 - L/2 + 1
        for row = 1:(plazalength-1)/2 - topgap * (col-1)
            plaza(row, [col, B+4-col]) = -888;
            type(row, [col, B+4-col]) = -1;
        end
        for row = (plazalength+3)/2 + bottomgap*(col-1):plazalength
            plaza(row, [col, B+4-col]) = -1;
            type(row, [col, B+4-col]) = -1;
        end
    end
end
