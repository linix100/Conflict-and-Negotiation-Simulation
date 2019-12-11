%%%this looptest.m is for test use
rML=1000;
rF=500;
v=1;

for ampA=[0.1,1]
    for negW=0.08
        for ctcMLA=-.3
            for ctcMLB=-.2
                for ctcFA=.4
                    for ctcFB=.1
                         init(ampA, ctcMLA, ctcMLB, ctcFA, ctcFB,negW, rML, rF, v)
                    end
                end
            end
        end
    end
end