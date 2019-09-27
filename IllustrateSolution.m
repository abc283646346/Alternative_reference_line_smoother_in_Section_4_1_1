function IllustrateSolution(waypoints)
figure (501)
load x.txt
load y.txt
plot(x,y,'k');
axis equal;
hold on
for ii = 1 : length(waypoints)
    plot(waypoints{ii}.x, waypoints{ii}.y, 'r.');
end
xlabel('x axls');
ylabel('y axls');
axis tight
box on;
grid on;
end