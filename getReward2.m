function reward = getReward2(car,time)
%GETREWARD Summary of this function goes here
%   Detailed explanation goes here
    scan = getScan(car);
    ranges = scan.Ranges;
    reward = -10000*any(ranges <= 0.5)+ time*0.1;
end
