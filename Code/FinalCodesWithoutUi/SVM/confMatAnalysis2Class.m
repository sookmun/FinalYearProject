function conf_mat_analysis_two_class = confMatAnalysis2Class(confMat)
top_left = confMat(1,1);
top_right = confMat(1,2);
bottom_left = confMat(2,1);
bottom_right = confMat(2,2);

accuracy = (top_left+bottom_right)/(top_left+bottom_right+top_right+bottom_left);
true_positive_rate = top_left/(top_left+top_right);
true_negative_rate = bottom_right/(bottom_right+bottom_left);
positive_predictive_value = top_left/(top_left+bottom_left);
negative_predictive_value = bottom_right/(bottom_right+top_right);

results.Accuracy = accuracy;
results.TPR = true_positive_rate;
results.TNR = true_negative_rate;
results.PositivePredictiveValue = positive_predictive_value;
results.NegativePredictiveValue = negative_predictive_value;

conf_mat_analysis_two_class = results;
end