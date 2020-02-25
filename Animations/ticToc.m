N = 100;
simName = "vibrations.m";
t = zeros(1,N);
for i = 1:1:N
    tic
    run(fullfile(simName));
    t(i) = toc;
end

%% Save data
if exist("Sim_time_results", "var")
    [x, y] = size(Sim_time_results);
    Sim_time_results(y+1).N = N;
    Sim_time_results(y+1).times = t;
    Sim_time_results(y+1).sim = simName;
else 
    Sim_time_results.N = N;
    Sim_time_results.times = t;
    Sim_time_results.sim = simName;    
end

clear i N;
%% Plot
plot(t, 'o-'); 

