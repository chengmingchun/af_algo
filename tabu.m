%%%% ���������㷨��30����ʼ���н�
clc
clear
global data;
global distance;

data = importdata("data.txt");
distance = importdata("distance.txt");
hh = [];
%for www = 1:30
m = 341;
tl = 8;  %��ʼ���ɳ���
spe = 5; % ����ֵ
time = 300;
tab = zeros(1,m);
best = 1000000;
% ���뷽ʽ����Ⱥ�㷨һ��
pop = randperm(341); %��ʼ������򵥵�һ��һ����
kex = [];

tic;
for t = 1:time
    t
    a = 0; %��¼��������������
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
base = importdata('jie.mat');    %��ʼ��
%hh = [hh;kex];
%end
