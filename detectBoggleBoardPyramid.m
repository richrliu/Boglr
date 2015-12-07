function [theBoard, windowSize, xOffset, yOffset] = detectBoggleBoardPyramid(im)
%This function cycles through five possible sizes for the detection window
%and picks the most appropriate one given the matched filter
% Input: Image 
% Output: Detected board, window size, x offset location, y offset location

im = double(rgb2gray(im));
im = 255*(im>200);
imagesc(im);
minDimension = min(size(im, 1), size(im, 2));
pow = [0 1 2 3 4];

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

