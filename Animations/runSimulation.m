%=========================================================================%
%============================== runSimulation ============================%
%=========================================================================%
%=========================================================================%
%=========================================================================%

n=0;

while isfile(strcat('.\simData\simData', int2str(n), '.mat'))
    % file exists...
    tic
    %% Physical parameter
    load(strcat('.\simData\simData', int2str(n), '.mat'))

    % ou bien :
    % animationBasedOnRealSimulationData;

    %% SIM parameter
    load('PSCUP2_AV_6_1.mat')
    solverMode = 2;
    calcOpt = 1;
    rep = 1;
    timeIni = time(1);
    pIni = 1.6;
    tAirInterneIni = 70;
    tGi = 45;
    tiIni = 20;
    tsIni = 20;
    scalingFactor = ones(11,1);
    standStill = [0.25 0.01 0.20];
    fliptire = 0;
    imposedPressure = -1;
    wearDegradation = 0;
    deltaT = time(2)-time(1);
    steerAngle = 0;
    init_output;

    %% SIMULATION
    % Tametire init
    tire_id = tametire(0, solverMode, calcOpt, rep, timeIni, pIni,...
        tAirInterneIni, tGi, tiIni, tsIni, T, scalingFactor, standStill,...
        fliptire, imposedPressure, wearDegradation);

    % Tametire use
    for i = 1:length(time)
        Vx_i = Vel_x.signals.values(i);
        Vy_i = Vel_y.signals.values(i);
        p_i = Press.signals.values(i);
        Fz_i = VerticalLoad(i); %% change to Fz.signals.values(i)
        gamma_i = InclinAngle.signals.values(i);
        if i ~= 1
            omega = compute_omega(SRinput.signals.values(i), Vx_i, rroul(i-1));
        else
            omega = compute_omega(SRinput.signals.values(i), Vx_i, T(6));
        end
        start_time = cputime;
        [Fx(i), Fy(i), ...
            Mx(i), My(i), Mz(i), ...
            Tgi(i), Ts(i), Ti(i), ...
            p_out(i), tAirInterne(i), ...
            re(i), rroul(i), sa(i), sr(i), v(i), ...
            kzz(i), rnom(i),...
            wear(i), ppa(i),deltap(i),Nx(i),Ny(i),...
            TeqWLF(i), Tc0(i), Tcm(i), Tn(i), Wf(i),...
            pertes(i), G(i), Wg(i), deport_y(i), Pc0(i),...
            Lx(i), S2(i), D_MFD(i), IntWMeca(i), IntChim(i),...
            mu0(i), partChim(i)] = ...
        tametire(1, tire_id, solverMode, scalingFactor, deltaT, [Vx_i Vy_i], omega,...
            p_i, Fz_i, gamma_i, TempTrack.signals.values(i), TempAir.signals.values(i), time(i), steerAngle);
        
        
        stop_time = cputime;
        exec_time(i) = stop_time - start_time;
    end

    % Tametire end
    tametire(4, tire_id);
    
    ticToc = toc

    %% Save Results
    saveResults;

    %% Clear Section
    clearWorkspace;
    
    n = n+1
end

function omega = compute_omega(SR, Vx, Rroul)
    omega = (1+SR)*Vx/Rroul;
end
