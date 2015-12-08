realLetters = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];

counter = 1;
for j=1:26
    for i=1:5
        let = double(imread(sprintf('./Letters/%s%d.jpg', realLetters(j),i)));
%         let = imsharpen(let);
        let = 255*(let>170);
        let = removePadding(let);
        let = let - mean(let(:));
    %     letters{i} = let;
        letters{counter} = let;
        counter = counter+1;
        letters{counter} = rot90(let);
        counter = counter+1;
        letters{counter} = rot90(let,2);
        counter = counter+1;
        letters{counter} = rot90(let,3);
        counter = counter+1;
    end
end

save('./Letters.mat', 'letters');