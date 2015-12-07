function [output, tFcn] = rrl6_histogramEqualize(im)
%This function outputs a histogram equalized image, as well as the
%associated CDF function
imVector = ones(size(im,1)*size(im,2), 1);
doubleIm = double(im);

%% We want input im values in a vector
count = 1;
for i = 1:size(im, 1)
    for j = 1:size(im, 2)
        imVector(count) = imVector(count).*doubleIm(i,j);
        count = count+1;
    end
end

%% Linear algebra black magic is in this section
histo = hist(imVector, 0:255);   % Histogram values
histoSumNorm = cumsum(histo)./length(imVector);  % cumsum/length gives CDF

tFcn = @(x) histoSumNorm(x+1).*255; %Linear Transformation. Use +1 because MATLAB does not index 0
output = uint8(tFcn(im));

end