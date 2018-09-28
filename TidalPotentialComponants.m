function [V20, V21, V22] = TidalPotentialComponants(Mo, d, phi, delta, Ll)
% Calculates the TidalPotential from one assumed point source
% at a specific spherical distance phi

% Constants
G = 6.674*10^-11; % m3/kg*s^2 Gravitational Constant
Re = 6.38E6; %m, Radius of the earth

theta = 90-phi;
Theta = 90-delta;

CONST = G*(Mo*Re^2/d^3);
V20 = CONST*((3/2)*cosd(theta).^2 - (1/2))*((3/2)*cosd(Theta).^2 - (1/2));
V21 = CONST*(3/4)*sind(2*theta)*sind(2*Theta) * cosd(Ll);

V22 = CONST*(3/4)*(sind(theta).^2)*(sind(Theta).^2)*cosd(2*(Ll));

end
