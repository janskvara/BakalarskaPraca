function action = argmax(q_values)       
            top = -Inf;
            ties = [];
            for index = 1:length(q_values)
                if q_values(index) > top
                    top = q_values(index);
                    ties = [];
                end
                if q_values(index) == top
                    ties = [ties, index];
                end                
            end
            if length(ties) == 1
                action = ties(1);
            else
                action =  randsample(ties,1);
            end
end


