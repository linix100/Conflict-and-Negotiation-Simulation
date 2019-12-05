
%%% init.m 
%%% This is the file to call when running the simulation. 
%%% For code description, please see 'readme.txt'
%%% 
%%% Xin Li 2012.8

%%% define and initialize variables



function [ampA ctcMLA ctcMLB ctcFA ctcFB negW rML rF v w p EVENT_TOTAL_A EVENT_TOTAL_B EVENT_TOTAL_EA EVENT_TOTAL_EB TOTAL_CONFLICT_AVERAGE MAXIMUM_CONFLICT_LEVEL] = init(ampA, ctcMLA, ctcMLB, ctcFA, ctcFB, negW, rML, rF, v, w, p)
%%% ampA is amplification for group A
%%% ctcMLA is commitment to conflict MLA
%%% ctcMLB is commitment to conflict MLB
%%% ctcFA is commitment to conflict FA
%%% ctcFB is commitment to conflit FB
%%% negW is multiplier for determining success/impact of negotiation on ctc
%%% rML is mainline resources
%%% rF is fringe resources
%%% v is "version"
%%% w is 1 for write data, 0 otherwise
%%% p is 1 for print plots, 0 otherwise

definitions;

PUBLIC_CONSTANT_A = ampA; %%%input('Please enter current Amplification of Public Support for A (between 0 and 10)');
PUBLIC_CONSTANT_B = ampA; %%%input('Please enter current Amplification of Public Support for B (between 0 and 10)');

INITIAL_PROPENSITY_A = ctcMLA; %%%input('Please enter initial commitment conflict x (-1 < x < 1) of M.L A:');
INITIAL_PROPENSITY_B = ctcMLB; %%%input('Please enter initial commitment for conflict x (-1 < x < 1) of M.L B:');

INITIAL_PROPENSITY_EA = ctcFA; %%%input('Please enter initial commitment for conflict x (-1 < x < 1) of F.L A:');
INITIAL_PROPENSITY_EB = ctcFB; %%%input('Please enter initial commitment for conflict x(-1 < x < 1) of F.L B:');

RESOURCES_A = rML; %%%input('Resource Level for EB (0-500):');
RESOURCES_B = rML; %%%input('Resource Level for EB (0-500):');

RESOURCES_EA = rF; %%%input('Resource Level for EB (0-500):');
RESOURCES_EB = rF; %%%input('Resource Level for EB (0-500):');



%%% create name for output files
RESULTS_PATH = '/home/asliva/ConflictModels/Threat_Models/ConflictModels/Results/sbp13/'
results_filename = strcat(RESULTS_PATH,'data','_','v',num2str(v),'.csv');
plot_filename = strcat(RESULTS_PATH,'plot','_',num2str(ampA),'_',num2str(ctcMLA),'_',num2str(ctcMLB),'_',num2str(ctcFA),'_',num2str(ctcFB),'_','v',num2str(v),'.jpg');

main;

%%%plotting;

%%% print2CommandLine;

write2file(w,p,results_filename,plot_filename,T, AverageA_All, AverageB_All,INITIAL_PROPENSITY_A,INITIAL_PROPENSITY_B,INITIAL_PROPENSITY_EA,INITIAL_PROPENSITY_EB, PUBLIC_CONSTANT_A,negW,Num_Neg_Events,EVENT_TOTAL_A,EVENT_TOTAL_B,EVENT_TOTAL_EA,EVENT_TOTAL_EB,TOTAL_CONFLICT_AVERAGE,MAXIMUM_CONFLICT_LEVEL,Average_PerceivedThreat_A,Average_PerceivedThreat_B,VESTED_INTEREST_A_ALL,VESTED_INTEREST_B_ALL,VESTED_INTEREST_EA_ALL,VESTED_INTEREST_EB_ALL);
