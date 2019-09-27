%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Source codes of Reference line generation via a QP based model
% Copyright Bai Li 2019
% 
% User may find that Sorry, a demo license for AMPL is limited to 300 variables 
% and 300 constraints and objectives (after presolve) for nonlinear 
% problems.  You have 2400 variables, 1794 constraints, and 1 objective.
% Getting a good license from AMPL would solve this problem. Details can be
% found in my book.
% For demo, setting distance = 12 would get rid of the license issue for the time being.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
close all
clc
warning off

distance = 100;
unit_gap = 1.0;
% Randomly generate the coarse waypoints
waypoints = GenerateRandomWaypoints(distance, unit_gap);
% Write the waypoints in a file
WriteWaypointsInFile(waypoints);

% Generate initial guess (although it seems useless)
!ampl R0.run
% QP solution with an initial guess
!ampl R1.run
% Show results in a figure
IllustrateSolution(waypoints);