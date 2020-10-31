classdef QLearningAgent
    %QLEARNINGAGENT Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        numberOfActions
        numberOfStates
        epsilon
        stepSize
        discount
        QTable
        prev_state
        prev_action
    end
    
    methods
        function obj = QLearningAgent(num_actions,num_states,epsilon,step_size,discount)
            %QLEARNINGAGENT Construct an instance of this class
             obj.numberOfActions = num_actions;
             obj.numberOfStates = num_states;
             obj.epsilon = epsilon;
             obj.stepSize = step_size;
             obj.discount = discount;  
             obj.QTable = zeros(num_states, num_actions);
        end
        
        function [obj_new,action] = start(obj,state)
            current_q = obj.QTable(state,:);
            if rand() < obj.epsilon
                action = randi(obj.numberOfActions);
            else
                action = argmax(current_q);
            end
            obj.prev_state = state;
            obj.prev_action = action;
            obj_new = obj;
        end
        
        function [obj_new,action] = step(obj,reward,state)
            current_q = obj.QTable(state,:);
            if rand() < obj.epsilon
                action = randi(obj.numberOfActions);
            else
                action = argmax(current_q);
            end
            obj.QTable(obj.prev_state, obj.prev_action) = obj.QTable(obj.prev_state, obj.prev_action) + obj.stepSize * (reward + obj.discount * max(obj.QTable(state,:)) - obj.QTable(obj.prev_state, obj.prev_action));
                                                                       
            obj.prev_state = state;
            obj.prev_action = action;
            obj_new = obj;
        end
        
        function [obj_new] = endStep(obj,reward)          
            obj.QTable(obj.prev_state, obj.prev_action) = obj.QTable(obj.prev_state, obj.prev_action) + obj.stepSize * (reward  - obj.QTable(obj.prev_state, obj.prev_action));  
            obj_new = obj;
        end
                
    end
end

