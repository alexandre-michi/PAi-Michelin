%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% ESTMATION DE LA LOI A PARTIR D'UN VECTEUR %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [temps,freq,loi, M] = estimationLoi(T)

% Agrandissement d'�chelle
T = T * 10/max(T);

h = histogram(T);
temps = h.BinEdges(1:end-1);
freq = histcounts(T);

%% Param�tre M : 1�re m�thode d'estimation
% Indice de la fr�quence max
ind_max = find(freq == max(freq));

% Reshape des vecteurs
dt = (temps(end) - temps(1))/length(temps);
temps = temps(ind_max:end) - min(temps);

freq = freq/sum(freq)/dt;
freq = freq(ind_max:end);

% Param�tre M
M = max(freq);

%% Param�tre M : 2�me m�thode d'estimation
% Regression lin�aire de log(freq) shift�

%% On renvoie le vecteur loi
loi = M * exp(-M * temps);
end


