function [pop,len,shunx] = uncode(p)
%%% 将基因解码成矩阵
order = p -fix(p);
p = fix(p);
uni = unique(p);
len = length(uni);
pop = zeros(len,4);
shunx = ones(len,4);
for i=1:len
    k=1;%计数君
    for j=1:length(p)
        if p(j) == uni(i)
            pop(i,k) = j;
            shunx(i,k) = order(j);
            k = k+1;
%             if k>4
%                 k =4;
%             end
            % k >4 抛出错误
        end
    end
end
shunx(shunx==0)=1;
