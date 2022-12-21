function [bestNode,accuracy]= SBS(trainingData,testData,initialNode)

wholeValues = [];
allAccuracies = [];

allAccuracies = [allAccuracies, calculateAccuracyOfNode(trainingData,testData)];
wholeValues(1,:) = [initialNode max(allAccuracies)];

nodes = findNextNodes(initialNode,"SBS");
counter = 2;

while true

    if size(nodes,1) == 1
        break;
    end
    allAccuracies = [];
    for i = 1:size(nodes,1)
        node = nodes(i,:);
        [training,test] = updateSets(trainingData,testData,node);
        trainingSet = training;
        testSet = test;
        allAccuracies = [allAccuracies, calculateAccuracyOfNode(trainingSet,testSet)];
    end
    [val, idx] = max(allAccuracies);
    wholeValues(counter,:) = [nodes(idx,:) val];
    count = 0;
    for i = 1:size(nodes(idx,:),2)
        node = nodes(idx,:);
        if node(1,i) == 0
            count = count + 1;
        end
    end
    if count == 8
        break;
    end
    initialNode = nodes(idx,:);
    nodes = findNextNodes(initialNode,"SBS");
    counter = counter + 1;
end

accuracyHolder = zeros(1,8);
for i =1:size(wholeValues,1)
    accuracyHolder(1,i) = wholeValues(i,9);
end

[val,index] = max(accuracyHolder);

accuracy = val;
bestNode = wholeValues(index,1:8);

end