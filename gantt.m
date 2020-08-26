clear;  
clc ;
a = 36;
b = 70;
data = importdata('data.txt');%��ȡ����
pop = importdata('result_t.txt');
distance = importdata('distance.txt');
axis([0,3150,a,b]);%x�� y��ķ�Χ
set(gca,'xtick',0:150:3150) ;%x�����������
set(gca,'ytick',a:1:b) ;%y�����������
xlabel('ʱ��','FontName','����','FontSize',16)
ylabel('�������','FontName','����','FontSize',16,'Rotation',90)
title('һ�ֽ��ŵ��ŷ�(����ʻʱ��)','fontname','����','FontSize',16);%ͼ�εı���
kx = [];

% �޸�������ֱ����ǰ��Ĵ���
length = 111;
temp_len = zeros(1,length);%������
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
    % �ж�ʱ��Լ��
    time = 0; % ��ʻʱ��
    num = 0; % ��ʻ����
    for l =1:temp_len(k)-1
        if(data(pop(k,l),2)~=data(pop(k,l+1),1))
            time = distance(data(pop(k,l),2),data(pop(k,l+1),1));            
        end
        % �����˿�ʻ·��
        if(data(pop(k,l),4)+time>data(pop(k,l+1),3))
            if(data(pop(k,l),4)+time<24*60+data(pop(k,l+1),3))
                data(pop(k,l+1),3)=24*60+data(pop(k,l+1),3);
                data(pop(k,l+1),4)=24*60+data(pop(k,l+1),4);         
            end
        end
    end
    kx = [kx; (data(pop(k,temp_len(k)),4) - data(pop(k,1),3)+time)/60];
end


for i = a:b
    for j =1:4
        if pop(i,j)~=0
            rec(1) = data(pop(i,j),3);     %���εĺ�����
            rec(2) = i;  %���ε�������
            rec(3) = data(pop(i,j),5);  %���ε�x�᷽��ĳ���
            rec(4) = 0.6;
            tat = sprintf('%.2f h',kx(i));  
            txt = sprintf('%d',pop(i,j)); 
            rectangle('Position',rec,'LineWidth',1,'LineStyle','-');%draw every rectangle 
            text(data(pop(i,j),3)+(rec(3)/4),i+0.3,txt,'FontSize',7);%label the id of every task  ��������������������            
        end    
    end
    text(3040,i+0.3,tat,'FontSize',8,'color','red');
end 
