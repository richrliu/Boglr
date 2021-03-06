function [subimage, theCorr, yOffset, xOffset] = findSubimageHighestCorr(im, windowSize)
% Input: image, windowsize
% Output: subimage of dimensions windowsize*windowsize with least RMSE

% im = rrl6_histogramEqualize(im);
im = imsharpen(im);

imY = size(im, 1);
imX = size(im, 2);

% Assume windowsize is less than dimensions of im
stride = windowSize/21;

subimage = im(1:windowSize, 1:windowSize);
theCorr = sum(sum(subimage.*generateBoggleBoardImage(windowSize)));
yOffset = 1;
xOffset = 1;

% Create array of Y locations for strides
locationsY = ones(1, round((imY-windowSize)/stride));
counter = 1;
for i = 1:length(locationsY)
    locationsY(counter) = round((counter-1)*stride+1);
    counter = counter+1;
end

% Create array of C locations for strides
locationsX = ones(1, round((imX-windowSize)/stride));
counter = 1;
for i = 1:length(locationsX)
    locationsX(counter) = round((counter-1)*stride+1);
    counter = counter+1;
end

% Test subwindows
for i = 1:length(locationsX)
    for j = 1:length(locationsY)
%         keyboard;
        X1 = locationsX(i);
        X2 = X1+windowSize-1;
        Y1 = locationsY(j);
        Y2 = Y1+windowSize-1;
        subimg = im(Y1:Y2, X1:X2);
        corr = sum(sum(subimg.*generateBoggleBoardImage(windowSize)));
        if (corr > theCorr)
            yOffset = Y1;
            xOffset = X1;
            theCorr = corr;
            subimage = subimg;
        end
    end
end

end

