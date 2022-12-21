function [trainingSet,testSet]= updateSets(trainingData,testData,node)

setForTraining = {};
setForTest = {};

for j = 1:size(trainingData,2)
    set1 = trainingData{1,j};
    set2 = testData{1,j};
    emp = [];
    emp1 = [];
    for k = 1:size(set1,1)
        m1 = [];
        m2 = [];
        for l = 1:size(set1,2)
            if node(1,l) == 1
                m1 = [m1 ,set1(k,l)];
                m2 = [m2 ,set2(k,l)];
            end
        end
        emp(k,:)= m1;
        emp1(k,:)= m2;
    end
    setForTraining{1,j} = emp;
    setForTest{1,j} = emp1;

end

trainingSet = setForTraining;
testSet = setForTest;

end