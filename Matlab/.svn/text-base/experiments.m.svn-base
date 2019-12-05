%%%Call experiments.m to run it on computer cluster. 
%%%
function[] = experiments(numRuns,ampA_val,negW_val,ctcMLA_start,ctcMLA_end,ctcMLB_start,ctcMLB_end,ctcFA_start,ctcFA_end,ctcFB_start,ctcFB_end,v,w,p)
rML=1000;
rF=500;


ampA=ampA_val
negW=negW_val

for ctcMLA=ctcMLA_start:0.1:ctcMLA_end
    for ctcMLB=ctcMLB_start:0.1:ctcMLB_end
        for ctcFA=ctcFA_start:0.1:ctcFA_end
            for ctcFB=ctcFB_start:0.1:ctcFB_end
                for runs=0:1:numRuns
                    init(ampA, ctcMLA, ctcMLB, ctcFA, ctcFB,negW, rML, rF, v, w, p)
                end
            end
        end
    end
end


end