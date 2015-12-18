# Boglr
### Using Computer Vision to Detect the Letters on a 4x4 Boggle Board

In this project, we used this version of Boggle: http://www.amazon.com/Hasbro-A8168-Scrabble-Boggle-Game/dp/B00IFWSNFY/

## Dependencies:
MATLAB

## Instructions:
To run this program, simply use `[NewBoard, Letters] = boggleCV(filename)` where `filename` is the path to the Boggle Board image.

For example, use `[NewBoard, Letters] = boggleCV('./LetImg/tt.jpg')` to run Boglr on one of the sample images.
Then use `imagesc(NewBoard)` to see the detected board.

## Relevant File Descriptions
#### Detection
`board = generateBoggleBoardImage(length)` - Generates a black and white image of a 4x4 Boggle board, with a black frame and white tiles. Used as template in detection of Boggle board in image.

`[subimage, theCorr, yOffset, xOffset] = findSubimageHighestCorr(im, windowSize)` - Finds the correlation and position of detected Boggle board of side length `windowSize`, returned as `subimage`. 

`[theBoard, windowSize, xOffset, yOffset] = detectBoggleBoardPyramid(im)` - Given an image, this function uses a matched filter to detect the most likely position of the Boggle board within the image, and outputs the detection window as `theBoard` with side length `windowSize`.

`[newBoard, theLetters] = detectLetters(board)` - Given a detected "board" (output of `detectBoggleBoardPyramid`), this function appropriately grids up the board into letter tiles, and uses a matched filter on each one to detect the most likely character. `newBoard` is a processed version of `board` and `theLetters` is a 4x4 cell array of detected letters.

`[newBoard, theLetters] = boggleCV(filename)` - Runs the detection on the file at path `filename`.	

#### Processing
`[newBoard] = removePadding(board)` - Removes the dark padding at the edges of an image. Used in cleaning the detected board image as well as the detected letter tiles.

#### Data
`Letters.mat` - Contains a cell array `letters` which contains matrices that represent images of each character rotated 4 times. Used in matched filter detection of each letter tile.

## Report
For detailed information, please see report.pdf.