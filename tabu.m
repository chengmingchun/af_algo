%%%% 禁忌搜索算法求30个初始可行解
clc
clear
global data;
global distance;

data = importdata("data.txt");
distance = importdata("distance.txt");
hh = [];
%for www = 1:30
m = 341;
tl = 8;  %初始禁忌长度
spe = 5; % 特赦值
time = 300;
tab = zeros(1,m);
best = 1000000;
% 编码方式和鱼群算法一致
pop = randperm(341); %初始解用最简单的一车一任务
kex = [];

tic;
for t = 1:time
    t
    a = 0; %记录更换车辆的任务
    for i = 1:m
        copy = pop;
        if tab(i)<spe
            pop(i) = pop(i)-pop(i)*rand();
        end
        [a,b,c] = uncode(pop);
        [d,e,f,g] = cando(a,b,c);
        if d==0 && g==0&& f==0 && foo(pop)<best
            kex=pop;
            best = foo(pop);
            tab(i) = tl;
        else
            pop = copy;
        end    
    end
    for l = 1:m
        if tab(l)>0
            tab(l) = tab(l)-1;
        end
    end
end
toc
base = importdata('jie.mat');    %初始解
%hh = [hh;kex];
%end
