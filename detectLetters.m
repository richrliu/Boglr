function [newBoard, theLetters] = detectLetters(board)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

% First detect boundaries of outermost yellow (255) pixels in order to get
% rid of padding on outside

% keyboard;
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
% newBoard = 255*ones(size(newBoard))-newBoard;
% keyboard;

% Now split into windows and detect letters
load('Letters.mat');
% letIm = cell(4, 4);
theLetters = cell(4, 4);
realLetters = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Qu', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];
[newDimY, newDimX] = size(newBoard);
cutPointsY = [1 round(newDimY/4) round(newDimY/2) round(3*newDimY/4) newDimY];
cutPointsX = [1 round(newDimX/4) round(newDimX/2) round(3*newDimX/4) newDimX];
for i = 1:4
    for j=1:4
        letCorrs = zeros(1, 104);
        letIm = newBoard(cutPointsY(i):cutPointsY(i+1), cutPointsX(j):cutPointsX(j+1));
        letIm = imfilter(letIm, fspecial('gaussian', [5 5], 2), 'same');
        letIm = 255*(letIm>200);
        for k = 1:104
            actualLetIm = letters{k};
            actualLetIm = imresize(actualLetIm, size(letIm));
            letCorrs(k) = sum(sum(actualLetIm.*letIm));
        end
        [~, idx] = max(letCorrs);
%         figure(1);clf;
%         imagesc(letIm);
%         figure(2);clf;
%         imagesc(letters{ceil(idx)});
%         pause;
        theLetters{i, j} = realLetters(ceil(idx/4));
    end
end
end

