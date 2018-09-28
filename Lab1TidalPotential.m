clc
clear
close all

% ENGO 545 LAB 1 Tidal Potential, analysis and prediction

%CONSTANTS
Mm = 7.35*10^22; %Kg, Mass of Moon
dm = 0.38E9; %m, Distance to moon for mearth
Ms = 1.99*10^30; % kg, Mass of Sun
ds = 1.49E11; %m, Distance to sun

%% Part 1: Tidal Potential and Distortion
close all
clc
% 1a)
% MOON
c=0;
for phi = 0:5:360
    c = c+1;
    V_m(c) = TidalPotentialFunction(phi,Mm,dm); 
    V_s(c) = TidalPotentialFunction(phi,Ms,ds);
    D_m(c) = V_m(c)/9.81;
    D_s(c) = V_s(c)/9.81;
end

figure()
plot(0:5:360,V_m)
title('Potential at Varying Phi for Sun and Moon')
xlabel('Phi (deg)')
ylabel('Potential V (m^2/s^2)')
grid on
hold on
plot(0:5:360,V_s)
xlabel('Phi (deg)')
ylabel('Potential V (m^2/s^2)')
grid on

figure()
plot(0:5:360,D_m)
title('Distortion at Varying Phi for Sun and Moon')
xlabel('Phi (deg)')
ylabel('Distortion (m)')
grid on
hold on
plot(0:5:360,D_s)
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
ylabel('Potential V (m^2/s^2)')
grid on
hold on 
plot(-90:5:90,V21)
plot(-90:5:90,V22)

% b) Ll
c = 0;
V20 = 0;
V21 = 0;
V22 = 0;
for Ll = -360/4:360/48:360/4
    c = c+1;
    phi = 0;
    delta = 0;
    [V20(c),V21(c),V22(c)] = TidalPotentialComponants(Mm, dm, phi,delta,Ll);    
    [D20(c),D21(c),D22(c)] = TidalPotentialComponants(Mm, dm, phi,delta,Ll); 
end

figure()
plot(-360:30:360, V20)
title('Potential Componants at Varying Ll for Moon')
xlabel('Phi (deg)')
ylabel('Potential V (m^2/s^2)')
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
ylabel('Potential V (m^2/s^2)')
grid on
hold on 
plot(-30:2:30,V21)
plot(-30:2:30,V22)

%% Part 2
clc
clear
close all
c = 0;
%50HR
for t = 0:1:50
    c = c+1;
    h(c) = HeightWaterSeattle(t,'SeattleConstituents.csv');
end
figure()
plot(h)
grid on
title('Height of water level at Seattle for 2019')
xlabel('t (hours)')
ylabel('Height (m)');

range_50 = max(h)-min(h);

%MONTH
for t = 0:1:24*30
    c = c+1;
   h(c) = HeightWaterSeattle(t,'SeattleConstituents.csv');
end

plot(h)
grid on
title('Height of water level at Seattle for 2019')
xlabel('t (days)')
ylabel('Height (m)');

range_month = max(h)-min(h);

%YEAR
for t = 0:1:24*365
    c = c+1;
   h(c) = HeightWaterSeattle(t,'SeattleConstituents.csv');
end

plot(h)
grid on
title('Height of water level at Seattle for 2019')
xlabel('t (hours)')
ylabel('Height (m)');

range_year = max(h)-min(h);
Seattle_LLWLT = min(h);
Seattle_HHWLT = max(h);

