%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% CHARGE UN VECTEUR MESURE PREEXISTANT %%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [T,tire_title,simulationInfo] = mesureInit(t,c,m)

% Chargement d'un vecteur de mesure de temps
filename = strcat('TimeMesures/Mesure-',num2str(t),'-',num2str(c),'-',num2str(m),'.mat');

% On v�rifie si le fichier existe
if exist(filename)
    Mesure = load(filename);
    T = Mesure.T;
    tire_title = Mesure.tire_title;
    simulationInfo = Mesure.simulationInfo;
else
    error("Ce fichier n'existe pas ! Cr�ez une s�rie de mesure");
end
end