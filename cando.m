function [w1,w2,w3,w4,tem_data] = cando(pop,length,shunx)
global data;
global distance;
%%%% �����Ƿ�Υ����Լ�� w1ʱ�� w2�ص� w3�Ķ� w4 ��48Сʱ
%%%%%% �� �Ƿ��ڼ����˿�ʻ�κ���ȻΥ��ʱ��Լ��
% data = importdata("data.txt");
% distance = importdata("distance.txt");
w1 = 0;
w2 = 0;
w3 = 0;
w4 = 0;
kx = [];

temp_len = zeros(1,length);%������
tem_data = data; % �޸�����,�����漰���ŵ��ڶ��������
for i = 1:length
    for j = 4:-1:1
        if pop(i,j)~=0
            temp_len(i) = j;
            break;
        end
    end
end

%%% �ж�ʱ���һϵ��Լ������
for k = 1:length
    
    [www,sk] = sort(shunx(k,:));
    temmp = pop(k,:);
    pop(k,:) = temmp(sk);
    % �ж�ʱ��Լ��
    time = 0; % ��ʻʱ��
    num = 0; % ��ʻ����
    for l =1:temp_len(k)-1
        if(tem_data(pop(k,l),2)~=tem_data(pop(k,l+1),1))
            time = distance(tem_data(pop(k,l),2),tem_data(pop(k,l+1),1));            
        end
        % �����˿�ʻ·��
        
        if(tem_data(pop(k,l),4)+time>tem_data(pop(k,l+1),3))
            if(tem_data(pop(k,l),4)+time<24*60+tem_data(pop(k,l+1),3))
                tem_data(pop(k,l+1),3)=24*60+tem_data(pop(k,l+1),3);
                tem_data(pop(k,l+1),4)=24*60+tem_data(pop(k,l+1),4);         
            elseif(tem_data(pop(k,l),4)+time<48*60+tem_data(pop(k,l+1),3))
                tem_data(pop(k,l+1),3)=48*60+tem_data(pop(k,l+1),3);
                tem_data(pop(k,l+1),4)=48*60+tem_data(pop(k,l+1),4);
            else     
%               pop(k,l+1:end) = 0;
                w1 =w1+1;
                continue;  %�������Ҫ�ɲ�Ҫ����Ϊ��w1ΥԼ�Ļᱻ��̭��
%               pop(k,l+1:end) = 0;
%               temp_len(k) = l ;
            end
        end
        
         w2 = w2 + time;
         if time~=0
             num = num+1;
             time = 0;
         end
        
    end
   
     if data(pop(k,1),1)~=data(pop(k,temp_len(k)),2)
         num=num+1;
         w2 = w2 + distance(data(pop(k,temp_len(k)),2),data(pop(k,1),1));
     end
     
     %����ʻ��������4
     tttt = (temmp~=0);
     if sum(tttt)+num > 4
         w3 = w3+1;
     end
     
    % 48Сʱ��Լ�� 
    if (tem_data(pop(k,temp_len(k)),4) - tem_data(pop(k,1),3)+time)/60 > 48
        w4 = w4 +1;
    end
    kx = [kx; (tem_data(pop(k,temp_len(k)),4) - tem_data(pop(k,1),3)+time)/60];
end





