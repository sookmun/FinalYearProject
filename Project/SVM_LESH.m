function [confMat,classOrder,accuracy]=SVM_LESH(data,training_percentage)
assert(istable(data), "Error - not a table");
assert(isnumeric(training_percentage), "Error - not a number");
% data=readtable(data);
%split data
[m,n] = size(data) ;
P = training_percentage ;
idx = randperm(m)  ;
training_set = data(idx(1:round(P*m)),:); 
testing_set = data(idx(round(P*m)+1:end),:);
x_tr=training_set(:,1:512); 
x_ts=testing_set(:,1:512);
trainTargets=training_set(:,513);
testTargets=testing_set(:,513);
SVMModel = fitcecoc(x_tr,trainTargets);
leshModel=SVMModel;
save leshModel
TrainOutputs = SVMModel.Y;
%predict
TestOutputs = predict(SVMModel,x_ts);

%make confusion matrix
confMat = confusionmat(table2cell(testTargets), TestOutputs);
display(confMat);
classOrder = SVMModel.ClassNames;
classOrder =(size(classOrder,1));
display(classOrder);

crossValSVMModel = crossval(SVMModel);
generalizedError = kfoldLoss(crossValSVMModel);
accuracy = 1 - generalizedError;
display(accuracy);


% Mdl = fitcecoc(X,Y)
% Mdl.ClassNames
% CodingMat = Mdl.CodingMatrix
% error = resubLoss(Mdl)

end