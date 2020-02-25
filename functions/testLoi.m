%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TEST SI LES DONNEES SAUVEGARDES DANS LE VECTEUR NUMERO m SONT OK %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [R2] = testLoi(m)

% S�lection de la mesure
m = 1;

% R�cup�ration des mesures
T = mesureInit(m);

if exist(loi)
else
    loi = estimationLoi(T);
end

%% Test de corr�lation
R2 = cov(freq,loi).^2/(var(loi)*var(freq));

%% Test d'entropie crois�e

end