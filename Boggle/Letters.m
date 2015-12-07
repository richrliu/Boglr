for i=1:26
    let = double(rgb2gray(imread(sprintf('./%d.jpg', i))));
    let = imsharpen(let);
    let = 255*(let>170);
    letters{(i-1)*4+1} = let;
    letters{(i-1)*4+2} = rot90(let);
    letters{(i-1)*4+3} = rot90(let,2);
    letters{(i-1)*4+4} = rot90(let,3);
end

save('../Letters.mat', 'letters');