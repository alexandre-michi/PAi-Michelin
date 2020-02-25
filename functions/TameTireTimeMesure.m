%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% MESURE DU TEMPS D'EXECUTION DE LA FONCTION %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = TameTireTimeMesure(t,c,m)

close all;
clear all;
addpath('C:\Users\Alexandre\Documents\Cours\2A\PRO\PAi\Package_TmTe_Michelin\Programme\functions');

% Numéro de la mesure 
% m = 1;
% 
% Sélection du pneu et des conditions
% t = 1;
% c = 1;

% Initialisation des variables pneu & conditions
[dataTires, dataConditions] = dataInit(t,c);
load(dataTires);
load(dataConditions);

% Mode de fonctionnement du logiciel
solverMode = 2;
calcOpt = 1;
imposedPressure = -1;
wearDegradation = 0;
load('PSCUP2_AV_6_1.mat');
rep = 1;
standStill = [0.25 0.01 0.20];
init_output;

% Gestion du temps
time=dataStruct.t;
timeIni = time(1);
deltaT = time(2)-time(1);
Tmax=max(time);

% Conditions initiales globales
pIni = 1.6;

% Initialisation de la simulation
cmd = 0;
tire_id = tametire(cmd, solverMode, calcOpt, rep, timeIni, pIni,...
    tAirInterneIni, tGi, tiIni, tsIni, T, scalingFactor, standStill,...
    fliptire, imposedPressure, wearDegradation);
i = 1;
Vx_i = Vel_x.signals.values(i);
Vy_i = Vel_y.signals.values(i);
p_i = Press.signals.values(i);
Fz_i = VerticalLoad(i);
gamma_i = InclinAngle.signals.values(i);
omega = compute_omega(SRinput.signals.values(i), Vx_i, T(6));
TSol = TempTrack.signals.values(i);
TAir = TempAir.signals.values(i);

% Mesure du temps
cmd = 1;

f = @() tametire(cmd, tire_id, solverMode, scalingFactor, deltaT, [Vx_i Vy_i], omega,...
    p_i, Fz_i, gamma_i, TSol, TAir, time(i), steerAngle);

T = zeros();
for j = 1:1000
    T(j) = timeit(f,39);
end

%T = struct2array(T);
saveMesure(m,T,tire_title,simulationName);

end
