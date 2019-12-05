%%% main loop

for t = 1:T
    %%% determine prob. of event at time t

    if t == 1
        P_A_ALL(t) = 0;
        P_EA_ALL(t) = 0;
        P_B_ALL(t) = 0;
        P_EB_ALL(t) = 0;
    else
        P_A_ALL(t) = PROB_MATRIX(THREAT_A_ALL(t-1),PERCEIVED_SUCCESS_A_ALL(t-1),VI_A_ALL(t-1));
        P_EA_ALL(t) = PROB_MATRIX(THREAT_EA_ALL(t-1),PERCEIVED_SUCCESS_EA_ALL(t-1),VI_EA_ALL(t-1));
        P_B_ALL(t) = PROB_MATRIX(THREAT_B_ALL(t-1),PERCEIVED_SUCCESS_B_ALL(t-1),VI_B_ALL(t-1));
        P_EB_ALL(t) = PROB_MATRIX(THREAT_EB_ALL(t-1),PERCEIVED_SUCCESS_EB_ALL(t-1),VI_EB_ALL(t-1));
    end



    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


    %%%The following loops determine every other value in the simulation


    %%% Here are the event-related loops. Everything determined directly by
    %%% the existence of an attack or threat is decided here, including Event Strength, Reaction Strength,
    %%% Event Totals, EVENT_#_ALL, and Resources.

    if (RESOURCES_A > 100) && ((t - WAITING_TRACKER_A) > WAITING_TIME_A)         
        EVENT_A = rand < P_A_ALL(t);

        if EVENT_A
            EVENT_A_ALL(t) = 1;

            EVENT_TOTAL_A = EVENT_TOTAL_A + 1;
            EVENT_TOTAL_A_ALL(t) = EVENT_TOTAL_A;

            EVENT_STRENGTH_A = rand;
            REACTION_STRENGTH_A = 2*rand - 1;
            WAITING_TIME_A = WAITING_CONSTANT_A*EVENT_STRENGTH_A;
            WAITING_TRACKER_A = t;

            RESOURCES_A = RESOURCES_A - EVENT_STRENGTH_A*100;
        else
            EVENT_A_ALL(t) = 0;
            EVENT_STRENGTH_A = 0;

            EVENT_TOTAL_A_ALL(t) = EVENT_TOTAL_A;
            

        end

    else
        EVENT_A = 0;
        EVENT_A_ALL(t) = EVENT_A;
        EVENT_STRENGTH_A = 0;

        EVENT_TOTAL_A_ALL(t) = EVENT_TOTAL_A;
    end

    
    
    if (RESOURCES_B > 100) && ((t - WAITING_TRACKER_B) > WAITING_TIME_B)
        EVENT_B = rand < P_B_ALL(t);

        if EVENT_B
            EVENT_B_ALL(t) = 1;

            EVENT_TOTAL_B = EVENT_TOTAL_B + 1;
            EVENT_TOTAL_B_ALL(t) = EVENT_TOTAL_B;

            EVENT_STRENGTH_B = rand;
            REACTION_STRENGTH_B = 2*rand - 1;
            WAITING_TIME_B = WAITING_CONSTANT_B*EVENT_STRENGTH_B;
            WAITING_TRACKER_B = t;
            RESOURCES_B = RESOURCES_B - EVENT_STRENGTH_B*100;
        else
            EVENT_B_ALL(t) = 0;
            EVENT_STRENGTH_B = 0;

            EVENT_TOTAL_B_ALL(t) = EVENT_TOTAL_B;

        end
    else
        EVENT_B = 0;
        EVENT_B_ALL(t) = EVENT_B;
        EVENT_STRENGTH_B = 0;

        EVENT_TOTAL_B_ALL(t) = EVENT_TOTAL_B;
    end



    if (RESOURCES_EA > 10) && ((t - WAITING_TRACKER_EA) > WAITING_TIME_EA)
        EVENT_EA = rand < P_EA_ALL(t);

        if EVENT_EA
            EVENT_EA_ALL(t) = 1;

            EVENT_TOTAL_EA = EVENT_TOTAL_EA + 1;
            EVENT_TOTAL_EA_ALL(t) = EVENT_TOTAL_EA;

            EVENT_STRENGTH_EA = rand;
            REACTION_STRENGTH_EA = 2*rand - 1;
            WAITING_TIME_EA = WAITING_CONSTANT_EA*EVENT_STRENGTH_EA;
            WAITING_TRACKER_EA = t;

            RESOURCES_EA = RESOURCES_EA - EVENT_STRENGTH_EA*10;
        else                        

            EVENT_TOTAL_EA_ALL(t) = EVENT_TOTAL_EA;

            EVENT_STRENGTH_EA = 0;
            EVENT_EA_ALL(t) = 0;

            
        end

    else
        EVENT_EA = 0;
        EVENT_EA_ALL(t) = EVENT_EA;
        EVENT_STRENGTH_EA = 0;

        EVENT_TOTAL_EA_ALL(t) = EVENT_TOTAL_EA;
    end



    if (RESOURCES_EB > 10) && ((t - WAITING_TRACKER_EB) > WAITING_TIME_EB)
        EVENT_EB = rand < P_EB_ALL(t);

        if EVENT_EB
            EVENT_EB_ALL(t) = 1;

            EVENT_TOTAL_EB = EVENT_TOTAL_EB + 1;
            EVENT_TOTAL_EB_ALL(t) = EVENT_TOTAL_EB;

            EVENT_STRENGTH_EB = rand;
            REACTION_STRENGTH_EB = 2*rand - 1;
            WAITING_TIME_EB = WAITING_CONSTANT_EB*EVENT_STRENGTH_EB;
            WAITING_TRACKER_EB = t;

            RESOURCES_EB = RESOURCES_EB - EVENT_STRENGTH_EB*10;
        else                    

            EVENT_TOTAL_EB_ALL(t) = EVENT_TOTAL_EB;


            EVENT_STRENGTH_EB = 0;
            EVENT_EB_ALL(t) = 0;
            
        end

    else

        EVENT_EB = 0;
        EVENT_EB_ALL(t) = EVENT_EB;
        EVENT_STRENGTH_EB = 0;

        EVENT_TOTAL_EB_ALL(t) = EVENT_TOTAL_EB;
    end
    
    
    %%%%%%%%%%%%%this is the negotiaton event settled by leaders
        
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Before Negotiation Event Days%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if t>1
    if CONFLICT_LEVEL(t-1)<Peace_Level_Threshold                                                
         if Neg_Event_On==0                          
            if Prob_Init_Neg_Event<rand      
               Neg_Event_On=1;                                              %switch on means A have launched a Negotiation Event, it will be switched off after the event day.
               Neg_Event_Strength=rand*50;                                       %used in calculating the Perceived Threats 
               %%% Neg_Reaction_Strength_A=2*rand-1;    %this may not be used in calculating the Success Level
               Num_Neg_Events=Num_Neg_Events+1;
               Days_Ahead=round(rand*2000)+1000;
               if T-Days_Ahead>t
                    Neg_Date=t+Days_Ahead;                                              %after Days_Ahead days, there will be a Negotiation Event
               end
               
               for Number_PT=t:Neg_Date                                             %we calculate and store the Neg Perceived Threat 
                  Neg_PT(Number_PT)=Neg_Event_Strength*exp(Number_PT-Neg_Date);
               end
            end   
         end
    end
    end
    %%%%%%%%%%%Once the date fixed, during the Negotiation Upcomming Date
    if Neg_Event_On==1
        Neg_Threat_Count=Neg_Threat_Count+PUBLIC_A_ALL(t)+PUBLIC_B_ALL(t);    
    else
        Neg_Threat_Count=0;
    end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    
    
    
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%% NEW!!!
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    RESOURCES_A = RESOURCES_A + exp(.01*(max(WAITING_TRACKER_B,WAITING_TRACKER_EB) - t));
    RESOURCES_B = RESOURCES_B + exp(.01*(max(WAITING_TRACKER_A,WAITING_TRACKER_EA) - t));
    RESOURCES_EA = RESOURCES_EA + exp(.01*(max(WAITING_TRACKER_B,WAITING_TRACKER_EB) - t));
    RESOURCES_EB = RESOURCES_EB + exp(.01*(max(WAITING_TRACKER_A,WAITING_TRACKER_EA) - t));
    
    RESOURCES_A_ALL(t) = RESOURCES_A;
    RESOURCES_B_ALL(t) = RESOURCES_B;
    RESOURCES_EA_ALL(t) = RESOURCES_EA;
    RESOURCES_EB_ALL(t) = RESOURCES_EB;

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    


    %%% PERCEIVED THREAT CALCULATION:
    %%% This is rather complicated. Basically, start with two T x 1 matrices, and one 1 x 1 vector.  
    %%% filled with zeros. One matrix represents time, the other represents perceived threat. 
    %%% Once an attack happens, its strength is registered on the 1 x 1 vector, the remaining components of the time matrix
    %%% are relabled as  0,1,2,..., a new column of zeros is added to
    %%% the time matrix and the perceived threat matrix, and a new component is added to the strength vector. 
    %%% Every component of the threat matrix is an input. This second column
    %%% represents the second event (if it happens). The Threat Matrix registers a value of threat for each component (t,n), using the value of (t,n) i
    %%% in the time matrix for time and the nth compnonent of the strength vector for event strength. Perceived threat
    %%% itself is actually calculated by summing each row component of the
    %%% threat matrix, giving the combined effect of every event at time t.



    %%%This segment calculates perceived threat caused by A

    if (EVENT_A_ALL(t) == 1)  %%% if M.L.A. or F.L.A. makes an attack

        VECTOR_PT_A_ALL(N_PT_A) = EVENT_STRENGTH_A ; %%% This registers the event strength acting on this particular attack;
        TRACKER_PT_A_ALL(t:T, N_PT_A) = 1:T-t+1; %%% relabeling the last T-t time increments  of the current event column as 1:t

        for n = 1:N_PT_A
            PERCEIVED_THREAT_A_ALL(t,n) = .1*TRACKER_PT_A_ALL(t,n)*exp(-ab*TRACKER_PT_A_ALL(t,n)*(2 - VECTOR_PT_A_ALL(n)));
        end

        X_PT_A = PERCEIVED_THREAT_A_ALL(t,:); %%%This pulls out the t-th row of our threat matrix, in other words, each component of this vector is the the respective value of threat for the nth hit.
        P_T_A_ALL(t) = sum(X_PT_A); %%% This sums the entries in the t-th row, calculating total threat due to all current attacks at time t

        N_PT_A = N_PT_A + 1; %%%This increases the number of columns by 1      
        TRACKER_PT_A_ALL(:,N_PT_A) = zeros(T,1); %%%These commands add a column of zeros to the time and threat matrices
        PERCEIVED_THREAT_A_ALL(:,N_PT_A) = zeros(T,1);

    else %%%if neither M.L.B. or F.L.B. make an attack at time t

        for n = 1:N_PT_A
            if t == 1
                PERCEIVED_THREAT_A_ALL(t) = 0;
            else

                if PERCEIVED_THREAT_A_ALL(t-1,n) == 0 %%%if the 'n'th attack has yet to happen, then continue marking threat due to attack as zero
                    PERCEIVED_THREAT_A_ALL(t,n) = 0;
                else %%% Otherwise, calculate according to standard equation
                    PERCEIVED_THREAT_A_ALL(t,n) = .1*TRACKER_PT_A_ALL(t,n)*exp(-ab*TRACKER_PT_A_ALL(t,n)*(2 - VECTOR_PT_A_ALL(n))) ; 
                end
            end
        end

        X_PT_A = PERCEIVED_THREAT_A_ALL(t,:);
        P_T_A_ALL(t) = sum(X_PT_A);

    end



    %%% This segment calculates perceived threat for B

    if (EVENT_B_ALL(t) == 1)%%% if M.L.A. or F.L.A. makes an attack

        VECTOR_PT_B_ALL(N_PT_B) = EVENT_STRENGTH_B; %%% This registers the event strength acting on this particular attack;
        TRACKER_PT_B_ALL(t:T, N_PT_B) = 1:T-t+1; %%% relabeling the last T-t time increments  of the current event column as 1:t

        for n = 1:N_PT_B
            PERCEIVED_THREAT_B_ALL(t,n) = .1*TRACKER_PT_B_ALL(t,n)*exp(-ab*TRACKER_PT_B_ALL(t,n)*(2 - VECTOR_PT_B_ALL(n)));
        end

        X_PT_B = PERCEIVED_THREAT_B_ALL(t,:); %%%This pulls out the t-th row of our threat matrix, in other words, each component of this vector is the the respective value of threat for the nth hit.
        P_T_B_ALL(t) = sum(X_PT_B); %%% This sums the entries in the t-th row, calculating total threat due to all current attacks at time t

        N_PT_B = N_PT_B + 1; %%%This increases the number of columns by 1      
        TRACKER_PT_B_ALL(:,N_PT_B) = zeros(T,1); %%%These commands add a column of zeros to the time and threat matrices
        PERCEIVED_THREAT_B_ALL(:,N_PT_B) = zeros(T,1);

    else %%%if neither M.L.B. or F.L.B. make an attack at time t

        for n = 1:N_PT_B
            if t == 1
                PERCEIVED_THREAT_B_ALL(t) = 0;
            else

                if PERCEIVED_THREAT_B_ALL(t-1,n) == 0 %%%if the 'n'th attack has yet to happen, then continue marking threat due to attack as zero
                    PERCEIVED_THREAT_B_ALL(t,n) = 0;
                else %%% Otherwise, calculate according to standard equation
                    PERCEIVED_THREAT_B_ALL(t,n) = .1*TRACKER_PT_B_ALL(t,n)*exp(-ab*TRACKER_PT_B_ALL(t,n)*(2 - VECTOR_PT_B_ALL(n))) ; 
                end
            end
        end

        X_PT_B = PERCEIVED_THREAT_B_ALL(t,:);
        P_T_B_ALL(t) = sum(X_PT_B);

    end
    
    %%% Fringe A
    if (EVENT_EA_ALL(t) == 1)  

        VECTOR_PT_EA_ALL(N_PT_EA) = EVENT_STRENGTH_EA ; %%% This registers the event strength acting on this particular attack;
        TRACKER_PT_EA_ALL(t:T, N_PT_EA) = 1:T-t+1; %%% relabeling the last T-t time increments  of the current event column as 1:t

        for n = 1:N_PT_EA
            PERCEIVED_THREAT_EA_ALL(t,n) = .1*TRACKER_PT_EA_ALL(t,n)*exp(-ab*TRACKER_PT_EA_ALL(t,n)*(2 - VECTOR_PT_EA_ALL(n)));
        end

        X_PT_EA = PERCEIVED_THREAT_EA_ALL(t,:); %%%This pulls out the t-th row of our threat matrix, in other words, each component of this vector is the the respective value of threat for the nth hit.
        P_T_EA_ALL(t) = sum(X_PT_EA); %%% This sums the entries in the t-th row, calculating total threat due to all current attacks at time t

        N_PT_EA = N_PT_EA + 1; %%%This increases the number of columns by 1      
        TRACKER_PT_EA_ALL(:,N_PT_EA) = zeros(T,1); %%%These commands add a column of zeros to the time and threat matrices
        PERCEIVED_THREAT_EA_ALL(:,N_PT_EA) = zeros(T,1);

    else %%%if neither M.L.B. or F.L.B. make an attack at time t

        for n = 1:N_PT_EA
            if t == 1
                PERCEIVED_THREAT_EA_ALL(t) = 0;
            else

                if PERCEIVED_THREAT_EA_ALL(t-1,n) == 0 %%%if the 'n'th attack has yet to happen, then continue marking threat due to attack as zero
                    PERCEIVED_THREAT_EA_ALL(t,n) = 0;
                else %%% Otherwise, calculate according to standard equation
                    PERCEIVED_THREAT_EA_ALL(t,n) = .1*TRACKER_PT_EA_ALL(t,n)*exp(-ab*TRACKER_PT_EA_ALL(t,n)*(2 - VECTOR_PT_EA_ALL(n))) ; 
                end
            end
        end

        X_PT_EA = PERCEIVED_THREAT_EA_ALL(t,:);
        P_T_EA_ALL(t) = sum(X_PT_EA);

    end
    
    
    if (EVENT_EB_ALL(t) == 1)  %%% if M.L.A. or F.L.A. makes an attack

        VECTOR_PT_EB_ALL(N_PT_EB) = EVENT_STRENGTH_EB ; %%% This registers the event strength acting on this particular attack;
        TRACKER_PT_EB_ALL(t:T, N_PT_EB) = 1:T-t+1; %%% relabeling the last T-t time increments  of the current event column as 1:t

        for n = 1:N_PT_EB
            PERCEIVED_THREAT_EB_ALL(t,n) = .1*TRACKER_PT_EB_ALL(t,n)*exp(-ab*TRACKER_PT_EB_ALL(t,n)*(2 - VECTOR_PT_EB_ALL(n)));
        end

        X_PT_EB = PERCEIVED_THREAT_EB_ALL(t,:); %%%This pulls out the t-th row of our threat matrix, in other words, each component of this vector is the the respective value of threat for the nth hit.
        P_T_EB_ALL(t) = sum(X_PT_EB); %%% This sums the entries in the t-th row, calculating total threat due to all current attacks at time t

        N_PT_EB = N_PT_EB + 1; %%%This increases the number of columns by 1      
        TRACKER_PT_EB_ALL(:,N_PT_EB) = zeros(T,1); %%%These commands add a column of zeros to the time and threat matrices
        PERCEIVED_THREAT_EB_ALL(:,N_PT_EB) = zeros(T,1);

    else %%%if neither M.L.B. or F.L.B. make an attack at time t

        for n = 1:N_PT_EB
            if t == 1
                PERCEIVED_THREAT_EB_ALL(t) = 0;
            else

                if PERCEIVED_THREAT_EB_ALL(t-1,n) == 0 %%%if the 'n'th attack has yet to happen, then continue marking threat due to attack as zero
                    PERCEIVED_THREAT_EB_ALL(t,n) = 0;
                else %%% Otherwise, calculate according to standard equation
                    PERCEIVED_THREAT_EB_ALL(t,n) = .1*TRACKER_PT_EB_ALL(t,n)*exp(-ab*TRACKER_PT_EB_ALL(t,n)*(2 - VECTOR_PT_EB_ALL(n))) ; 
                end
            end
        end

        X_PT_EB = PERCEIVED_THREAT_EB_ALL(t,:);
        P_T_EB_ALL(t) = sum(X_PT_EB);

    end
    
    PT_A(t) = P_T_B_ALL(t) + P_T_EB_ALL(t);
    PT_B(t) = P_T_A_ALL(t) + P_T_EA_ALL(t);
    


    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


    %%% Public Support for Conflict

    PUBLIC_A_ALL(t) = PUBLIC_CONSTANT_A*PT_A(t);
    AverageA_All=AverageA_All+PUBLIC_A_ALL(t);

    PUBLIC_B_ALL(t) = PUBLIC_CONSTANT_B*PT_B(t);
    AverageB_All=AverageB_All+PUBLIC_B_ALL(t);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %%%%  Public Support for Negotiation
    Neg_Public_Support(t)=PUBLIC_CONSTANT_A*Neg_PT(t);
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    

    %%%VESTED INTEREST
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%% Here's a rundown of the vested interest calculation. First, the
    %%% program checks (procedurally) who has created an event and modifies
    %%% each players' vested interest according to the theory.
    %%% Finally, the program checks to see if ANYBODY has created an event.
    %%% If so, the count variable is modified (i.e. set to zero). If not,
    %%% then the count variable increases by one and Vested Interest is calculated according 
    %%% to the theory.


    if t == 1

        TIME_A_ALL(t) = log(2/(INITIAL_PROPENSITY_A + 1.01) - 1)/(-.001);
        TIME_EA_ALL(t) = log(2/(INITIAL_PROPENSITY_EA + 1.01) - 1)/(-.001);
        TIME_B_ALL(t) = log(2/(INITIAL_PROPENSITY_B + 1.01) - 1)/(-.001);
        TIME_EB_ALL(t) = log(2/(INITIAL_PROPENSITY_EB + 1.01) - 1)/(-.001);

        DA = INITIAL_PROPENSITY_A; %%%Initial vested interest is a multiple of this variable
        DEA = INITIAL_PROPENSITY_EA;
        DB = INITIAL_PROPENSITY_B;
        DEB = INITIAL_PROPENSITY_EB;

        DA_ALL(t) = DA;   %%%Commitment to Conflict
        DEA_ALL(t) = DEA;
        DB_ALL(t) = DB;
        DEB_ALL(t) = DEB;

        VESTED_INTEREST_A_ALL(t) = INITIAL_PROPENSITY_A;
        VESTED_INTEREST_EA_ALL(t) = INITIAL_PROPENSITY_EA;
        VESTED_INTEREST_B_ALL(t) = INITIAL_PROPENSITY_B;
        VESTED_INTEREST_EB_ALL(t) = INITIAL_PROPENSITY_EB;

    else
        if VESTED_INTEREST_A_ALL(t)>=0
            Multi_A=1;
        else    
            Multi_A=-1;
        end
        if VESTED_INTEREST_EA_ALL(t)>=0
            Multi_EA=1;
        else    
            Multi_EA=-1;
        end
        if VESTED_INTEREST_B_ALL(t)>=0
            Multi_B=1;
        else    
            Multi_B=-1;
        end
        if VESTED_INTEREST_EB_ALL(t)>=0
            Multi_EB=1;
        else    
            Multi_EB=-1;
        end

        %%%Designed to designate Sigmoid Input for time t

        TIME_A_ALL(t) = TIME_A_ALL(t-1) + .5*(PUBLIC_A_ALL(t) - PUBLIC_A_ALL(t-1))+Multi_A*(Neg_Public_Support(t)-Neg_Public_Support(t-1)) + EVENT_A_ALL(t) + DA_ALL(t-1) - 1/FORGET_A;            
        TIME_EA_ALL(t) = TIME_EA_ALL(t-1) + .5*(PUBLIC_A_ALL(t) - PUBLIC_A_ALL(t-1))+Multi_EA*(Neg_Public_Support(t)-Neg_Public_Support(t-1)) + EVENT_EA_ALL(t) + DEA_ALL(t-1) - 1/FORGET_EA;
        TIME_B_ALL(t) = TIME_B_ALL(t-1) + .5*(PUBLIC_B_ALL(t) - PUBLIC_B_ALL(t-1))+Multi_B*(Neg_Public_Support(t)-Neg_Public_Support(t-1)) + EVENT_B_ALL(t) + DB_ALL(t-1) - 1/FORGET_B;        
        TIME_EB_ALL(t) = TIME_EB_ALL(t-1) + .5*(PUBLIC_B_ALL(t) - PUBLIC_B_ALL(t-1)) +Multi_EB*(Neg_Public_Support(t)-Neg_Public_Support(t-1))+ EVENT_EB_ALL(t) + DEB_ALL(t-1) - 1/FORGET_EB;   

        DA = 2/(1 + exp(-.001*TIME_A_ALL(t))) - 1;
        DEA = 2/(1 + exp(-.001*TIME_EA_ALL(t))) - 1;
        DB = 2/(1 + exp(-.001*TIME_B_ALL(t))) - 1;
        DEB = 2/(1 + exp(-.001*TIME_EB_ALL(t))) - 1;

        DA_ALL(t) = DA;
        DEA_ALL(t) = DEA;
        DB_ALL(t) = DB;
        DEB_ALL(t) = DEB;
        
        
        VESTED_INTEREST_A_ALL(t) = DA_ALL(t);
        VESTED_INTEREST_EA_ALL(t) = DEA_ALL(t);
        VESTED_INTEREST_B_ALL(t) = DB_ALL(t);
        VESTED_INTEREST_EB_ALL(t) = DEB_ALL(t);

    end
    
%%%%%%%%%On the Negotiation Day, the Vested Interest Value's drastic dips %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
    if Neg_Date==t
        Neg_Success_Prob=1/(1+Neg_Threat_Count);
        Neg_Event_On=0;                                                    %switch off the Negotiation Event
        VESTED_INTEREST_A_ALL(t)=VESTED_INTEREST_A_ALL(t)-negW*Neg_Success_Prob;                      %Vested Interest Value will decrease by how much this Negotiation Event success.
        VESTED_INTEREST_EA_ALL(t)=VESTED_INTEREST_EA_ALL(t)-negW*Neg_Success_Prob;
        VESTED_INTEREST_B_ALL(t)=VESTED_INTEREST_B_ALL(t)-negW*Neg_Success_Prob;
        VESTED_INTEREST_EB_ALL(t)=VESTED_INTEREST_EB_ALL(t)-negW*Neg_Success_Prob;
        
        if VESTED_INTEREST_A_ALL(t)>1
            VESTED_INTEREST_A_ALL(t)=1;
        elseif VESTED_INTEREST_A_ALL(t)<-1
            VESTED_INTEREST_A_ALL(t)=-1;
        end
        
        if VESTED_INTEREST_EA_ALL(t)>1
            VESTED_INTEREST_EA_ALL(t)=1;
        elseif VESTED_INTEREST_EA_ALL(t)<-1
            VESTED_INTEREST_EA_ALL(t)=-1;
        end
        
        if VESTED_INTEREST_B_ALL(t)>1
            VESTED_INTEREST_B_ALL(t)=1;
        elseif VESTED_INTEREST_B_ALL(t)<-1
            VESTED_INTEREST_B_ALL(t)=-1;
        end
        
        if VESTED_INTEREST_EB_ALL(t)>1
            VESTED_INTEREST_EB_ALL(t)=1;
        elseif VESTED_INTEREST_EB_ALL(t)<-1
            VESTED_INTEREST_EB_ALL(t)=-1;
        end


        
        TIME_A_ALL(t) = log(2/(VESTED_INTEREST_A_ALL(t) + 1.01) - 1)/(-.001);
        TIME_EA_ALL(t) = log(2/(VESTED_INTEREST_EA_ALL(t) + 1.01) - 1)/(-.001);
        TIME_B_ALL(t) = log(2/(VESTED_INTEREST_B_ALL(t) + 1.01) - 1)/(-.001);
        TIME_EB_ALL(t) = log(2/(VESTED_INTEREST_EB_ALL(t) + 1.01) - 1)/(-.001);
        
        DA_ALL(t) = VESTED_INTEREST_A_ALL(t);   %%%Commitment to Conflict
        DEA_ALL(t) = VESTED_INTEREST_EA_ALL(t);
        DB_ALL(t) = VESTED_INTEREST_B_ALL(t);
        DEB_ALL(t) = VESTED_INTEREST_EB_ALL(t);
    end
    

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


    %%% PERCEIVED SUCCESS
    %%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%

    %%% The process for this calculation is basically identical to the perceived threat
    %%% calculation, with event strength replaced by success level and the threat matrix replaced
    %%% with an analogous success matrix (using the success equation).
    %%% However, in this case we feed a linear combination of this value
    %%% and current resource levels into a sigmoid function desgined to
    %%% cover (0,1). This value scaled down and added to the value of
    %%% success at t-1 ultimately represents perceived Success.
    %%% The initial level of success for each actor is a parameter. 

    if t == 1

       PERCEIVED_A_ALL(t) = INITIAL_SUCCESS_HISTORY_A;
       PERCEIVED_EA_ALL(t) = INITIAL_SUCCESS_HISTORY_EA;
       PERCEIVED_B_ALL(t) = INITIAL_SUCCESS_HISTORY_B;       
       PERCEIVED_EB_ALL(t) = INITIAL_SUCCESS_HISTORY_EB;

       PERCEIVED_WEIGHT_A_ALL(t) = -log(2/(PERCEIVED_A_ALL(t) + 1.01) - 1)/.05;
       PERCEIVED_WEIGHT_EA_ALL(t) = -log(2/(PERCEIVED_EA_ALL(t) + 1.01) - 1)/.05;
       PERCEIVED_WEIGHT_B_ALL(t) = -log(2/(PERCEIVED_B_ALL(t) + 1.01) - 1)/.05;
       PERCEIVED_WEIGHT_EB_ALL(t) = -log(2/(PERCEIVED_EB_ALL(t) + 1.01) - 1)/.05;

    else

        if EVENT_A_ALL(t) == 1 %%%If A creates an event

            VECTOR_A_ALL(N_A) = REACTION_STRENGTH_A;  %%%Reaction strength is a random number in [-1,1]; Stronger reaction is represented by smaller number            
            TRACKER_A_ALL(t+1:T, N_A) = 1:T-t; %%% Components t+1 through T of column N_A are relabled from 1 to T-t

            for n = 1:N_A
                SUCCESS_A_ALL(t,n) = VECTOR_A_ALL(n)*exp(-.0005*TRACKER_A_ALL(t,n));
            end

            X_A = SUCCESS_A_ALL(t,:); 
            P_S_A_ALL(t) = sum(X_A);

            N_A = N_A +1;       
            TRACKER_A_ALL(:, N_A) = zeros(T,1);
            SUCCESS_A_ALL(:, N_A) = zeros(T,1);


            PERCEIVED_WEIGHT_A_ALL(t) = PERCEIVED_WEIGHT_A_ALL(t-1) + .005*(RESOURCES_A_ALL(t) - RESOURCES_A_ALL(t-1)) + 10*(P_S_A_ALL(t) - P_S_A_ALL(t-1));
            PERCEIVED_A_ALL(t) = 2/(1 + exp(-.05*(PERCEIVED_WEIGHT_A_ALL(t)))) - 1;

        else


            for n = 1:N_A
                if t == 1
                    SUCCESS_A_ALL(t) = 0;
                else

                    if SUCCESS_A_ALL(t-1,n) == 0
                        SUCCESS_A_ALL(t,n) = 0;
                    else                
                        SUCCESS_A_ALL(t,n) = VECTOR_A_ALL(n)*exp(-.0005*TRACKER_A_ALL(t,n));
                    end
                end
            end

            X_A = SUCCESS_A_ALL(t,:);
            P_S_A_ALL(t) = sum(X_A);


            PERCEIVED_WEIGHT_A_ALL(t) = PERCEIVED_WEIGHT_A_ALL(t-1) + .005*(RESOURCES_A_ALL(t) - RESOURCES_A_ALL(t-1)) + 10*(P_S_A_ALL(t) - P_S_A_ALL(t-1));
            PERCEIVED_A_ALL(t) = 2/(1 + exp(-.05*(PERCEIVED_WEIGHT_A_ALL(t)))) - 1;
        end



        if EVENT_B_ALL(t) == 1 

            VECTOR_B_ALL(N_B) = REACTION_STRENGTH_B;            
            TRACKER_B_ALL(t+1:T, N_B) = [1:T-t];

            for n = 1:N_B
                SUCCESS_B_ALL(t,n) = VECTOR_B_ALL(n)*exp(-.0005*TRACKER_B_ALL(t,n));
            end

            X_B = SUCCESS_B_ALL(t,:); 
            P_S_B_ALL(t) = sum(X_B);

            N_B = N_B +1;       
            TRACKER_B_ALL(:, N_B) = zeros(T,1);
            SUCCESS_B_ALL(:, N_B) = zeros(T,1);

            PERCEIVED_WEIGHT_B_ALL(t) = PERCEIVED_WEIGHT_B_ALL(t-1) + .005*(RESOURCES_B_ALL(t) - RESOURCES_B_ALL(t-1)) + 10*(P_S_B_ALL(t) - P_S_B_ALL(t-1));
            PERCEIVED_B_ALL(t) = 2/(1 + exp(-.05*(PERCEIVED_WEIGHT_B_ALL(t)))) - 1;

        else


            for n = 1:N_B
                if t == 1
                    SUCCESS_B_ALL(t) = 0;
                else

                    if SUCCESS_B_ALL(t-1,n) == 0
                        SUCCESS_B_ALL(t,n) = 0;
                    else                
                        SUCCESS_B_ALL(t,n) = VECTOR_B_ALL(n)*exp(-.0005*TRACKER_B_ALL(t,n));
                    end
                end
            end

            X_B = SUCCESS_B_ALL(t,:);
            P_S_B_ALL(t) = sum(X_B);


            PERCEIVED_WEIGHT_B_ALL(t) = PERCEIVED_WEIGHT_B_ALL(t-1) + .005*(RESOURCES_B_ALL(t) - RESOURCES_B_ALL(t-1)) + 10*(P_S_B_ALL(t) - P_S_B_ALL(t-1));
            PERCEIVED_B_ALL(t) = 2/(1 + exp(-.05*(PERCEIVED_WEIGHT_B_ALL(t)))) - 1;
        end




        if EVENT_EA_ALL(t) == 1 %%%If EA creates an event

            VECTOR_EA_ALL(N_EA) = REACTION_STRENGTH_EA;            
            TRACKER_EA_ALL(t+1:T, N_EA) = 1:T-t;

            for n = 1:N_EA
                SUCCESS_EA_ALL(t,n) = VECTOR_EA_ALL(n)*exp(-.0005*TRACKER_EA_ALL(t,n));
            end

            X_EA = SUCCESS_EA_ALL(t,:); 
            P_S_EA_ALL(t) = sum(X_EA);

            N_EA = N_EA +1;       
            TRACKER_EA_ALL(:, N_EA) = zeros(T,1);
            SUCCESS_EA_ALL(:, N_EA) = zeros(T,1);

            PERCEIVED_WEIGHT_EA_ALL(t) = PERCEIVED_WEIGHT_EA_ALL(t-1) + .005*(RESOURCES_EA_ALL(t) - RESOURCES_EA_ALL(t-1)) + 10*(P_S_EA_ALL(t) - P_S_EA_ALL(t-1));
            PERCEIVED_EA_ALL(t) = 2/(1 + exp(-.05*(PERCEIVED_WEIGHT_EA_ALL(t)))) - 1;
        else


            for n = 1:N_EA
                if t == 1
                    SUCCESS_EA_ALL(t) = 0;
                else

                    if SUCCESS_EA_ALL(t-1,n) == 0
                        SUCCESS_EA_ALL(t,n) = 0;
                    else                
                        SUCCESS_EA_ALL(t,n) = VECTOR_EA_ALL(n)*exp(-.0005*TRACKER_EA_ALL(t,n));
                    end
                end
            end

            X_EA = SUCCESS_EA_ALL(t,:);
            P_S_EA_ALL(t) = sum(X_EA);


            PERCEIVED_WEIGHT_EA_ALL(t) = PERCEIVED_WEIGHT_EA_ALL(t-1) + .005*(RESOURCES_EA_ALL(t) - RESOURCES_EA_ALL(t-1)) + 10*(P_S_EA_ALL(t) - P_S_EA_ALL(t-1));
            PERCEIVED_EA_ALL(t) = 2/(1 + exp(-.05*(PERCEIVED_WEIGHT_EA_ALL(t)))) - 1;
        end




        if EVENT_EB_ALL(t) == 1 %%%If A creates an event

            VECTOR_EB_ALL(N_EB) = REACTION_STRENGTH_EB;            
            TRACKER_EB_ALL(t+1:T, N_EB) = [1:T-t];

            for n = 1:N_EB
                SUCCESS_EB_ALL(t,n) = VECTOR_EB_ALL(n)*exp(-.0005*TRACKER_EB_ALL(t,n));
            end

            X_EB = SUCCESS_EB_ALL(t,:); 
            P_S_EB_ALL(t) = sum(X_EB);

            N_EB = N_EB +1;       
            TRACKER_EB_ALL(:, N_EB) = zeros(T,1);
            SUCCESS_EB_ALL(:, N_EB) = zeros(T,1);


            PERCEIVED_WEIGHT_EB_ALL(t) = PERCEIVED_WEIGHT_EB_ALL(t-1) + .005*(RESOURCES_EB_ALL(t) - RESOURCES_EB_ALL(t-1)) + 10*(P_S_EB_ALL(t) - P_S_EB_ALL(t-1));
            PERCEIVED_EB_ALL(t) = 2/(1 + exp(-.05*(PERCEIVED_WEIGHT_EB_ALL(t)))) - 1;

        else


            for n = 1:N_EB
                if t == 1
                    SUCCESS_EB_ALL(t) = 0;
                else

                    if SUCCESS_EB_ALL(t-1,n) == 0
                        SUCCESS_EB_ALL(t,n) = 0;
                    else                
                        SUCCESS_EB_ALL(t,n) = VECTOR_EB_ALL(n)*exp(-.0005*TRACKER_EB_ALL(t,n));
                    end
                end
            end

            X_EB = SUCCESS_EB_ALL(t,:);
            P_S_EB_ALL(t) = sum(X_EB);



            PERCEIVED_WEIGHT_EB_ALL(t) = PERCEIVED_WEIGHT_EB_ALL(t-1) + .005*(RESOURCES_EB_ALL(t) - RESOURCES_EB_ALL(t-1)) + 10*(P_S_EB_ALL(t) - P_S_EB_ALL(t-1));
            PERCEIVED_EB_ALL(t) = 2/(1 + exp(-.05*(PERCEIVED_WEIGHT_EB_ALL(t)))) - 1;
        end
    end




    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



    %%%This loop should decide what dimensions will correspond to the next
    %%%time interval

    %%%Perceived Threat Dimensions
    if PT_A(t) < PT_CUTOFF_LM
        THREAT_A_ALL(t) = 1;
        THREAT_EA_ALL(t) = 1;
    else
        if PT_A(t) < PT_CUTOFF_MH %%%These numbers represent the cutoff points for dimensions. 
            THREAT_A_ALL(t) = 2; %%%For instance, here Perceived threat is considered high if the level is greater than or equal to 3
            THREAT_EA_ALL(t) = 2;
        else
            THREAT_A_ALL(t) = 3;
            THREAT_EA_ALL(t) = 3;
        end
    end


    if PT_B(t) < PT_CUTOFF_LM
        THREAT_B_ALL(t) = 1;
        THREAT_EB_ALL(t) = 1;
    else
        if PT_B(t) < PT_CUTOFF_MH %%%These numbers represent the cutoff points for dimensions. 
            THREAT_B_ALL(t) = 2; %%%For instance, here Perceived threat is considered high if the level is greater than or equal to 3
            THREAT_EB_ALL(t) = 2;
        else
            THREAT_B_ALL(t) = 3;
            THREAT_EB_ALL(t) = 3;
        end
    end



    %%%Vested Interest Dimensions
    if VESTED_INTEREST_A_ALL(t) < VI_CUTOFF_LM
        VI_A_ALL(t) = 1;
    else
        if VESTED_INTEREST_A_ALL(t) < VI_CUTOFF_MH
            VI_A_ALL(t) = 2;
        else
            VI_A_ALL(t) = 3;
        end
    end


    if VESTED_INTEREST_EA_ALL(t) < VI_CUTOFF_LM
        VI_EA_ALL(t) = 1;
    else
        if VESTED_INTEREST_EA_ALL(t) < VI_CUTOFF_MH
            VI_EA_ALL(t) = 2;
        else
            VI_EA_ALL(t) = 3;
        end
    end


     if VESTED_INTEREST_B_ALL(t) < VI_CUTOFF_LM
        VI_B_ALL(t) = 1;
    else
        if VESTED_INTEREST_B_ALL(t) < VI_CUTOFF_MH
            VI_B_ALL(t) = 2;
        else
            VI_B_ALL(t) = 3;
        end
    end


    if VESTED_INTEREST_EB_ALL(t) < VI_CUTOFF_LM
        VI_EB_ALL(t) = 1;
    else
        if VESTED_INTEREST_EB_ALL(t) < VI_CUTOFF_MH
            VI_EB_ALL(t) = 2;
        else
            VI_EB_ALL(t) = 3;
        end
    end



    %%%Perceived Success Dimensions. Everything here is basically
    %%%arbitrary.
    if PERCEIVED_A_ALL(t) < PS_CUTOFF_LM
        PERCEIVED_SUCCESS_A_ALL(t) = 1;
    else
        if PERCEIVED_A_ALL(t) < PS_CUTOFF_MH
            PERCEIVED_SUCCESS_A_ALL(t) = 2;
        else
            PERCEIVED_SUCCESS_A_ALL(t) = 3;
        end
    end


    if PERCEIVED_EA_ALL(t) < PS_CUTOFF_LM
        PERCEIVED_SUCCESS_EA_ALL(t) = 1;
    else
        if PERCEIVED_EA_ALL(t) < PS_CUTOFF_MH
            PERCEIVED_SUCCESS_EA_ALL(t) = 2;
        else
            PERCEIVED_SUCCESS_EA_ALL(t) = 3;
        end
    end


    if PERCEIVED_B_ALL(t) < PS_CUTOFF_LM
        PERCEIVED_SUCCESS_B_ALL(t) = 1;
    else
        if PERCEIVED_B_ALL(t) < PS_CUTOFF_MH
            PERCEIVED_SUCCESS_B_ALL(t) = 2;
        else
            PERCEIVED_SUCCESS_B_ALL(t) = 3;
        end
    end


    if PERCEIVED_EB_ALL(t) < PS_CUTOFF_LM
        PERCEIVED_SUCCESS_EB_ALL(t) = 1;
    else
        if PERCEIVED_EB_ALL(t) < PS_CUTOFF_MH
            PERCEIVED_SUCCESS_EB_ALL(t) = 2;
        else
            PERCEIVED_SUCCESS_EB_ALL(t) = 3;
        end
    end

    if t <= 365
        INTENSITY_A_ALL(t) = EVENT_TOTAL_A_ALL(t)/365;
        INTENSITY_EA_ALL(t) = EVENT_TOTAL_EA_ALL(t)/365;
        INTENSITY_B_ALL(t) = EVENT_TOTAL_B_ALL(t)/365;
        INTENSITY_EB_ALL(t) = EVENT_TOTAL_EB_ALL(t)/365;

    else
        INTENSITY_A = EVENT_A_ALL(t-365:t);
        INTENSITY_A_ALL(t) = sum(INTENSITY_A)/365;

        INTENSITY_EA = EVENT_EA_ALL(t-365:t);
        INTENSITY_EA_ALL(t) = sum(INTENSITY_EA)/365;

        INTENSITY_B = EVENT_B_ALL(t-365:t);
        INTENSITY_B_ALL(t) = sum(INTENSITY_B)/365;

        INTENSITY_EB = EVENT_EB_ALL(t-365:t);
        INTENSITY_EB_ALL(t) = sum(INTENSITY_EB)/365;
    end

    CONFLICT_LEVEL(t) = INTENSITY_A_ALL(t) + INTENSITY_EA_ALL(t) + INTENSITY_B_ALL(t) + INTENSITY_EB_ALL(t);


    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
        
end

TOTAL_CONFLICT_AVERAGE = (EVENT_TOTAL_A + EVENT_TOTAL_EA + EVENT_TOTAL_B + EVENT_TOTAL_EB)/T;
MAXIMUM_CONFLICT_LEVEL = max(CONFLICT_LEVEL);