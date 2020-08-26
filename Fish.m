% function [b_route,b_value] = Fish(num,it,see)

%% 定义全局变量
global afs;
global af_total;
global afs_value;
global b_value;        %总体最优值
global iterate_times;  %目标迭代次数
global passed_times;   %已迭代次数
global data;           %任务表
global distance;       %距离矩阵
%% define数据
data = importdata("data.txt");
distance = importdata("distance.txt");

afs = [];
af_total = 10;
afs_value = 0;
b_value = 0;
passed_times = 0;
iterate_times = 30;

base = importdata('jie.mat');    %初始解
base(9,:) = importdata('matlab.mat');
base(8,:) = importdata('matlab2.mat');
base(10,:) = importdata('matlab3.mat');
base(7,:) = importdata('matlab4.mat');
base(6,:) = importdata('matlab5.mat');
base(5,:) = importdata('matlab6.mat');
%% 构造初始鱼群
tic
for i = 1:1:af_total
   afs{i} = af();
     [t_j,t_l,t_s]  = uncode(base(i,:));
     base(i,:) = encode(t_j,t_s);
     afs{i}.route = base(i,:);
%   [t_j,t_l,t_s]  = uncode(afs{i}.route());
%   temppp = encode(t_j,t_s);
%   afs{i}.route = temppp;
end
% base = randperm(341);
%% 主迭代过程
for i = 1:1:iterate_times
   i
    passed_times = passed_times+1;
    if passed_times > 1
        b_value(passed_times) = b_value(passed_times-1);
    else
        b_route = base;
        b_value = Inf;
    end
    
    for i = 1:1:af_total
        afs{i} = evaluate(afs{i});
        if foodconsistence(afs{i})<b_value(passed_times)
            b_route = fget(afs{i},'route');
            b_value(passed_times) = foodconsistence(afs{i});
        end
    end
end
toc
%% 算法性能输出
x_axes = 1:1:passed_times;
figure(2);
plot(x_axes,b_value,'k');
grid on;
title('优化曲线');
xlabel('迭代次数');
ylabel('优化函数值');
