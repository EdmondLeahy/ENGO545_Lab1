function [F] = TidalRegime(filename)
%Find the height of the water in seattle at specific time, by 
% findin the harmonic constituents
% Load the csv
C = csvread(filename);


K1 = C(4,1)*C(4,3);
O1 = C(6,1)*C(6,3);
M2 = C(1,1)*C(1,3);
S2 = C(2,1)*C(2,3);

F = (K1+O1)/(M2+S2);

end
