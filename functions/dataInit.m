function [dataTires, dataConditions] = dataInit(i,j)

% Chargement du modèle pneu
dataTires = strcat('DataTires/Tire', num2str(i), '.mat');

% Chargement des conditions initiales
dataConditions = strcat('DataConditions/simData', num2str(j), '.mat');

end

