function af = prey(af)
%%%Ëæ»ú½»»»
for l = 1:af.try_num
    len = ceil(20*rand());
    pos1 = ceil(321*rand());
    pos2 = ceil(321*rand());    
    temp_af = af;
    temp = af.route(pos1:pos1+len);
    temp_af.route(pos1:pos1+len) = af.route(pos2:pos2+len);
    temp_af.route(pos2:pos2+len) = temp;
    
    if (foodconsistence(af)>foodconsistence(temp_af))
        af = temp_af;
        return;
    end
end

