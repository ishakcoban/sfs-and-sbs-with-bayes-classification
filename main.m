load('classes.mat')

trainingData = {classes(1:80,:),classes(161:240,:),classes(321:400,:),classes(481:560,:)};
testData = {classes(81:160,:),classes(241:320,:),classes(401:480,:),classes(561:640,:)};

initialNodeForSFS= [0 0 0 0 0 0 0 0];
initialNodeForSBS= [1 1 1 1 1 1 1 1];

[a,classificationAccuracyForSFS] = SFS(trainingData,testData,initialNodeForSFS);
[b,classificationAccuracyForSBS] = SBS(trainingData,testData,initialNodeForSBS);

optimumFeatureSubsetForSFS = "";
optimumFeatureSubsetForSBS = "";
for i = 1:size(a,2)

    if i == 1
    optimumFeatureSubsetForSFS = "[" + a(1,i);
    optimumFeatureSubsetForSBS = "[" + b(1,i);
    else
        optimumFeatureSubsetForSFS = optimumFeatureSubsetForSFS + " " + a(1,i);
        optimumFeatureSubsetForSBS = optimumFeatureSubsetForSBS + " " + b(1,i);
    end

    if i == size(a,2)
        optimumFeatureSubsetForSFS = optimumFeatureSubsetForSFS + "]";
        optimumFeatureSubsetForSBS = optimumFeatureSubsetForSBS + "]";
    end
end

disp("SFS")
disp('Optimum feature subset: ' + optimumFeatureSubsetForSFS);
disp("Classification Accuracy: " + classificationAccuracyForSFS + "%")
disp("");
disp("SBS")
disp('Optimum feature subset: ' + optimumFeatureSubsetForSBS);
disp("Classification Accuracy: " + classificationAccuracyForSBS + "%")
