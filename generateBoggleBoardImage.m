function board = generateBoggleBoardImage(length)
% Input: Length
% Output: Generated black and white boggle board image

board = zeros(length);
% board = board+10;

breakpointLen = length/21;
breakpointMultipliers = [1, 5, 6, 10, 11, 15, 16, 20];
colorChangeLocations = floor(breakpointMultipliers.*breakpointLen);
for i = 1:4
    for j = 1:4
        A1 = colorChangeLocations(2*i-1);
        A2 = colorChangeLocations(2*i);
        B1 = colorChangeLocations(2*j-1);
        B2 = colorChangeLocations(2*j);
        board(A1:A2, B1:B2) = 255;
    end
end

end

