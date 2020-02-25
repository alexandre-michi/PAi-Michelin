% Pour sauver les données de simulation dans un .mat global

i = 0;
while isfile(strcat('.\simData\simData', int2str(i), '.mat'))
  % File exists.
  i = i+1;  
end

fileName = strcat('.\simData\simData', int2str(i), '.mat');

save(fileName, 'simulationName', 'simulationInfo',  'CamberAngle', 'InclinAngle', 'Mug', 'muRoad', 'Press', 'SABase', 'SRBase', 'SRinput', 'TempAir', 'TempTrack', 'time', 'Vel_x', 'Vel_y', 'Fz');

clear i fileName 

