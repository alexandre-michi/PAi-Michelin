close all;

%%%%%%%%%%%%%%%%%%%%%%%
% CREATION D'UN PNEU 
%%%%%%%%%%%%%%%%%%%%%%%

% Initialisation
if exist('dataStruct','var')
else
    load('Replay.mat');
end

tire_title = 'pneu1';
tire_caracteritics = '';

% Gestion du temps
time=dataStruct.t;

% Temperature in the tire
tAirInterneIni = 70;
tGi = 45;
tiIni = 20;
tsIni = 20;

% Define the pressure inside the tire
Press.signals.values=dataStruct.P(:,3);
Press.time=time;

% Steering wheel angle [-90,90]°
steerAngle = 0;

% The side slip angle 
fliptire = 0;

% Tire inclination angle
InclinAngle.signals.values=dataStruct.CAR(:,3);
InclinAngle.time=time;

% Scaling factor
scalingFactor = ones(11,1);


% Penser à changer le numéro pour ne pas effacer
save('DataTires/tire1.mat');