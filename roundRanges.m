function roundedRanges = roundRanges(ranges)
%ROUNDRANGES Summary of this function goes here
%   Detailed explanation goes here
    roundTargets = [0 2 4 8];
    roundedRanges = interp1(roundTargets,roundTargets,ranges,'nearest');
    roundedRanges(isnan(roundedRanges))= 8;
end
