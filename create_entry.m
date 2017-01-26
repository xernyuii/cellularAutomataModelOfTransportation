function entry = create_entry(T,L)
global lamda;
k = T*1440;
    entry=poissrnd(lamda,1,k);
