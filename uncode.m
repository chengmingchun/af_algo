function [pop,len,shunx] = uncode(p)
%%% ���������ɾ���
order = p -fix(p);
p = fix(p);
uni = unique(p);
len = length(uni);
pop = zeros(len,4);
shunx = ones(len,4);
for i=1:len
    k=1;%������
    for j=1:length(p)
        if p(j) == uni(i)
            pop(i,k) = j;
            shunx(i,k) = order(j);
            k = k+1;
%             if k>4
%                 k =4;
%             end
            % k >4 �׳�����
        end
    end
end
shunx(shunx==0)=1;
