clc
clear
close all

% ENGO 545 LAB 1 Tidal Potential, analysis and prediction

%CONSTANTS
Mm = 7.34767309*10^22; %Kg, Mass of Moon
dm = 384400; %Km, Distance to moon for mearth
Ms = 1.989*10^30; % kg, Mass of Sun
ds = 149600000; %Km, Distance to sun

%% Part 1: Tidal Potential and Distortion
% 1a)
% MOON
c=0;
for phi = 0:5:360
    c = c+1;
    V_m(c) = TidalPotentialFunction(phi,Mm,dm); 
    V_s(c) = TidalPotentialFunction(phi,Ms,ds);
end

figure()
plot(0:5:360,V_m)
title('Potential at Varying Phi for Sun and Moon')
xlabel('Phi (deg)')
ylabel('Potential V (?)')
grid on
hold on
plot(0:5:360,V_s)
xlabel('Phi (deg)')
ylabel('Potential V (?)')
grid on


% 3



