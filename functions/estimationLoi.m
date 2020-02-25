%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% ESTMATION DE LA LOI A PARTIR D'UN VECTEUR %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [temps,freq,loi, M] = estimationLoi(T)

% Agrandissement d'échelle
T = T * 10/max(T);

h = histogram(T);
temps = h.BinEdges(1:end-1);
freq = histcounts(T);

%% Paramètre M : 1ère méthode d'estimation
% Indice de la fréquence max
ind_max = find(freq == max(freq));

% Reshape des vecteurs
dt = (temps(end) - temps(1))/length(temps);
temps = temps(ind_max:end) - min(temps);

freq = freq/sum(freq)/dt;
freq = freq(ind_max:end);

% Paramètre M
M = max(freq);

%% Paramètre M : 2ème méthode d'estimation
% Regression linéaire de log(freq) shifté

%% On renvoie le vecteur loi
loi = M * exp(-M * temps);
end


