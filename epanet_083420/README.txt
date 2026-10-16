EPANET–MATLAB Toolkit Assignment Starter Pack

Files:
1. student_network.inp — network input file for EPANET desktop and MATLAB.
2. create_network.m — recreates the .inp file in MATLAB's current folder.
3. test_network.m — opens the network, displays properties, plots it, and attempts a complete simulation.

Recommended workflow:
1. Extract this ZIP into one folder, for example Documents/EPANET_Assignment.
2. Open EPANET desktop and use File > Open to open student_network.inp.
3. Check the network map and run Project > Run Analysis. If EPANET reports an error, note the exact message.
4. In MATLAB, set the Current Folder to the extracted folder.
5. Ensure the EPANET-MATLAB Toolkit is on the MATLAB path; run start_toolkit if that is how your installation is configured.
6. Run create_network only if student_network.inp is missing.
7. Run test_network.m.

Important:
- This is an educational example, not a calibrated real-world network.
- The network uses LPS and Hazen–Williams head loss.
- The example contains reservoir R1, junctions J1/J2, tank T1, and pipes P1/P2/P3.
- MATLAB Toolkit method names can differ by version. If test_network.m reports a method error, share the exact error so the script can be adapted.
