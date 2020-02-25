%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% CONSTRUCTION D'INTERVALLES DE CONFIANCE %%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
close all;
addpath('.\functions');

max_t = 1;
max_c = 18;
M = 20;

% Temps moyen/max/min par mesure
mean_time = zeros();
max_time = zeros();
min_time = zeros();
var_time = zeros();

% Temps moyen/max/min par série de mesure (ie à t,c constants)
mean_time_tc = zeros();
max_time_tc = zeros();
min_time_tc = zeros();
var_time_tc = zeros();

% Intervalle de confiance
intervalle_confiance = zeros();

for t = 1:max_t
    for c = 1:max_c
        for m = 1:M
            [T, tire_title, simulationInfo] = mesureInit(t,c,m);
            mean_time(t,c,m) = mean(T);
            max_time(t,c,m) = max(T);
            min_time(t,c,m) = min(T);
            var_time(t,c,m) = var(T);
        end
        mean_time_tc(t,c) = mean(mean_time(t,c,:));
        max_time_tc(t,c) = max(max_time(t,c,:));
        min_time_tc(t,c) = min(min_time(t,c,:));
        var_time_tc(t,c) = mean(var_time(t,c,:));
        intervalle_confiance(t,c,1) = mean_time_tc(t,c) - 1.96*sqrt(var_time_tc(t,c))/sqrt(M);
        intervalle_confiance(t,c,2) = mean_time_tc(t,c) + 1.96*sqrt(var_time_tc(t,c))/sqrt(M);
    end
end





