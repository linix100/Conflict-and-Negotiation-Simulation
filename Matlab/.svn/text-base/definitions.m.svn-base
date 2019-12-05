%%% Variable Definitions

T = 10000; %%%Number of time increments, x axis for this simulation

WEIGHT_ALL = [1:T]; %%%Time as a column vector (1,2,3...,T)



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%% I. Strategy Matrix defined as follows:

PROB_MATRIX = [0,.00001,.00002;.000001,.00002,.00003;.00002,.00003,.05];
PROB_MATRIX(:,:,2) = [0,.00001,.00002;.00002,.000025,.00003;.00003,.01,.1];
PROB_MATRIX(:,:,3) = [.00001,.05,.1;.00002,.1,.25;.0005,.25,.5];

%%% The following loop is designed to run the simulation at different sets
%%% of initial conditions.

%{

PUBLIC_CONSTANT_A = 10; %%%input('Please enter current Amplification of Public Support for A (between 0 and 10)');
PUBLIC_CONSTANT_B = 10; %%%input('Please enter current Amplification of Public Support for B (between 0 and 10)');

INITIAL_PROPENSITY_A = .2; %%%input('Please enter initial commitment conflict x (-1 < x < 1) of M.L A:');
INITIAL_PROPENSITY_B = .2; %%%input('Please enter initial commitment for conflict x (-1 < x < 1) of M.L B:');

INITIAL_PROPENSITY_EA = .8; %%%input('Please enter initial commitment for conflict x (-1 < x < 1) of F.L A:');
INITIAL_PROPENSITY_EB = .8; %%%input('Please enter initial commitment for conflict x(-1 < x < 1) of F.L B:');

RESOURCES_A = 1000; %%%input('Resource Level for EB (0-500):');
RESOURCES_B = 1000; %%%input('Resource Level for EB (0-500):');

RESOURCES_EA = 100; %%%input('Resource Level for EB (0-500):');
RESOURCES_EB = 100; %%%input('Resource Level for EB (0-500):');

%}

%%% Probability Vectors
P_A_ALL = zeros(T,1);
P_EA_ALL = zeros(T,1);
P_B_ALL = zeros(T,1);
P_EB_ALL = zeros(T,1);

%%% Perceived Threat-related Vectors
P_T_A_ALL = zeros(T,1);
P_T_B_ALL = zeros(T,1);
P_T_EA_ALL = zeros(T,1);
P_T_EB_ALL = zeros(T,1);


TRACKER_PT_A_ALL = zeros(T,1); %%% This matrix ultimately works as a time tracker. Each column refers to the time elapsed after the intial event. 
TRACKER_PT_B_ALL = zeros(T,1); %%% These matrices should appear roughly as lower diagonal.
TRACKER_PT_EA_ALL = zeros(T,1);
TRACKER_PT_EB_ALL = zeros(T,1);

PERCEIVED_THREAT_A_ALL = zeros(T,1); %%% The nth column vector in this matrix represents the value of perceived threat due to event n, at time t
PERCEIVED_THREAT_B_ALL = zeros(T,1);
PERCEIVED_THREAT_EA_ALL = zeros(T,1);
PERCEIVED_THREAT_EB_ALL = zeros(T,1);



%%% Vested Interest-related Vectors
% COUNT_ALL = zeros(T,1); %%% Not needed anymore

TIME_A_ALL = zeros(T,1);  %%% x_t for A (1 X T vector)
TIME_EA_ALL = zeros(T,1); %%% x_t for EA
TIME_B_ALL = zeros(T,1);  %%% x_t for B
TIME_EB_ALL = zeros(T,1); %%% x_t for EB

DA_ALL = zeros(T,1);  %%% Vested interest calculation as well...
DEA_ALL = zeros(T,1); 
DB_ALL = zeros(T,1);  
DEB_ALL = zeros(T,1); 

VESTED_INTEREST_A_ALL = zeros(T,1); %%% Vested interest calculation(1 X T vector) 
VESTED_INTEREST_EA_ALL = zeros(T,1);
VESTED_INTEREST_B_ALL = zeros(T,1);
VESTED_INTEREST_EB_ALL = zeros(T,1);


% $$$ FREQUENCY_A_ALL = zeros(T,1);
% $$$ FREQUENCY_EA_ALL = zeros(T,1);
% $$$ FREQUENCY_B_ALL = zeros(T,1);
% $$$ FREQUENCY_EB_ALL = zeros(T,1);
% $$$ 
% $$$ SUPPORT_A_ALL = zeros(T,1);
% $$$ SUPPORT_EA_ALL = zeros(T,1);
% $$$ SUPPORT_B_ALL = zeros(T,1);
% $$$ SUPPORT_EB_ALL = zeros(T,1);
% $$$ 
% $$$ SCALE_E_A_ALL = zeros(T,1);
% $$$ SCALE_E_EA_ALL = zeros(T,1);
% $$$ SCALE_E_B_ALL = zeros(T,1);
% $$$ SCALE_E_EB_ALL = zeros(T,1);


%%% Perceived Success-related Vectors
TRACKER_A_ALL = zeros(T,1); %%% Time tracker from events. Each column is a time point, row is an event, value is the time since event.
TRACKER_EA_ALL = zeros(T,1);
TRACKER_B_ALL = zeros(T,1);
TRACKER_EB_ALL = zeros(T,1);

P_S_A_ALL = zeros(T,1); %%% Sum u_t of past success
P_S_EA_ALL = zeros(T,1);
P_S_B_ALL = zeros(T,1);
P_S_EB_ALL = zeros(T,1);

PERCEIVED_WEIGHT_A_ALL = zeros(T,1); %% s_t
PERCEIVED_WEIGHT_EA_ALL = zeros(T,1);
PERCEIVED_WEIGHT_B_ALL = zeros(T,1);
PERCEIVED_WEIGHT_EB_ALL = zeros(T,1);

SUCCESS_A_ALL = zeros(T,1); %%% Success from event n at time t (u_n_t)
SUCCESS_EA_ALL = zeros(T,1);
SUCCESS_B_ALL = zeros(T,1);
SUCCESS_EB_ALL = zeros(T,1);

PERCEIVED_A_ALL = zeros(T,1); %%% Perceived success calculations (S)
PERCEIVED_EA_ALL = zeros(T,1);
PERCEIVED_B_ALL = zeros(T,1);
PERCEIVED_EB_ALL = zeros(T,1);

RESOURCE_WEIGHT_A_ALL = zeros(T,1); %%% resources at time t
RESOURCE_WEIGHT_EA_ALL = zeros(T,1);
RESOURCE_WEIGHT_B_ALL = zeros(T,1);
RESOURCE_WEIGHT_EB_ALL = zeros(T,1);

%%% Perceived Success Dimensional Trackers
PERCEIVED_SUCCESS_A_ALL = ones(T,1);   %% keeping track of states
PERCEIVED_SUCCESS_B_ALL = ones(T,1);
PERCEIVED_SUCCESS_EA_ALL = ones(T,1);
PERCEIVED_SUCCESS_EB_ALL = ones(T,1);



%%% Vested Interest Dimensional Trackers
VI_A_ALL = ones(T,1);
VI_EA_ALL = ones(T,1);
VI_B_ALL = ones(T,1);
VI_EB_ALL = ones(T,1);

%%% Perceived Threat Dimensional Trackers
THREAT_A_ALL = ones(T,1);
THREAT_EA_ALL = ones(T,1);
THREAT_B_ALL = ones(T,1);
THREAT_EB_ALL = ones(T,1);

%%% Resource Vectors
RESOURCES_A_ALL = zeros(T,1); %% resources at time t--depleted if
                              %make attack and regenerate slowly if
                              %no attack
RESOURCES_EA_ALL = zeros(T,1);
RESOURCES_B_ALL = zeros(T,1);
RESOURCES_EB_ALL = zeros(T,1);

%%% Event Total Vectors
EVENT_TOTAL_A_ALL = zeros(T,1);
EVENT_TOTAL_EA_ALL = zeros(T,1);
EVENT_TOTAL_B_ALL = zeros(T,1);
EVENT_TOTAL_EB_ALL = zeros(T,1);

%%% Binomial Event Marker
EVENT_A_ALL = zeros(T,1);
EVENT_EA_ALL = zeros(T,1);
EVENT_B_ALL = zeros(T,1);
EVENT_EB_ALL = zeros(T,1);

%%% Intensity Vectors
INTENSITY_A_ALL = zeros(T,1);  %% rolling average of event
                               %totals--ratio of events per year
INTENSITY_EA_ALL = zeros(T,1);
INTENSITY_B_ALL = zeros(T,1);
INTENSITY_EB_ALL = zeros(T,1);


%%% Public Payoff-related Vectors (??)
PUBLIC_A_ALL = zeros(T,1);
PUBLIC_B_ALL = zeros(T,1);


%%% III. Initial Conditions

%%% Probability that ___ causes an event
P_A = 0;   
P_EA = 0; 
P_B = 0;
P_EB = 0;

%%% Perceived Threat Related 

N_PT_A = 1; %%%This is the current number of columns in the threat/time matrix
N_PT_B = 1;
N_PT_EA = 1;
N_PT_EB = 1;

VECTOR_PT_A_ALL = zeros(1,N_PT_A); %%%This vector represents the event strength for each attack. Dimensions add for each attack
VECTOR_PT_B_ALL = zeros(1,N_PT_B); %% random number generated for each event
                                   %[0,1]-->look at Richardson/Clauset for
                                   %power law stuff
VECTOR_PT_EB_ALL = zeros(1,N_PT_B);
VECTOR_PT_EA_ALL = zeros(1,N_PT_B);

%%% ????
PT_A = zeros(T,1); 
PT_B = zeros(T,1);
    

%%% Vested Interest Related
COUNT = 0;

TIME_A = 0;
TIME_EA = 0;
TIME_B = 0;
TIME_EB = 0;


%%%Place Markers--deprecated
C_A = 0; 
C_B = 0;
C_EA = 0;
C_EB = 0;

%%% maybe old too
SCALE_E_A = .5;
SCALE_E_EA = .5;
SCALE_E_B = .5;
SCALE_E_EB = .5;

%%% Perceived Success related
N_A = 1; %%%Keeps track of the row used from the perceived success matrix
N_EA = 1;
N_B = 1;
N_EB = 1;

VECTOR_A_ALL = zeros(1,N_A);
VECTOR_EA_ALL = zeros(1,N_EA);
VECTOR_B_ALL = zeros(1,N_B);
VECTOR_EB_ALL = zeros(1,N_EB);


%%% Intensity related
INTENSITY_A = 0;
INTENSITY_EA = 0;
INTENSITY_B = 0;
INTENSITY_EB = 0;

%%% Event Counters
EVENT_TOTAL_A = 0;
EVENT_TOTAL_EA = 0;
EVENT_TOTAL_B = 0;
EVENT_TOTAL_EB = 0;

%%% Ultimate Conflict Level
CONFLICT_LEVEL = zeros(T,1);

%%% Public Payoff related
CUTOFF_A = 0;
CUTOFF_B = 0;

%%% Event Tracking for resource purposes
E_TRACK_A = zeros(100, 1); %%% old one too
E_TRACK_EA = zeros(100, 1);
E_TRACK_B = zeros(100, 1);
E_TRACK_EB = zeros(100, 1);

%%% threat decay level:
ab = .005;

INITIAL_SUCCESS_HISTORY_A = 0; %%%input('Please enter initial history of past success (-1 < h < 1) of M.L.A.');
INITIAL_SUCCESS_HISTORY_EA = 0; %%%input('Please enter initial history of past success (-1 < h < 1) of F.L.A.');
INITIAL_SUCCESS_HISTORY_B = 0; %%%input('Please enter initial history of past success (-1 < h < 1) of M.L.B.');
INITIAL_SUCCESS_HISTORY_EB = 0; %%%input('Please enter initial history of past success (-1 < h < 1) of F.L.B.');

FORGET_A = 50; %%%input('Please enter initial forget number (i.e. length of time before an event ceases to matter) of M.L.A.:');
FORGET_EA = 50; %%%input('Please enter initial forget number (i.e. length of time before an event ceases to matter) of F.L.A.:');
FORGET_B = 50; %%%input('Please enter initial forget number (i.e. length of time before an event ceases to matter) of M.L.B.:');
FORGET_EB = 50; %%%input('Please enter initial forget number (i.e. length of time before an event ceases to matter) of F.L.B.:');

%%% Constraint on how often someone can create an event
WAITING_CONSTANT_A = 50; %%%input('Please enter waiting time constant of M.L.A:  ');
WAITING_CONSTANT_EA = 50; %%%input('Please enter waiting time constant of F.L.A:  ');
WAITING_CONSTANT_B = 50; %%%input('Please enter waiting time constant of M.L.A:  ');
WAITING_CONSTANT_EB = 50; %%%input('Please enter waiting time constant of F.L.A:  ');

%%% Waiting Times (INITIAL WAITING TIME TO MAKE ATTACK)
WAITING_TIME_A = 50;
WAITING_TIME_EA = 50;
WAITING_TIME_B = 50;
WAITING_TIME_EB = 50;

%%% Waiting time tracker (initialize to zero)
WAITING_TRACKER_A = 0;
WAITING_TRACKER_EA = 0;
WAITING_TRACKER_B = 0;
WAITING_TRACKER_EB = 0;


%%%Dimensional Cutoffs

PS_CUTOFF_LM = -.5; %%%input('Perceived Success cutoff (low to med):');
PS_CUTOFF_MH = .5; %%%input('Perceived Success cutoff (med to high):');

PT_CUTOFF_LM = 20; %%%input('Perceived Threat cutoff (low to med):');
PT_CUTOFF_MH = 40; %%%input('Perceived Threat cutoff (med to high):');

VI_CUTOFF_LM = -.5; %%%input('Vested Interest cutoff (low to med):');
VI_CUTOFF_MH = .5; %%%input('Vested Interest cutoff (med to high):');


%%% Not used
IMPORTANCE_A = .5; %%%input('Please enter importance of goal for public A (between 0 and 1):');
IMPORTANCE_B = .5; %%%input('Please enter importance of goal for public B (between 0 and 1):');

%%%% Negotiation related
AverageA_All=0;
AverageB_All=0;
Average_PerceivedThreat_A=0;
Average_PerceivedThreat_B=0;

Num_Neg_Events=0;

Peace_Level_Threshold=0.02;

Prob_Init_Neg_Event=.75;

Days_Ahead=0;

Neg_Event_On=0;

Neg_Event_Strength=0;

Neg_Date=10000;

Number_PT=0;

Neg_PT= zeros(T,1);

Neg_PT_All=zeros(T,1);

Neg_Threat_Count=0;



Neg_Success_Prob=0;

Neg_Public_Support=zeros(T,1);