function [bestNode,accuracy]= SFS(trainingData,testData,initialNode)

nodes = findNextNodes(initialNode,"SFS");
wholeValues = [];
counter = 1;

    while true
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
    if count == 0
        break;
    end
    initialNode = nodes(idx,:);
    nodes = findNextNodes(initialNode,"SFS");
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