function reward = getReward(car)
%GETREWARD Summary of this function goes here
%   Detailed explanation goes here
scan = getScan(car);
ranges = scan.Ranges;
reward = -1000*any(ranges <= 0.5);
end