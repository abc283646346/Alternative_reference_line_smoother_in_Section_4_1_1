param Nfe;
param Waypoints{i in {1..Nfe}, j in {1..2}};
param buff = 0.2;

var x{i in {1..(3*Nfe)}};
var dx{i in {1..(3*Nfe)}};
var ddx{i in {1..(3*Nfe)}};
var dddx{i in {1..(3*Nfe)}};
var y{i in {1..(3*Nfe)}};
var dy{i in {1..(3*Nfe)}};
var ddy{i in {1..(3*Nfe)}};
var dddy{i in {1..(3*Nfe)}};

#### Optimization Objective ####
minimize cost_function:
sum{i in {1..3*Nfe}}(dy[i]^2 + dx[i]^2 + ddy[i]^2 + ddx[i]^2) + sum{i in {1..Nfe}}((x[3*i] - Waypoints[i,1])^2 + (y[3*i] - Waypoints[i,2])^2);

#### Kinematics ####
s.t. intgrate_dddx {i in {2..3*Nfe}}:
ddx[i] = ddx[i-1] + dddx[i];

s.t. intgrate_dddy {i in {2..3*Nfe}}:
ddy[i] = ddy[i-1] + dddy[i];

s.t. intgrate_ddx {i in {2..3*Nfe}}:
dx[i] = dx[i-1] + ddx[i-1] + 0.5 * dddx[i];

s.t. intgrate_ddy {i in {2..3*Nfe}}:
dy[i] = dy[i-1] + ddy[i-1] + 0.5 * dddy[i];

s.t. intgrate_dx {i in {2..3*Nfe}}:
x[i] = x[i-1] + dx[i-1] + 0.5 * ddx[i-1] + dddx[i] / 6;

s.t. intgrate_dy {i in {2..3*Nfe}}:
y[i] = y[i-1] + dy[i-1] + 0.5 * ddy[i-1] + dddy[i] / 6;


######### Attractions #########
s.t. attraction_x {i in {1..Nfe}}:
-buff + Waypoints[i,1] <= x[3*i] <= buff + Waypoints[i,1];

s.t. attraction_y {i in {1..Nfe}}:
-buff + Waypoints[i,2] <= y[3*i] <= buff + Waypoints[i,2];

data;
param Nfe:= include Nfe;
param Waypoints:= include Waypoints;