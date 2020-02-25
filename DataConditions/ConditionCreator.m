close all;

%%%%%%%%%%%%%%%%%%%%%%%
% CREATION DE CONDITIONS
%%%%%%%%%%%%%%%%%%%%%%%

% Initialisation
if exist('dataStruct','var')
else
    load('Replay.mat')
end

condition_title = 'condition 1';
condition_caracteristics = '';

% Slip angle
SABase = dataStruct.SA(:,3);

% Longitudinal Slip ratio
SRBase = dataStruct.SR(:,3);
SRinput.signals.values=SRBase;
SRinput.time=time;

% Define the air temperature [10,70]°C
TAir=40;
TempAir.signals.values=TAir * ones(length(SABase),1);
TempAir.time=time;

% Define the track temperature [10,70]°C
Tsol = 40;
TempTrack.signals.values=TSol * ones(length(SABase),1);
TempTrack.time=time;

% Define global road friction
muRoad.signals.values=Mug * ones(length(SABase),1);
muRoad.time=time;

% Vitesse longitudinale [0,250] (m/s)
Vx=cos(SABase).*((dataStruct.V(:,3)/3.6));
Vel_x.signals.values=Vx;
Vel_x.time=time;

% Vitesse transversale
Vy=sin(SABase).*((dataStruct.V(:,3)/3.6));
Vel_y.signals.values=Vy;
Vel_y.time=time;

% Force verticale
Mug=1;
Fz.signals.values=dataStruct.Z(:,3);
Fz.time=time;
standStill = [0.25 0.01 0.20];


% Penser à changer le numéro
save('DataConditions/condition1.mat');