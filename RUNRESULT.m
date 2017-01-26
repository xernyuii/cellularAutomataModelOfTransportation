global GETOUTNUM;
global GETOUTITEM;
global TOLLUSEDNUM;
global EACHROADNUM;
global SPEEDDOWNNUM;
global CHANGELINENUM;
global SPEEDSUM;
global SPEEDNUM;
global SPEEDFIELD;
global plazalength;
global CARDENSITY;
 plot(GETOUTNUM);
 disp(GETOUTNUM(1440));
 
EACHROADNUM(find(EACHROADNUM<0))=0;
% plot(EACHROADNUM(10,:)');
% mesh(EACHROADNUM)

% plot(TOLLUSEDNUM);


% plot(SPEEDDOWNNUM);


% plot(CHANGELINENUM);


% for ai=1:plazalength
%     for bi=1:20+2
%         if SPEEDNUM(ai,bi)>0
%             SPEEDFIELD(ai,bi)=SPEEDSUM(ai,bi)/SPEEDNUM(ai,bi);
%         else
%             SPEEDFIELD(ai,bi)=0;
%         end
%     end
% end
% 
%  mesh(SPEEDFIELD);
%  %tongjizhi
%  all=0;
%  num=0;
%   for aa=55:90
%       for bb=1:22
%           if SPEEDFIELD(aa,bb)>0
%               all=all+SPEEDFIELD(aa,bb);
%               num=num+1;
%               
%           end
%       end
%   end
% avr=all/num;
%    disp(all);
%    disp(num);
%    disp(avr);
%    
%    sr=0;
% for aa=55:90
%     for bb=1:22
%           if SPEEDFIELD(aa,bb)>0
%               sr=sr+(SPEEDFIELD(aa,bb)-avr)*(SPEEDFIELD(aa,bb)-avr);
%               
%           end
%     end
% end  
% sr=sr/num;
% disp(sr);
% % mesh(SPEEDSUM);
% 

% xx=[1:22];
% yy=[1:101];
% CARDENSITY(51,:)=0;
% % mesh(CARDENSITY);
% 


% 
%  
% AC=0;
% NC=0;
% for aa=55:90
%     for bb=1:22
%           if CARDENSITY(aa,bb)>0
%               AC=AC+CARDENSITY(aa,bb);
%               NC=NC+1;
%           end
%     end
% end  
% disp(AC);
% disp(NC);
% disp(AC/NC);
% AAVR=AC/NC;
% 
% ASR=0;
% for aa=55:90
%     for bb=1:22
%           if CARDENSITY(aa,bb)>0
%               ASR=ASR+(CARDENSITY(aa,bb)-AAVR)*(CARDENSITY(aa,bb)-AAVR);
%           end
%     end
% end 
% 
% disp(ASR);
