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
%------------ FIGURE 1 --------------
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
legend('Moon', 'Sun')
grid on
%------------ FIGURE 2 --------------
figure()
plot(0:5:360,D_m)
title('Distortion at Varying Phi for Sun and Moon')
xlabel('Phi (deg)')
ylabel('Distortion (m)')
grid on
hold on
plot(0:5:360,D_s)
legend('Moon', 'Sun')
grid on

%--------------------------

% 3
% a) Phi
c = 0;
for phi = -90:5:90
    c = c+1;
    Ll = 0;
    delta = 0;
    [V20(c),V21(c),V22(c)] = TidalPotentialComponants(Mm, dm, phi,delta,Ll); 
end

%------------ FIGURE 3 --------------
figure()
plot(-90:5:90,V20)
title('Potential Componants at Varying Phi for Moon')
xlabel('Phi (deg)')
ylabel('Potential V (m^2/s^2)')
grid on
hold on 
plot(-90:5:90,V21)
plot(-90:5:90,V22)
legend('V20', 'V21','V22')
grid on

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

%------------ FIGURE 4 --------------
figure()
plot(-360:30:360, V20)
title('Potential Componants at Varying Ll for Moon')
xlabel('Phi (deg)')
ylabel('Potential V (m^2/s^2)')
grid on
hold on 
plot(-360:30:360,V21)
plot(-360:30:360,V22)
legend('V20', 'V21','V22')
grid on

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

%------------ FIGURE 5 --------------
figure()
plot(-30:2:30,V20)
title('Potential Componants at Varying Delta for Moon')
xlabel('Phi (deg)')
ylabel('Potential V (m^2/s^2)')
hold on 
plot(-30:2:30,V21)
plot(-30:2:30,V22)
legend('V20', 'V21','V22')
grid on

%% Part 2
clc
clear
close all
c = 0;
%50HR
for t = 0:1:50
    c = c+1;
    h_50(c) = HeightWaterSeattle(t,'Harmonic_Constituents.csv');
end
figure()
plot(h_50)
grid on
title('Height of water level at Seattle for 2019')
xlabel('t (hours)')
ylabel('Height (m)');

range_50 = max(h_50)-min(h_50);

%MONTH
for t = 0:1:24*30
    c = c+1;
   h_30(c) = HeightWaterSeattle(t,'Harmonic_Constituents.csv');
end
figure()
plot(h_30)
grid on
title('Height of water level at Seattle for 2019')
xlabel('t (days)')
ylabel('Height (m)');

range_30 = max(h_30)-min(h_30);

%YEAR
for t = 0:1:24*365
    c = c+1;
   h_360(c) = HeightWaterSeattle(t,'Harmonic_Constituents.csv');
end
figure()
plot(h_360)
grid on
title('Height of water level at Seattle for 2019')
xlabel('t (hours)')
ylabel('Height (m)');

range_360 = max(h_360)-min(h_360);
Seattle_LLWLT = min(h_360);
Seattle_HHWLT = max(h_360);

%-------------Bar chart
C = csvread('Harmonic_Constituents.csv');

sorted_data = sort(C(:,3), 'descend');
sorted_data(5,1) = sum(sorted_data(5:end));
figure()
bar(sorted_data(1:5))


%------------- F Number
F = TidalRegime('Harmonic_Constituents.csv');

%------------- Statistics
%Fig1
fprintf('Statistics for first 50 Hrs: \n\tRange: \t%f\n\tMean:\t%f\n\tLLWLT:\t%f\n\tHHWLT: \t%f \n',range_50, mean(h_50), min(h_50), max(h_50))
%Fig2
fprintf('Statistics for first 30 Days:\n\tRange: \t%f\n\tMean:%f\n\tLLWLT:\t%f\n\tHHWLT: \t%f  \n',range_30, mean(h_30), min(h_30), max(h_30))
%Fig3
fprintf('Statistics for the full year:\n\tRange: \t%f\n\tMean:\t%f\n\tLLWLT:\t%f\n\tHHWLT: \t%f \n',range_360, mean(h_360), min(h_360), max(h_360))




