% function [b_route,b_value] = Fish(num,it,see)

%% ����ȫ�ֱ���
global afs;
global af_total;
global afs_value;
global b_value;        %��������ֵ
global iterate_times;  %Ŀ���������
global passed_times;   %�ѵ�������
global data;           %�����
global distance;       %�������
%% define����
data = importdata("data.txt");
distance = importdata("distance.txt");

afs = [];
af_total = 10;
afs_value = 0;
b_value = 0;
passed_times = 0;
iterate_times = 30;

base = importdata('jie.mat');    %��ʼ��
base(9,:) = importdata('matlab.mat');
base(8,:) = importdata('matlab2.mat');
base(10,:) = importdata('matlab3.mat');
base(7,:) = importdata('matlab4.mat');
base(6,:) = importdata('matlab5.mat');
base(5,:) = importdata('matlab6.mat');
%% �����ʼ��Ⱥ
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
%% ����������
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
%% �㷨�������
x_axes = 1:1:passed_times;
figure(2);
plot(x_axes,b_value,'k');
grid on;
title('�Ż�����');
xlabel('��������');
ylabel('�Ż�����ֵ');
