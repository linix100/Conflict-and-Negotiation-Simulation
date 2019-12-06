# Threat Perception and the Persistence or Desistence of Violent Conflict 

​		In international security, there are many cases of inter-group conflict where violence persists and conflict-oriented policies dominate at the expense of a more mutually beneficial allocation of societal goods. What are the barriers to successful negotiation in such scenarios, and why are conflict management policies difficult to achieve? Most studies of conflict focus on high-level political, economic, or sociological causes; however, psychological influences on decision-making, such as threat and personal motivation, play a large role in impeding conflict resolution or negotiation. 

​		We analyze the psychological dynamics of threat perception and vested interests on the persistence or desistence of conflict. Threat perception can cause sudden and dramatic shifts in opinion and political choices, an effect which can be further amplified by media reporting. Leaders with a vested personal interest in continued conflict---''spoilers''---can manipulate this phenomenon to derail a peace process. 

​		We present a dynamic game theoretic framework of parallel ***inter-group negotiation and conflict models*** that incorporates this feedback between threat perception, motivations, leadership decisions, and the success of negotiations, explicitly representing the psychological components of conflict. A prototype implementation is used in empirical simulations to identify cases of conflict persistence and desistence.

## Implementation

Using this dynamic modeling framework, we have implemented a prototype simulation system consisting of about 1,500 lines of MATLAB code. An empirical simulation was run using two groups, each with a single mainline and fringe leader. For each simulation run t_max = 10, 000, indicating 10,000 days. On each day, the psychological behavioral factors were computed to determine each leader's strategy. from a 3-dimensional utility matrix indicating the probability of an attack. Negotiation events were generated from a probability distribution s.t. if the total conflict was below 0.02, there was a 0.25 probability of negotiation. We varied (i) the amplification A = {0.1, 1, 10} to indicate low, medium, and high levels, (ii) the weight of
negotiation success probability W = {0.08, 0.1, 0.12}, and (iii) the initial vested interest of all leaders Vi,j(0) = [-0.9,0.9]. These simulations were run on 5 nodes of a Linux cluster with a combined 56 cores and 240 GB RAM. At least 10 runs were completed for each parameter setting.

