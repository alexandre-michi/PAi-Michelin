exeTime.ticToc = zeros(19);
exeTime.execTime = zeros(19);
for i = 1:18
    fileName = strcat('.\simResults\Results', int2str(i), '.mat');
    load(fileName, 'ticToc', 'exec_time');
    exeTime.ticToc(i) = ticToc;
    exeTime.execTime(i) = exec_time(1);
end

subplot(1, 2, 1); plot(exeTime.ticToc, 'x--'); title("TicToc");
subplot(1, 2, 2); plot(exeTime.execTime, 'x--'); title("exec_time");
