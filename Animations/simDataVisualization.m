close all;

% WORK IN PROGRESS

%% Tool for simulation data visualization
load(".\simData\simData21.mat");

if exist('simulationName', 'var')
    figure('Name', simulationName); 
    
    figTitles = ["InclinAngle", "SABase", "SRinput", "Vel_x", "Vel_y", "VerticalLoad"]';
    figVariables = [InclinAngle.signals.values, SABase, SRinput.signals.values, Vel_x.signals.values, Vel_y.signals.values, VerticalLoad]';
    N = 6;
    
    for i=1:N
        subplot(2, 3, i);
        plot(time, figVariables(i,:), 'b');
        title(figTitles(i));
    end
end


%% Comparison of edited parameters
figure('Name', 'SRinput');
plot(time, SRinput.signals.values, 'rx'); hold on;

load("Donnees_simu.mat", 'SIM_Slip_Ratio_FR');
plot(time, SIM_Slip_Ratio_FR, 'b'); hold off;
title('Ajout de points "aberrants" dans la série de SRinput');


%% Clear section
clear figTitles figVariables N n y;