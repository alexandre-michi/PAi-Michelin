%=========================================================================%
%============================== route mouillée =================================%
%=========================================================================%
%=========================================================================%
%=========================================================================%


% dérive : virage sinus
derive_max = 20;
SAa = (0/180*pi : 0.4/180*pi : derive_max/180*pi)';
SAb = (derive_max/180*pi : -0.4/180*pi : -derive_max/180*pi)';
SAc = (-derive_max/180*pi : 0.4/180*pi : 0/180*pi)';
SABase = [ SAa' SAb(2:end)' SAc(2:end)']';
SRBase = 0 * ones(length(SABase),1); % slide ratio


% caractéristiques route (mouillée ?)
Mug = 0.4; % sol mouillé
vMug = Mug * sin(linspace(0, 2*pi, length(SABase))');



Pressure=1.6; % pression
VerticalLoad=2500; % charge verticale
CamberAngle=0; % angle de carrossage (cambrage de la roue)

% caractéristiques de la route
%Mug=1;  % Jones and Childers report coefficients of friction of about 0.7 for dry roads and 0.4 for wet roads.
TSol=50; %°C
TAir=50; %°C

% vitesse
Speed=100; %km/h

Press.signals.values=Pressure * ones(length(SABase),1);
Fz.signals.values=VerticalLoad * ones(length(SABase),1);
InclinAngle.signals.values=(CamberAngle/180*pi) * ones(length(SABase),1);
muRoad.signals.values=vMug;
TempTrack.signals.values=TSol * ones(length(SABase),1);
TempAir.signals.values=TAir * ones(length(SABase),1);
Vy=sin(SABase).*((Speed/3.6));
Vx=cos(SABase).*((Speed/3.6));
Vel_x.signals.values=Vx;
Vel_y.signals.values=Vy;
SRinput.signals.values=SRBase;

time=((0:(15/(length(SABase)-1)):15));
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

simulationName = "Route";
simulationInfo = "Virage en sinus et route mouillée";
saveSimData;

clear simulationName simulationInfo taille CamberAngle derive_max InclinAngle Mug muRoad Press Pressure SAa SAb SABase SAc SRBase Speed TAir TempAir TempTrack time tout TSol Vel_x Vel_y VerticalLoad Vx Vy
clear Fx Fy Fz Mx My Mz Reff Rl SA SR Tgi TempCore TempSurf SRinput T x y