clear all
global fangan
tuntuf=[];
chedaoavf=[];
chedaosarf=[];
 avrf=[];
srf=[];
AAVRf=[];
ASRf=[];
shahuanf=[];
shoufeif=[];
shoufeisf=[];
Sb=[];
for fangan=1:3
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
    
    global plazalength;
    global X_rate;
global Y_rate;
X_rate=1;
Y_rate=1;

global A_num
global B_num
global C_num
A_num=8;
B_num=1;
C_num=1;
global l1
global l2
global l3
l1=8;
l2=1;
l3=1;
global lamda 
lamda=2;
global k;
k=4;
global xianxing;
xianxing=1;
%lamdaz=[1:1:10];
kg=[1:8];

for i=1:length(kg)    
k=kg(i)
cellular;
tuntu(i)=GETOUTNUM(end);

shoufei=0;
shufeis=0;

shoufei=mean(TOLLUSEDNUM);
shoufeis=var(TOLLUSEDNUM);



  shahuan=0;
  shahuan=sum(TOLLUSEDNUM+CHANGELINENUM)
 plot(SPEEDDOWNNUM);
 shahuanz(i)=shahuan;
 plot(CHANGELINENUM);

EACHROADNUM(find(EACHROADNUM<0))=0;
eachroadz(i,:)=sum(EACHROADNUM');
 for ai=1:plazalength
    for bi=1:20+2
        if SPEEDNUM(ai,bi)>0
            SPEEDFIELD(ai,bi)=SPEEDSUM(ai,bi)/SPEEDNUM(ai,bi);
        else
            SPEEDFIELD(ai,bi)=0;
        end
    end
end

%  mesh(SPEEDFIELD);

 all=0;
 num=0;
  for aa=55:90
      for bb=1:22
          if SPEEDFIELD(aa,bb)>0
              all=all+SPEEDFIELD(aa,bb);
              num=num+1;              
          end
      end
  end
avr=all/num;
%    disp(all);
%    disp(num);
%    disp(avr);
   avrz(i)=avr;
   
   sr=0;
for aa=55:90
    for bb=1:22
          if SPEEDFIELD(aa,bb)>0
              sr=sr+(SPEEDFIELD(aa,bb)-avr)*(SPEEDFIELD(aa,bb)-avr);
              
          end
    end
end  
sr=sr/num;
disp(sr);
% mesh(SPEEDSUM);
srz(i)=sr;
xx=[1:22];
yy=[1:101];
CARDENSITY(51,:)=0;
% mesh(CARDENSITY);

AC=0;
NC=0;
for aa=55:90
    for bb=1:22
          if CARDENSITY(aa,bb)>0
              AC=AC+CARDENSITY(aa,bb);
              NC=NC+1;
          end
    end
end  
% disp(AC);
% disp(NC);
% disp(AC/NC);
AAVR=AC/NC;
AAVRz(i)=AAVR;
ASR=0;
for aa=55:90
    for bb=1:22
          if CARDENSITY(aa,bb)>0
              ASR=ASR+(CARDENSITY(aa,bb)-AAVR)*(CARDENSITY(aa,bb)-AAVR);
          end
    end
end 

ASR=ASR/NC;
ASRz(i)=ASR;
  GETOUTNUM=[];
   GETOUTITEM=[];
   EACHROADNUM=[];
   TOLLUSEDNUM=[];
   SPEEDDOWNNUM=[];
   CHANGELINENUM=[];
   SPEEDSUM=[];
   SPEEDNUM=[];
   SPEEDFIELD=[];
   CARDENSITY=[];
   

if xianxing==1
    S(i)=800*k/4000;
end
if xianxing==2
    S(i)=800*k/4000;
end   
%shoufeif=[shoufeif;shoufeiz];
%shoufeisf=[shoufeisf;shoufeisz];
% zhibiao(fangan)=

end
Sb=[Sb;S];

shahuanf=[shahuanf;shahuanz];
tuntuf=[tuntuf;tuntu];
chedaoavz=mean(eachroadz');
chedaoavf=[chedaoavf;chedaoavz];
chedaosarz=var(eachroadz');
chedaosarf=[chedaosarf;chedaosarz];
 avrf=[avrf;avrz];
srf=[srf;srz];
AAVRf=[AAVRf;AAVRz]
ASRf=[ASRf;ASRz];

end

% zhibiao(fangan)=

tuntufb=tuntuf/3000;

AAVRb=AAVR/100;

tongxing=tuntufb+AAVRb+avrb;

shahuanb=shahuanf/6000;

srb=srf/0.3;

ASRb=ASRf/3000;

shigu=shahuanb+srb+ASRb;

% if xianxing==1
%     Sb=800*k/4000;
% end
% if xianxing==2
%     Sb=800*k/4000;
% end   

 chedaosarb=chedaosarf/500000;

chengben=Sb+chedaosarb;
%chengben=Sb;


