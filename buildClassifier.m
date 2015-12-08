load Letters;

actualFeatures = [];
actualClasses = [];

for i=1:length(letters)
    AA = letters{i};
    AA = AA(:);
    meann = mean(AA);
    stdd = std(AA);
    canny = edge(letters{i}, 'Canny');
    [H, ~, ~] = hough(canny);
    canny = mean(canny(:));
    H = mean((H(:)>10));
    features = [meann, stdd, canny, H];
    actualFeatures = [actualFeatures; features];
    actualClasses = [actualClasses; i];
end

for i = 1:4
    featMean(i) = mean(actualFeatures(:, i));
    stdMean(i) = std(actualFeatures(:, i));
    actualFeatures(:, i) = (actualFeatures(:, i)-mean(actualFeatures(:, i)))/std(actualFeatures(:, i));
end

% ds = prtDataSetClass(x, actualClasses);
% 
% knn = prtClassKnn;  
% knn = knn.train(ds);

save('Classifier.mat', 'actualFeatures', 'actualClasses', 'featMean', 'stdMean');