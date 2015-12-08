# Boglr
### Using Computer Vision to Detect the Letters on a 4x4 Boggle Board

In this project, we used this version of Boggle: http://www.amazon.com/Hasbro-A8168-Scrabble-Boggle-Game/dp/B00IFWSNFY/

## Dependencies:
MATLAB

## Instructions:
To run this program, simply use `[NewBoard, Letters] = boggleCV(filename)` where `filename` is the path to the Boggle Board image.

For example, use `[NewBoard, Letters] = boggleCV('./LetImg/tt.jpg')` to run Boglr on one of the sample images.
Then use `imagesc(NewBoard)` to see the detected board.