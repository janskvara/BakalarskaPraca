
velocity = 30;
connectionToGazebo();
car = connectToCar();
car = setSteeringAngle(car,0); 
%125 epizode
%1163
actions = getActions();
states = getStates([1 3 5 7],[1 3 5 7], [1 3 5 7], [1 3 5 7]);
%qAgent = QLearningAgent(length(actions),length(states),0.2,0.3,0.8);
qAgent = load('JozkoQ1.8_2243.mat').qAgent;
%qAgent.epsilon = 0;
epizoda = 1;
while(1)
    fprintf("----------------Epizoda %d-------------------\n", epizoda)
    car = setVelocity(car,velocity);
    scan = getScan(car);
    ranges = roundRanges2(scan.Ranges);
    state = find((ismember(states, ranges','rows')));
    [qAgent, action] = start(qAgent, state);
    car = setSteeringAngle(car,actions(action)); 
    previousRanges = [];
    time = 0; 
    while(true)
        scan = getScan(car);
%         line = plot(scan);
        ranges = roundRanges2(scan.Ranges);
        state = find((ismember(states, ranges','rows')));
        reward = getReward3(car, time);
        if any(scan.Ranges <= 0.5)
            qAgent = endStep(qAgent,reward);
            break;
        end
        if not(isequal(ranges,previousRanges))
            [qAgent,action] = step(qAgent,reward,state);
            car = setSteeringAngle(car,actions(action)); 
            previousRanges = ranges;
        end
        time = time +1; 
        pause(0.10);
    end
    car = resetCar(car);
    resetPosition(car);
    epizoda = epizoda +1; 
    pause(1.0);
end





