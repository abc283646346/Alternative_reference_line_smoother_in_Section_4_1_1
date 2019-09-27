param Nfe;
param Waypoints{i in {1..Nfe}, j in {1..2}};
var x{i in {1..3*Nfe}};
var y{i in {1..3*Nfe}};

minimize cost_function:
1;

s.t. fix_x{i in {0..(Nfe-1)}, j in {1..3}}:
x[3*i+j] = Waypoints[i+1,1];

s.t. fix_y{i in {0..(Nfe-1)}, j in {1..3}}:
y[3*i+j] = Waypoints[i+1,2];

data;
param Nfe:= include Nfe;
param Waypoints:= include Waypoints;