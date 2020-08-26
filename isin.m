function y = isin(x,A)
y = 0 ;
for i = 1:length(A)
    if A(i) == x
        y = 1;
        break;
    end
end
