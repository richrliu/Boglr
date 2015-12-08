function [newBoard, theLetters] = boggleCV(filename)
% Input: filename
% Output: detected board, detected letters

im = imread(filename);
[detectedBoard, detectedWindowSize, xOffset, yOffset] = detectBoggleBoardPyramid(im);
[newBoard, theLetters] = detectLetters(detectedBoard);

theLetters

end

