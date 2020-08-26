clear;  
clc ;
a = 36;
b = 70;
data = importdata('data.txt');%读取数据
pop = importdata('result_t.txt');
distance = importdata('distance.txt');
axis([0,3150,a,b]);%x轴 y轴的范围
set(gca,'xtick',0:150:3150) ;%x轴的增长幅度
set(gca,'ytick',a:1:b) ;%y轴的增长幅度
xlabel('时间','FontName','黑体','FontSize',16)
ylabel('车辆序号','FontName','黑体','FontSize',16,'Rotation',90)
title('一种较优的排法(含空驶时间)','fontname','黑体','FontSize',16);%图形的标题
kx = [];

% 修改天数，直接用前面的代码
length = 111;
temp_len = zeros(1,length);%计数君
for i = 1:length
    for j = 4:-1:1
        if pop(i,j)~=0
            temp_len(i) = j;
            break;
        end
    end
end

%%% 判断时间等一系列约束条件
for k = 1:length
    % 判断时间约束
    time = 0; % 空驶时间
    num = 0; % 空驶段数
    for l =1:temp_len(k)-1
        if(data(pop(k,l),2)~=data(pop(k,l+1),1))
            time = distance(data(pop(k,l),2),data(pop(k,l+1),1));            
        end
        % 加入了空驶路段
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
            rec(1) = data(pop(i,j),3);     %矩形的横坐标
            rec(2) = i;  %矩形的纵坐标
            rec(3) = data(pop(i,j),5);  %矩形的x轴方向的长度
            rec(4) = 0.6;
            tat = sprintf('%.2f h',kx(i));  
            txt = sprintf('%d',pop(i,j)); 
            rectangle('Position',rec,'LineWidth',1,'LineStyle','-');%draw every rectangle 
            text(data(pop(i,j),3)+(rec(3)/4),i+0.3,txt,'FontSize',7);%label the id of every task  ，字体的坐标和其它特性            
        end    
    end
    text(3040,i+0.3,tat,'FontSize',8,'color','red');
end 
