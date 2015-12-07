function testBoggleBoardDetection(filename, windowSize)
% Input: Filename of image containing boggle board, size of detection
% window
% Output: figures of the image, detected boggle board using RMSE, and detected boggle board using correlation 

im = double(rgb2gray(imread(filename)));
% im = double(rrl6_histogramEqualize(im));
% im = double(imsharpen(im));
% keyboard;
% im2 = zeros(size(im));
im2 = im;
[~, R, yO, xO] = findSubimageWithLeastRMSE(im, windowSize);
im2(yO:yO+windowSize-1, xO:xO+windowSize-1) = 255;

xO
yO
R

figure (1); clf;
imagesc(im)

figure(2); clf;
% hold on
% imagesc(im);
% imagesc(im2);
% hold off
imagesc(im2);

im3 = im;
[~, C, y1, x1] = findSubimageHighestCorr(im, windowSize);
im3(y1:y1+windowSize-1, x1:x1+windowSize-1) = 255;
figure(3); clf;
imagesc(im3);

end

