data = importdata('rrr.txt');
tau = zeros(1,341);
res = zeros(1,341);

for i = 1:1:117
    tem = 0.1;
    for j = 1:4
        if ~isnan(data(i,j)) 
        if tau(data(i,j)+1) ==0
           tau(data(i,j)+1) = 1;
           res(data(i,j)+1) = i+tem;
           tem = tem+0.1;
        end
        end
    end
end