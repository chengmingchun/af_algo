%%%%% move  random
function af = move(af)
i=1;

while i<af.try_num
    temp = af.route;
    i=i+1;
    k = round(340*rand())+1;
    temp(k) = temp(k)+ 341*rand();
    temp(k) = temp(k)- 341*rand();
    if temp(k)>1 && foodconsistence(af)>foo(temp)
        af.route = temp;
    end
end
