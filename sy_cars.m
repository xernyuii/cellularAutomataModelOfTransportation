function gc= sy_cars(plaza,row,col)
[L, W] = size(plaza); 
f=10;
c=1;
sy=[];
syl=[];
gc=[];
if row<=L-f
    sy=plaza([row:row+f],[col-c:col+c]);
    sy(1,1+c)=0;
    sy(find(sy~=0))=1;
    for i=1:2*c+1
        syl=sy(:,i);
        if sum(syl)==0
           gc(i)=f;
        else
           gc(i)=min(find(syl==1))-2;
        end
    end
else
    gc=[];
end