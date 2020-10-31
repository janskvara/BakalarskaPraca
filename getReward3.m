function reward = getReward3(car,time)
%GETREWARD Summary of this function goes here
%   Detailed explanation goes here
    scan = getScan(car);
    ranges = scan.Ranges;
    if any(ranges <= 0.5)
        reward = -10000;
    else
        reward = time*0.1;
    end
end

