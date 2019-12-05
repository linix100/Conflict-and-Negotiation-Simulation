%%% plotting

t_grid = 1:T;


%%% Output for Paper
figure(1);
subplot(2,2,1);
plot(t_grid, VESTED_INTEREST_A_ALL, t_grid, VESTED_INTEREST_EA_ALL, t_grid, VESTED_INTEREST_B_ALL, t_grid, VESTED_INTEREST_EB_ALL);
axis([0,T,-1,1]);
xlabel('Time(days)');
ylabel('Vested Interest in Conflict');
title('Vested Interest vs. Time');
legend('M.L. A', 'F.L. A', 'M.L. B', 'F.L. B');
subplot(2,2,2);
plot(t_grid, PERCEIVED_A_ALL, t_grid, PERCEIVED_EA_ALL, t_grid, PERCEIVED_B_ALL, t_grid, PERCEIVED_EB_ALL);
axis([0,T,-1,1]);
xlabel('Time(days)');
ylabel('Perceived Success');
title('Perceived Success vs. Time');
legend('M.L. A', 'F.L. A', 'M.L. B', 'F.L. B');
subplot(2,2,3);
plot(t_grid, PT_A, t_grid, PT_B);
axis([0,T,0,200]);
xlabel('Time(days)');
ylabel('Perceived Threat');
title('Perceived Threat vs. Time');
legend('Group A', 'Group B');
subplot(2,2,4);
plot(t_grid, CONFLICT_LEVEL);
axis([0 T 0 .2]);
xlabel('Time(days)');
ylabel('Total Conflict Level');
title('Total Conflict Level vs. Time');

%{
figure(2);
plot(t_grid, TIME_A_ALL, t_grid, TIME_EA_ALL, t_grid, TIME_B_ALL, t_grid, TIME_EB_ALL);
axis([0 T -1000 1000]);
%}



%%% Supposedly Goes from Matlab to Latex
%%% matrix2latex(OUTPUT_MATRIX, 'C:\Documents and Settings\All Users\Desktop\For Dr. Pierce\Output.tex','rowLabels',FIRST_ROW_STRING,'columnLabels',FIRST_COLUMN_ALT);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{ 
4 x 4 Cutoff Level Graphs
figure(2);
subplot(3,4,1);
plot(t_grid, VI_A_ALL,'r'); title('V.I. A');
axis([0 T -1 4]);
subplot(3,4,2);
plot(t_grid, VI_EA_ALL,':r'); title('V.I. EA');
axis([0 T -1 4]);
subplot(3,4,3);
plot(t_grid, VI_B_ALL,'g'); title('V.I. B');
axis([0 T -1 4]);
subplot(3,4,4);
plot(t_grid, VI_EB_ALL,':g'); title('V.I. EB');
axis([0 T -1 4]);

subplot(3,4,5);
plot(t_grid, THREAT_A_ALL,'r'); title('P.T. A');
axis([0 T -1 4]);
subplot(3,4,6);
plot(t_grid, THREAT_EA_ALL,':r'); title('P.T. EA');
axis([0 T -1 4]);
subplot(3,4,7);
plot(t_grid, THREAT_B_ALL,'g'); title('P.T. B');
axis([0 T -1 4]);
subplot(3,4,8);
plot(t_grid, THREAT_EB_ALL,':g'); title('P.T. EB');
axis([0 T -1 4]);

subplot(3,4,9);
plot(t_grid, PERCEIVED_SUCCESS_A_ALL,'r'); title('P.S. A');
axis([0 T -1 4]);
subplot(3,4,10);
plot(t_grid, PERCEIVED_SUCCESS_EA_ALL,':r'); title('P.S. EA');
axis([0 T -1 4]);
subplot(3,4,11);
plot(t_grid, PERCEIVED_SUCCESS_B_ALL,'g'); title('P.S. B');
axis([0 T -1 4]);
subplot(3,4,12);
plot(t_grid, PERCEIVED_SUCCESS_EB_ALL,':g'); title('P.S. EB');
axis([0 T -1 4]);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% 2 x 2 Vested Interest
%figure(4);
%subplot(2,2,1);
%plot(t_grid,VESTED_INTEREST_A_ALL); title('V.I. A');
%axis([0 10000 -1 1]);
%subplot(2,2,2);
%plot(t_grid,VESTED_INTEREST_EA_ALL); title('V.I. EA');
%axis([0 10000 -1 1]);
%subplot(2,2,3);
%plot(t_grid,VESTED_INTEREST_B_ALL); title('V.I. B');
%axis([0 10000 -1 1]);
%subplot(2,2,4);
%plot(t_grid,VESTED_INTEREST_EB_ALL); title('V.I. EB');
%axis([0 10000 -1 1]);


%%% 2 x 2 Perceived Threat
%figure(5);
%subplot(2,2,1);
%plot(t_grid,P_T_A_ALL); title('P.T. A');
%axis([0 10000 0 1]);
%subplot(2,2,2);
%plot(t_grid,P_T_A_ALL); title('P.T. EA');
%axis([0 10000 0 1]);
%subplot(2,2,3);
%plot(t_grid,P_T_B_ALL); title('P.T. B');
%axis([0 10000 0 1]);
%subplot(2,2,4);
%plot(t_grid,P_T_B_ALL); title('P.T. EB');
%axis([0 10000 0 1]);



%%% 2 x 2 Perceived Success
%figure(6);
%subplot(2,2,1);
%plot(t_grid,PERCEIVED_A_ALL); title('P.S. A');
%axis([0 10000 0 2]);
%subplot(2,2,2);
%plot(t_grid,PERCEIVED_EA_ALL); title('P.S. EA');
%axis([0 10000 0 2]);
%subplot(2,2,3);
%plot(t_grid,PERCEIVED_B_ALL); title('P.S. B');
%axis([0 10000 0 2]);
%subplot(2,2,4);
%plot(t_grid,PERCEIVED_EB_ALL); title('P.S. EB');
%axis([0 10000 0 2]);



figure(7);
plot(t_grid,PUBLIC_A_ALL,'r', t_grid,PUBLIC_B_ALL,'g'); title('Public Support');
axis([0 T 0 30]);


figure(8);
plot(t_grid,RESOURCES_A_ALL,'r', t_grid,RESOURCES_EA_ALL,':r', t_grid,RESOURCES_B_ALL,'g', t_grid,RESOURCES_EB_ALL,':g'); title('Resources');
axis([0 T 0 1000]);


figure(9);
plot(t_grid,TIME_A_ALL,'r', t_grid,TIME_EA_ALL,':r', t_grid,TIME_B_ALL,'g', t_grid,TIME_EB_ALL,':g'); title('Sigmoid Input');
axis([0 T -500 500]);


figure(10);
plot(t_grid,PERCEIVED_WEIGHT_A_ALL,'r', t_grid,PERCEIVED_WEIGHT_EA_ALL,':r', t_grid,PERCEIVED_WEIGHT_B_ALL,'g', t_grid,PERCEIVED_WEIGHT_EB_ALL,':g'); title('Success Sigmoid Input');
axis([0 T -50 50]);


figure(11);
plot(t_grid,P_S_A_ALL,'r', t_grid,P_S_EA_ALL,':r', t_grid,P_S_B_ALL,'g', t_grid,P_S_EB_ALL,':g'); title('Event Success');
axis([0 T -2 2]);


figure(12);
plot(t_grid, CONFLICT_LEVEL); title('Total Conflict Level');
axis([0 T 0 .25]);
%}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%