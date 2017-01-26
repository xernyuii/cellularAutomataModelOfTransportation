function plaza = clear_boundary(plaza)
global GETOUTNUM;
global GETOUTITEM;
[a,b] = size(plaza);
for i = 1:b
    if plaza(a,i) > 0
        plaza(a,i) = 0;
        GETOUTNUM(GETOUTITEM)=GETOUTNUM(GETOUTITEM)+1;
    end
end
