function [class] = classifyMe(features, actualFeatures, actualClasses)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

distances = zeros(1, length(actualClasses));
for i = 1:length(distances)
    distances(i) = sqrt(sum((features-actualFeatures(i, :)).^2));
end
distances
[~, idx] = min(distances);
class = actualClasses(idx);

end

