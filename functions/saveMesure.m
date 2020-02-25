%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% ENREGISTREMENT DES MESURES AU FORMAT Mesure-tire-cond-mesure.mat %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = saveMesure(t,c,m,T,tire_title,simulationInfo)
filename = strcat('TimeMesures/Mesure-',num2str(t),'-',num2str(c),'-',num2str(m),'.mat');
if exist(filename)
    error("La sauvegarde risque d'écraser un fichier déjà existant");
else
save(filename,'tire_title','simulationInfo','T');
end
end

