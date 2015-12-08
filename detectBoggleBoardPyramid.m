function [theBoard, windowSize, xOffset, yOffset] = detectBoggleBoardPyramid(im)
%This function cycles through five possible sizes for the detection window
%and picks the most appropriate one given the matched filter
% Input: Image 
% Output: Detected board, window size, x offset location, y offset location

im = double(rgb2gray(im));
im = 255*(im>170);

% First window size is the minimum of the two dimensions
minDimension = min(size(im, 1), size(im, 2));
pow = [0 1 2 3 4];

% For each window size, find the subimage with the highest correlation.
% Then, at the end, pick the window size and position with the absolute
% highest correlation.
for i = 1:length(pow)
    [image, C, yOff, xOff] = findSubimageHighestCorr(im, round(minDimension*0.75^pow(i)));
    ims{i} = image;
    corrs{i} = C;
    yO{i} = yOff;
    xO{i} = xOff;
end

[~, ind] = max([corrs{:}]);
theBoard = ims{ind};
windowSize = round(minDimension*0.75^pow(ind));
xOffset = xO{ind};
yOffset = yO{ind};

end

