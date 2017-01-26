% clear all;
function   []=cellular
global fangan
global X_rate;
global Y_rate;

global A_num
global B_num
global C_num

global l1
global l2
global l3

global lamda 

global k;
global xianxing;
W = 0;
for j = 10
    B = 10+j; 
    L = 10; 
    T = 60*24; 
    global plazalength;
    plazalength = 101;
    global plaza;
    global v_cars;
    %change
    global type;    
    %CACULATENUMBERS
    global GETOUTNUM;
    global GETOUTITEM;
    global EACHROADNUM;
    global TOLLUSEDNUM;
    global SPEEDDOWNNUM;
    global CHANGELINENUM;
    global SPEEDSUM;
    global SPEEDNUM;
    global SPEEDFIELD;
    global CARDENSITY;
    CARDENSITY=zeros(plazalength,B+2);
    SPEEDSUM(plazalength,B+2)=0;
    SPEEDNUM(plazalength,B+2)=0;
    SPEEDFIELD(plazalength,B+2)=0;
    CHANGELINENUM=zeros(1,1440);
    EACHROADNUM=zeros(B+2,1440);
    
    plaza= create_plaza(B,L);
    SPEEDDOWNNUM=zeros(1,1440);

%     h = show_plaza(plaza,B,NaN);                        %    

    entry_vector = create_entry(T,L);
    waiting_time = 0;
    output = 0;
    GETOUTNUM=zeros(1,1440);
    TOLLUSEDNUM=zeros(1,1440);
    for i = 1:T
        GETOUTITEM=i;
        if i>1
            GETOUTNUM(GETOUTITEM)=GETOUTNUM(GETOUTITEM)+GETOUTNUM(GETOUTITEM-1);
        end
        
        for LL=1:B+2
            EACHROADNUM(LL,i)=sum(plaza([(plazalength+1)/2+1:plazalength],LL));
            
        end
        
        TOLLUSEDNUM(i)=sum(find(plaza((plazalength+1)/2,1:B+2))>0);
           
        [plaza,v_cars,type] = change_v(plaza,v_cars,type); 
        [plaza,v_cars,type] = move_forward(plaza,v_cars,type); 
     
%       [plaza,v_cars] = change_v(plaza,v_cars); 
         if fangan==1
        [plaza,type] = new_cars1(plaza,type, entry_vector(i),L); 
         end
          if fangan==2
        [plaza,type] = new_cars2(plaza,type, entry_vector(i),L); 
          end
         if fangan==3
        [plaza,type] = new_cars3(plaza,type, entry_vector(i),L); 
         end
        [plaza,v_cars,type] = switch_lanes(plaza,v_cars,type);
        waiting_time = waiting_time + compute_wait(plaza); 
        output = output + compute_output(plaza);
        for ai=1:plazalength
            for bi=1:B+2
                if plaza(ai,bi)>-3&&plaza(ai,bi)~=0
                    SPEEDNUM(ai,bi)=SPEEDNUM(ai,bi)+1;
                    SPEEDSUM(ai,bi)=SPEEDSUM(ai,bi)+v_cars(ai,bi);
                end
            end
        end
        
        for ai=1:plazalength
            for bi=1:B+2
                if plaza(ai,bi)>-3&&plaza(ai,bi)~=0
                    CARDENSITY(ai,bi)=CARDENSITY(ai,bi)+1;
                end
            end
        end

        imshow(type,[-1,3]);

        plaza = clear_boundary(plaza);
    end
     W(j+1) = waiting_time/output;

end
