function [accuracy]= calculateAccuracyOfNode(trainingSet,testSet)

sum = 0;
for j = 1:size(testSet,2)
    featureVectors = testSet{1,j};
    for k = 1:size(featureVectors,1)
        featureVector = [];
        results = [];
        % each feature vector
        for l = 1:size(featureVectors,2)
            featureVector = [featureVector ,featureVectors(k,l)];
        end
        % each test classes
        for l = 1:size(testSet,2)
            m = mean(transpose(trainingSet{1,l}'),1);
            S = cov(trainingSet{1,l});
            x = featureVector';
            results = [results,compGaussDensVal(m',S,x)];
        end
        [val,idx] = max(results);
        if idx == j
            sum = sum + 1;
        end
    end
end
accuracy = sum / 320 * 100;
end