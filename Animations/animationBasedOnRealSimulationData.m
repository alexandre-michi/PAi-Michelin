%=========================================================================%
%================== Animation basée sur donnees_simu =====================%
%=========================================================================%
%=========================================================================%
%=========================================================================%

%% Physical parameter
% Loading from donnees_simu and fitting data to problem
load("Donnees_simu.mat"); % disons qu'on ne s'intéresse qu'au pneu avant droit (FR)...

taille = size(SIM_time);
CamberAngle = SIM_camber_FR; % angle de carrossage (cambrage de la roue)

% dérive
SABase = SIM_Slip_Angle_FR; % slide angle (correspond à l'angle des roues, c'est l'angle de dérive)
SRBase = SIM_Slip_Ratio_FR; % slide ratio


Pressure=1.6; % pression
VerticalLoad = SIM_Fz_FR; % charge verticale

% caractéristiques de la route
Mug=1;  
TSol=50; %°C
TAir=50; %°C

Press.signals.values = Pressure * ones(length(SABase),1); % constant pressure
Fz.signals.values= VerticalLoad;
InclinAngle.signals.values = (CamberAngle/180*pi);
muRoad.signals.values = Mug * ones(length(SABase),1); % constant mug
TempTrack.signals.values=TSol * ones(length(SABase),1); % constant ground temperature
TempAir.signals.values=TAir * ones(length(SABase),1); % constant air temperature
Vy=SIM_Vy;
Vx=SIM_Vx;
Vel_x.signals.values=Vx;
Vel_y.signals.values=Vy;
SRinput.signals.values=SRBase;

time=SIM_time;

Vel_x.time=time;
Vel_y.time=time;
Press.time=time;
Fz.time=time;
InclinAngle.time=time;
muRoad.time=time;
TempTrack.time=time;
TempAir.time=time;
SRinput.time=time;



% ---------------------
%% Editing parameters - Amplification
%Vel_x.signals.values = 1.5 * Vel_x.signals.values; % amplification des changements de vitesse par 1.5
%Vel_y.signals.values = 1.5 * Vel_x.signals.values; % amplification des changements de vitesse y par 1.5
%CamberAngle = 1.5 * CamberAngle; % amplification du camber angle par 1.5
%VerticalLoad = 1.5 * VerticalLoad; % amplification charge verticale x1.5
%SABase = 1.5 * SABase; % amplification slip angle x1.5
%SRBase = 1.5 * SRBase; % amplification slip ratio x1.5

%% Editing parameters - Adding aberrant values
% for x=1:size(SRinput.signals.values)
%     if mod(x, 100) == 0
%         SRinput.signals.values(x) = -max(SRinput.signals.values);
%     end
% end


%% File saving
simulationName = "aberrant values in SRinput (-max every 100 values) - animationBasedOnRealSimulationData";
simulationInfo = "On a chargé les données de donnees_simu issues du simulateur et on essaie d'amplifier certains paramètres pour observer leurs influence.";
saveSimData();

%% clear section
clear SIM_Ax SIM_Ay SIM_camber_FL SIM_camber_FR SIM_camber_RL SIM_camber_RR SIM_Fz_FL SIM_Fz_FR SIM_Fz_RL SIM_Fz_RR SIM_Slip_Angle_FL SIM_Slip_Angle_FR SIM_Slip_Angle_RL SIM_Slip_Angle_RR SIM_Slip_Ratio_FL SIM_Slip_Ratio_FR SIM_Slip_Ratio_FR SIM_Slip_Ratio_RL SIM_Slip_Ratio_RR SIM_time SIM_Vx SIM_Vy SIM_Wheel_Omega_FL SIM_Wheel_Omega_FR SIM_Wheel_Omega_RL SIM_Wheel_Omega_RR SIM_Yaw_Rate; 