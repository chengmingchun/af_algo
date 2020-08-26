%%%%%%%% swarm random
function af = swarm(af)
global afs;
global af_total;
n = 0;
route_center = zeros(1,341);

for i = 1:1:af_total
    if dstc(af,afs{i}) < af.visual
        n=n+1;
        temp =  afs{i}.route();
        for j = 1:341
            route_center(j) = route_center(j) + temp(j);
        end
    end
end

if n~=0
    for i = 1:341
        route_center(i) = round(route_center(i)/n);
    end
end

center = afs{1}.route;
for i = 2:1:af_total
    afs_route = fget(afs{i},'route');
    out1 = 0;
    out2 = 0;
    %%% 找到接近中心解的解
    for j = 1:341
        out1 = out1 + sign(abs(center(j)-route_center(j)));
        out2 = out2 + sign(abs(afs_route(j)-route_center(j)));
    end
    if out2<out1
        center = afs_route;
    end
end

if (foo(center)*n>foodconsistence(af)*af.delta) && (sum(center)~=sum(af.route))
    af.route = center;
end
