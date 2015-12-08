function makeLetters(board, sss)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

dimY = size(board, 1);
dimX = size(board, 2);

top = 1;
left = 1;
bottom = dimY;
right = dimX;

for i=1:dimY
    if(any(board(i,:)==255))
        top = i;
        break;
    end
end

for j=1:dimY
    jj = dimY-j+1;
    if(any(board(jj,:)==255))
        bottom = jj;
        break;
    end
end

for k=1:dimX
    if(any(board(:,k)==255))
        left = k;
        break;
    end
end

for l=1:dimX
    ll = dimX-l+1;
    if(any(board(:,ll)==255))
        right = ll;
        break;
    end
end

newBoard = board(top:bottom, left:right);

[newDimY, newDimX] = size(newBoard);
cutPointsY = [1 round(newDimY/4) round(newDimY/2) round(3*newDimY/4) newDimY];
cutPointsX = [1 round(newDimX/4) round(newDimX/2) round(3*newDimX/4) newDimX];

for i = 1:4
    for j=1:4
        letIm = newBoard(cutPointsY(i):cutPointsY(i+1), cutPointsX(j):cutPointsX(j+1));
        letIm = 255*(letIm>180);
        str = '';
        str = sprintf('./Letters/%s%d%d.jpg', sss, i, j);
        imwrite(letIm, str);
    end
end

end

