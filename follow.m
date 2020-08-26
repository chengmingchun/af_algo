%%%%% follow random
function af =follow(af)
global afs;
global af_total;
n = 0;   %记录在视野中的鱼的数量
f_min = Inf;
min_i = 1;

for i = 1:af_total
    if(dstc(af,afs{i})<af.visual)
        n = n+1;
        if(foodconsistence(afs{i})<f_min)
            f_min = foodconsistence(afs{i});
            min_i = i ;
        end
    end
end

%当视野内最优值不低于忍受阈值的时候，向最优值移动
if(((f_min*n)>(af.delta*foodconsistence(af))))&(afs{min_i}.route~=af.route)
    af.route = afs(min_i).route;
else
    af = prey(af);
end
        
