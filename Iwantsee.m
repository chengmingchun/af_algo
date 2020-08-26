%%%%%%%%%this function is for details'show
function Iwantsee(af)
global passed_times;
global b_value;
fprintf('这是其中一条鱼:\n');
fprintf('     位置:          x = %f\n', af.x);
fprintf('                    y = %f\n', af.y);
fprintf('     步长:          step = %f\n', af.step);
fprintf('     视野:          visual = %f\n', af.visual);
fprintf('     尝试次数:      try_num = %f\n', af.try_number);
fprintf('     拥挤度因子:     delta = %f\n', af.delta);
fprintf('该鱼所在群最优解:    f(x,y) = %f\n', b_value(passed_times-1));