clear; clc;

%% Definitions
filename = 'boggleBoard.jpg';

%% Tests

im = double(rgb2gray(imread(filename)));
[subIm, corr, y1, x1] = findSubimageHighestCorr(im, windowSize);
