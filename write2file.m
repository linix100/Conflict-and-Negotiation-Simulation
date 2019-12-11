%%% write to file
function[] = write2file(w,p,results_filename,plot_filename,T,AverageA_All, AverageB_All,INITIAL_PROPENSITY_A,INITIAL_PROPENSITY_B,INITIAL_PROPENSITY_EA,INITIAL_PROPENSITY_EB,    PUBLIC_CONSTANT_A,negW,Num_Neg_Events,    EVENT_TOTAL_A,EVENT_TOTAL_B,EVENT_TOTAL_EA,EVENT_TOTAL_EB,    TOTAL_CONFLICT_AVERAGE,MAXIMUM_CONFLICT_LEVEL,   Average_PerceivedThreat_A,Average_PerceivedThreat_B,  VESTED_INTEREST_A_ALL,VESTED_INTEREST_B_ALL,VESTED_INTEREST_EA_ALL,VESTED_INTEREST_EB_ALL)

  
if w == 1
    writeResults
end

if p == 1
    plotResults
end


function writeResults
%%% DateTime,  ctc Mla,ctc mlb,ctc fa,ctc fb,   amp,negW,num Neg,    number of conflict MLA, N o c MLB, N o c FA, N o c FB,       AverageConflict,MaxConflict,    ,Average Perceived Threat A,Average Perceived Threat B,      Final ctcMLA,Final ctcMLB,Final ctcFA,Final ctcFB%%
currentTime=now;
disp('ctc')
disp(INITIAL_PROPENSITY_A)
DateandTime=datestr(currentTime);
Average_PerceivedThreat_A=AverageA_All/T;
Average_PerceivedThreat_B=AverageB_All/T;
fid = fopen(results_filename,'a');
disp('io')
fprintf(fid, '%s,%f,%f,%f,%f,%f,%3f,%d,%i,%i,%i,%i,%f,%f,%f,%f,%6f,%6f,%6f,%6f\n',DateandTime,   INITIAL_PROPENSITY_A,INITIAL_PROPENSITY_B,INITIAL_PROPENSITY_EA,INITIAL_PROPENSITY_EB,    PUBLIC_CONSTANT_A,negW,Num_Neg_Events,    EVENT_TOTAL_A,EVENT_TOTAL_B,EVENT_TOTAL_EA,EVENT_TOTAL_EB,    TOTAL_CONFLICT_AVERAGE,MAXIMUM_CONFLICT_LEVEL,   Average_PerceivedThreat_A,Average_PerceivedThreat_B,  VESTED_INTEREST_A_ALL(T),VESTED_INTEREST_B_ALL(T),VESTED_INTEREST_EA_ALL(T),VESTED_INTEREST_EB_ALL(T)    );
fclose(fid);
end

function plotResults
%%% save plot
h = figure(1);
print(h,'-djpeg',plot_filename);
end
end