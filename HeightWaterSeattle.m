function [Ht] = HeightWaterSeattle(t,filename)
%Find the height of the water in seattle at specific time, by 
% findin the harmonic constituents
% Load the csv
C = csvread(filename);
H0 = 2.024; % From tidesandcurrents (MSL-MLLW)

E = 0;

    for i=1:length(C)
        fi = C(i,5);
        V0U = C(i,6);
        Hi = C(i,2);
        ai = C(i,3);
        ki = C(i,4);
    
        E = E + (fi*Hi*cosd(ai*t + V0U - ki));
    
    end

    Ht = H0 + E;

end

