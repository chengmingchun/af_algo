%%%%%%%%%this function is for details'show
function Iwantsee(af)
global passed_times;
global b_value;
fprintf('��������һ����:\n');
fprintf('     λ��:          x = %f\n', af.x);
fprintf('                    y = %f\n', af.y);
fprintf('     ����:          step = %f\n', af.step);
fprintf('     ��Ұ:          visual = %f\n', af.visual);
fprintf('     ���Դ���:      try_num = %f\n', af.try_number);
fprintf('     ӵ��������:     delta = %f\n', af.delta);
fprintf('��������Ⱥ���Ž�:    f(x,y) = %f\n', b_value(passed_times-1));