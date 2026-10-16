% create_network.m
% Creates student_network.inp in the current MATLAB folder.
% Run this script once if the .inp file is missing.

inpFile = fullfile(pwd, 'student_network.inp');
fid = fopen(inpFile, 'w');
if fid == -1
    error('Could not create student_network.inp. Check folder permissions.');
end

fprintf(fid, '[TITLE]\nStudent Water Distribution Network\n\n');
fprintf(fid, '[JUNCTIONS]\n;ID Elevation Demand\nJ1 100 0.5\nJ2 95 0.3\n\n');
fprintf(fid, '[RESERVOIRS]\n;ID Head\nR1 130\n\n');
fprintf(fid, '[TANKS]\n;ID Elevation InitLevel MinLevel MaxLevel Diameter MinVol\nT1 90 5 0 10 20 0\n\n');
fprintf(fid, '[PIPES]\n;ID Node1 Node2 Length Diameter Roughness MinorLoss Status\n');
fprintf(fid, 'P1 R1 J1 1000 200 130 0 Open\n');
fprintf(fid, 'P2 J1 J2 800 150 130 0 Open\n');
fprintf(fid, 'P3 J2 T1 500 150 130 0 Open\n\n');
fprintf(fid, '[OPTIONS]\nUNITS LPS\nHEADLOSS H-W\nQUALITY NONE\n\n');
fprintf(fid, '[TIMES]\nDURATION 0:00\nHYDRAULIC TIMESTEP 1:00\nQUALITY TIMESTEP 0:05\nREPORT TIMESTEP 1:00\n\n');
fprintf(fid, '[REPORT]\nSTATUS YES\nSUMMARY YES\nNODES ALL\nLINKS ALL\n\n');
fprintf(fid, '[COORDINATES]\nR1 0 0\nJ1 100 0\nJ2 200 0\nT1 300 0\n\n');
fprintf(fid, '[END]\n');
fclose(fid);
fprintf('Created network file: %s\n', inpFile);
