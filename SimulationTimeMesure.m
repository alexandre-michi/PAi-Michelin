close all;

% Initialisation des variables
[dataTires, dataConditions] = dataInit(1,1);
load(dataTires);
load(dataConditions);

% Initialisation de la simulation
tire_id = tametire(0, solverMode, calcOpt, rep, timeIni, pIni,...
    tAirInterneIni, tGi, tiIni, tsIni, T, scalingFactor, standStill,...
    fliptire, imposedPressure, wearDegradation);
i = 1;
Vx_i = Vel_x.signals.values(i);
Vy_i = Vel_y.signals.values(i);
p_i = Press.signals.values(i);
Fz_i = Fz.signals.values(i);
gamma_i = InclinAngle.signals.values(i);
omega = compute_omega(SRinput.signals.values(i), Vx_i, T(6));
