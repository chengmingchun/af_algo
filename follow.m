%%%%% follow random
function af =follow(af)
global afs;
global af_total;
n = 0;   %��¼����Ұ�е��������
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

%����Ұ������ֵ������������ֵ��ʱ��������ֵ�ƶ�
if(((f_min*n)>(af.delta*foodconsistence(af))))&(afs{min_i}.route~=af.route)
    af.route = afs(min_i).route;
else
    af = prey(af);
end
        
