%%%Call Loop.m to run it on computer cluster. 
%%%
rML=1000;
rF=500;
v=1;

for ampA=[0.1,1,10]
    for Parameter1=0.08:0.01:0.2
        for ctcMLA=-1:0.1:1
            for ctcMLB=-1:0.1:1
                for ctcFA=-1:0.1:1
                    for ctcFB=-1:0.1:1
                         init(ampA, ctcMLA, ctcMLB, ctcFA, ctcFB,Parameter1, rML, rF, v)
                    end
                end
            end
        end
    end
end


