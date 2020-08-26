%%%% get property
function out = fget(af,argin)
switch argin
     case 'route'
         out = af.route ;
     case 'step'
         out = af.step;
     case 'visual'
         out = af.visual;
     case 'try_number'
         out = af.try_number;
     case 'delta'
         out = af.delta;
     otherwise
         fprintf('\n²ÎÊı´íÎó\n')
         out =0;
 end