function res = encode(x,sx)
    res = zeros(1,341);
    [len,em] = size(x);
    for i = 1:len
        for j = 1:4
            if x(i,j)~=0
                res(x(i,j)) = i+sx(i,j);
                if sx(i,j) ==1
                    res(x(i,j))= res(x(i,j))-1;
                end
            end
        end
    end
    
                