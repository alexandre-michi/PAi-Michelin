%=========================================================================%
%======================= température - rampe =============================%
%=========================================================================%
%=========================================================================%
%=========================================================================%
taille = 200;

TSol=100; %°C
T_sol = TSol * linspace(-0.2, 1, taille)';

TAir=50; %°C
T_Air = TAir * ones(length(T_sol), 1);

% dérive : ligne droite
SABase = 0 * ones(length(T_sol),1); % slide angle (correspond à l'angle des roues, c'est l'angle de dérive)
SRBase = 0 * ones(length(T_sol),1); % slide ratio


Pressure=1.6; % pression
VerticalLoad=2500; % charge verticale
CamberAngle=0; % angle de carrossage (cambrage de la roue)

% caractéristiques de la route
Mug=1; 

% vitesse
Speed=100; %km/h

Press.signals.values=Pressure * ones(length(T_sol),1);
Fz.signals.values=VerticalLoad * ones(length(T_sol),1);
InclinAngle.signals.values=(CamberAngle/180*pi) * ones(length(T_sol),1);
muRoad.signals.values=Mug * ones(length(T_sol),1);
TempTrack.signals.values=T_sol; % rampe de température sol (0 à Tsol)
TempAir.signals.values=T_Air;
Vx=(Speed/3.6) * ones(taille, 1);
Vy = zeros(taille, 1);
Vel_x.signals.values=Vx;
Vel_y.signals.values=Vy;
SRinput.signals.values=SRBase;

time=((0:(15/(length(T_sol)-1)):15));
T=max(time);

Vel_x.time=time;
Vel_y.time=time;
Press.time=time;
Fz.time=time;
InclinAngle.time=time;
muRoad.time=time;
TempTrack.time=time;
TempAir.time=time;
SRinput.time=time;

sim('TT_seul');

if exist('Result','var')
    
    [x,y]=size(Result);
    Result(y+1).Fx=Fx;
    Result(y+1).Fy=Fy;
    Result(y+1).Mx=Mx;
    Result(y+1).My=My;
    Result(y+1).Mz=Mz;
    Result(y+1).Reff=Reff;
    Result(y+1).Rl=Rl;
    Result(y+1).Kzz=Kzz;
    Result(y+1).SA=SA;
    Result(y+1).SR=SR;
    Result(y+1).Tgi=Tgi;
    Result(y+1).TempCore=TempCore;
    Result(y+1).TempSurf=TempSurf;
    
else
    
    Result.Fx=Fx;
    Result.Fy=Fy;
    Result.Mx=Mx;
    Result.My=My;
    Result.Mz=Mz;
    Result.Reff=Reff;
    Result.Rl=Rl;
    Result.Kzz=Kzz;
    Result.SA=SA;
    Result.SR=SR;
    Result.Tgi=Tgi;
    Result.TempCore=TempCore;
    Result.TempSurf=TempSurf;
    
end

simulationName = "Temperature";
simulationInfo = "Rampe de température sol (0 à Tsol)";
run("saveSimData.m");

clear CamberAngle derive_max InclinAngle Mug muRoad Press Pressure SAa SAb SABase SAc SRBase Speed TAir TempAir TempTrack time tout TSol Vel_x Vel_y VerticalLoad Vx Vy
clear Fx Fy Fz Mx My Mz Reff Rl SA SR Tgi TempCore TempSurf SRinput T x y