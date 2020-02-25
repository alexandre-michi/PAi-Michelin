%=========================================================================%
%============================== vibrations ===============================%
%=========================================================================%
%=========================================================================%
%=========================================================================%
taille = 200;

% vibrations : charge verticale ?
meanVerticalLoad = 2500; % charge verticale (kg)
maxVerticalLoadDelta = 10; % variations en sinus
VerticalLoad = meanVerticalLoad + maxVerticalLoadDelta * sin(linspace(0, 100*2*pi, 200)');

% ligne droite
SABase = 0 * ones(length(VerticalLoad),1); % slide angle (correspond à l'angle des roues, c'est l'angle de dérive)
SRBase = 0 * ones(length(VerticalLoad),1); % slide ratio


Pressure=1.6; % pression
CamberAngle=0; % angle de carrossage (cambrage de la roue)

% caractéristiques de la route
Mug=1; 
TSol=50;
TAir=50;

% vitesse
Speed=100;

Press.signals.values=Pressure * ones(length(VerticalLoad),1);
Fz.signals.values=VerticalLoad;
InclinAngle.signals.values=(CamberAngle/180*pi) * ones(length(VerticalLoad),1);
muRoad.signals.values=Mug * ones(length(VerticalLoad),1);
TempTrack.signals.values=TSol * ones(length(VerticalLoad),1);
TempAir.signals.values=TAir * ones(length(VerticalLoad),1);
Vy=sin(SABase).*((Speed/3.6));
Vx=cos(SABase).*((Speed/3.6));
Vel_x.signals.values=Vx;
Vel_y.signals.values=Vy;
SRinput.signals.values=SRBase;

time=((0:(15/(length(VerticalLoad)-1)):15));
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
    Result.SA=SA;
    Result.SR=SR;
    Result.Tgi=Tgi;
    Result.TempCore=TempCore;
    Result.TempSurf=TempSurf;
    
end

simulationName = "Vibrations";
simulationInfo = "Vibrations en sinus de la charge verticale ";
run("saveSimData.m");

clear CamberAngle derive_max InclinAngle Mug muRoad Press Pressure SAa SAb SABase SAc SRBase Speed TAir TempAir TempTrack time tout TSol Vel_x Vel_y VerticalLoad Vx Vy
clear Fx Fy Fz Mx My Mz Reff Rl SA SR Tgi TempCore TempSurf SRinput T x y
