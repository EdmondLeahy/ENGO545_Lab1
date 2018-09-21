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
% a) Phi
c = 0;
for phi = -90:5:90
    c = c+1;
    Ll = 0;
    delta = 0;
    [V20(c),V21(c),V22(c)] = TidalPotentialComponants(Mm, dm, phi,delta,Ll); 
end

figure()
plot(-90:5:90,V20)
title('Potential Componants at Varying Phi for Moon')
xlabel('Phi (deg)')
ylabel('Potential V (?)')
grid on
hold on 
plot(-90:5:90,V21)
plot(-90:5:90,V22)

% b) Ll
c = 0;
V20 = 0;
V21 = 0;
V22 = 0;
for Ll = -360:30:360
    c = c+1;
    phi = 0;
    delta = 0;
    [V20(c),V21(c),V22(c)] = TidalPotentialComponants(Mm, dm, phi,delta,Ll); 
end

figure()
plot(-360:30:360, V20)
title('Potential Componants at Varying Ll for Moon')
xlabel('Phi (deg)')
ylabel('Potential V (?)')
grid on
hold on 
plot(-360:30:360,V21)
plot(-360:30:360,V22)

% c) Ll
c = 0;
V20 = 0;
V21 = 0;
V22 = 0;
for delta = -30:2:30
    c = c+1;
    phi = 0;
    Ll = 0;
    [V20(c),V21(c),V22(c)] = TidalPotentialComponants(Mm, dm, phi,delta,Ll); 
end

figure()
plot(-30:2:30,V20)
title('Potential Componants at Varying Delta for Moon')
xlabel('Phi (deg)')
ylabel('Potential V (?)')
grid on
hold on 
plot(-30:2:30,V21)
plot(-30:2:30,V22)

%% Part 2
clc
clear
close all
c = 0;
for t = 1:0.5:168
    c = c+1;
   h(c) = HeightWaterSeattle(t,'SeattleConstituents.csv');
end

plot(h)
grid on
title('Height of water level at Seattle for 2019')
xlabel('t (hours)')
ylabel('Height (m)');
