function af = evaluate(af)
global NC;
global b_route;
global b_value;
global passed_times;
global lambda;

af_follow = follow(af);
af_swarm = swarm(af);
af_prey = prey(af);
af_best = af_follow;
if foodconsistence(af_swarm)  > foodconsistence(af_best)
    af_best = af_swarm;
end
if foodconsistence(af_prey) > foodconsistence(af_best)
    af_best = af_prey;
end

if foodconsistence(af_best)>foodconsistence(af)
    af = af_best;
else
    af = move(af);
end
