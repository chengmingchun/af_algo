function out = dstc(af1,af2)
% 计算一下差异度
out = 0;
a = af1.route(:);
b = af2.route(:);
for i =1:length(a)
    out = out+sign(abs(a(i)-b(i)));
end
