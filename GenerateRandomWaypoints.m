function waypoints = GenerateRandomWaypoints(distance, unit_gap)
Nfe = round(distance / unit_gap);
delete('Nfe');
fid = fopen('Nfe', 'w');
fprintf(fid,'%g', Nfe);
fclose(fid);

waypoints = cell(1,Nfe);
theta = rand * 2 * pi;
wx = 0;
wy = 0;
point.x = wx; point.y = wy;
waypoints{1} = point;

for ii = 2 : Nfe
    theta = theta + randn * 0.3;
    wx = wx + unit_gap * cos(theta);
    wy = wy + unit_gap * sin(theta);
    point.x = wx; point.y = wy;
    waypoints{ii} = point;
end