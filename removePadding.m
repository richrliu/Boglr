function [newBoard] = removePadding(board)
%UNTITLED5 Summary of this function goes here
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

end

