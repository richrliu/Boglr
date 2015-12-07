function [RMSE] = getBoggleFrameRMSE(im)
% Input: a square image, hopefully
% Output: RMSE of input im and generated Boggle board

lowerDim = min(size(im, 1), size(im, 2));
im2 = im(1:lowerDim, 1:lowerDim);
genBoggleBoard = generateBoggleBoardImage(lowerDim);
RMSE = sqrt(1/numel(im2).*sum(sum((im2-genBoggleBoard).^2)));

end

