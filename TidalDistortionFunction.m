function [V] = TidalDistortionFunction(phi, Mo, d)
% Calculates the TidalPotential from one assumed point source
% at a specific spherical distance phi

% Constants
G = 6.67*10^-11; % m3/kg*s^2 Gravitational Constant
Re = 6371; %Km, Radius of the earth

V = G*(Mo*Re^2/d^3)*((3/2)*cosd(phi)^2 - (1/2));


end
