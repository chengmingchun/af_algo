%%%%% æ‡¿Î

function dis = foo(x)
    global distance;
    global data
    dis = 0;
    [pop,length,shunx] = uncode(x);
    [w1,w2,w3,w4] = cando(pop,length,shunx);
    dis = dis+100000*w1+w2+100000*w3+100000*w4;
   
%     [xx,yy] = size(pop);
%     if yy<=4
%         dis = dis +200000;
%     end
    
    %tt = (pop~=0);
    %sum(tt(:))
    %if sum(tt(:))~=341
    %    dis = dis+99999;
    %end
    
    temp_len = zeros(1,length);%º∆ ˝æ˝
    
    for i = 1:length
        for j = 4:-1:1
            if pop(i,j)~=0
                temp_len(i) = j;
                break;
            end
        end
    end
    
    %%% º∆À„æ‡¿Î
    for k = 1:length
        for l = 1:temp_len(k)
            dis = dis+distance(data(pop(k,l),1),data(pop(k,l),2));
        end
    end

   



