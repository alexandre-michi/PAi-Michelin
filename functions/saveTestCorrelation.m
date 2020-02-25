%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% ENREGISTREMENT DU RESULTAT DU TEST DE CORRELATION AU FORMAT TestCorrelation-tire-cond.mat %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = saveTestCorrelation(t,c,R2,tire_title,simulationInfo)
filename = strcat('AjustementLoi/TestCorrelation-',num2str(t),'-',num2str(c),'.mat');
if exist(filename)
    error("La sauvegarde risque d'écraser un fichier déjà existant");
else
save(filename,'tire_title','simulationInfo','R2');
end
end