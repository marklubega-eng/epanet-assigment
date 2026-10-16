% test_network.m
% Load, inspect, plot, and simulate the student EPANET network.
% Keep student_network.inp in the same folder as this script.

clearvars;
clc;

inpFile = fullfile(pwd, 'student_network.inp');
if ~isfile(inpFile)
    error('student_network.inp was not found. Run create_network.m first.');
end

% Check that the EPANET-MATLAB Toolkit is on the MATLAB path.
which epanet

% Open the network.
d = epanet(inpFile);

% Display network information.
fprintf('\n--- NETWORK INFORMATION ---\n');
fprintf('Number of nodes: %d\n', d.getNodeCount);
fprintf('Number of links: %d\n', d.getLinkCount);

disp('Node IDs:');
disp(d.getNodeNameID);
disp('Node elevations:');
disp(d.getNodeElevations);
disp('Node base demands:');
disp(d.getNodeBaseDemands);
disp('Link IDs:');
disp(d.getLinkNameID);
disp('Link lengths:');
disp(d.getLinkLength);
disp('Link diameters:');
disp(d.getLinkDiameter);

% Plot the network layout.
figure;
d.plot;
title('Student Water Distribution Network');

% Run the complete simulation using the toolkit wrapper.
% If your installed toolkit reports a method-name error here, send that
% error message so the call can be adjusted to your installed version.
d.runsCompleteSimulation;
disp('Complete simulation command finished.');

% Retrieve result values where supported by the installed toolkit.
try
    disp('Node pressures:');
    disp(d.getNodePressure);
catch ME
    fprintf('Could not retrieve node pressure with this method: %s\n', ME.message);
end

try
    disp('Link flows:');
    disp(d.getLinkFlows);
catch ME
    fprintf('Could not retrieve link flow with this method: %s\n', ME.message);
end

% Close the toolkit session.
d.unload;
