function roundedRanges = roundRanges2(ranges)
%ROUNDRANGES Summary of this function goes here
%   Detailed explanation goes here
    roundTargets = [1 3 5 7];
    roundedRanges = interp1(roundTargets,roundTargets,ranges,'nearest');
    roundedRanges(isnan(roundedRanges))= 7;
end

