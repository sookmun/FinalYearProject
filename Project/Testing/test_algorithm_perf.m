function main
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
data="MIAS(no muscle)";

%% 2 class
table =readtable('MIAS_Output_2class.csv');
%% region growing + GLCM
disp("region growing + GLCM + 2 class");
% without pre process
disp("Results of region growing + GLCM: WITHOUT PRE_PROCESS");
table2=regionGrowingGLCM_without(data,table);
disp("Result 1");
[confMat,classOrder,accuracy] = SVM_GLCM(table2,0.70)
%disp("confMat");
%confMat
%disp("classOrder");
%classOrder
%disp("accuracy");
%accuracy

disp("Result 2");
[confMat,classOrder,accuracy] = SVM_GLCM(table2,0.70)
% disp("confMat");
% confMat
% disp("classOrder");
% classOrder
% disp("accuracy");
% accuracy
% disp("Result 3");

disp("Result 3");
[confMat,classOrder,accuracy] = SVM_GLCM(table2,0.70)
% disp("confMat");
% confMat
% disp("classOrder");
% classOrder
% disp("accuracy");
% accuracy

% with pre process
disp("Results of region growing + GLCM: WITH PRE_PROCESS + 2 class");
table2=regionGrowingGLCM_pre(data,table);
disp("Result 1");
[confMat,classOrder,accuracy] = SVM_GLCM(table2,0.70)
% disp("confMat");
% confMat
% disp("classOrder");
% classOrder
% disp("accuracy");
% accuracy

disp("Result 2");
[confMat,classOrder,accuracy] = SVM_GLCM(table2,0.70)
% disp("confMat");
% confMat
% disp("classOrder");
% classOrder
% disp("accuracy");
% accuracy

disp("Result 3");
[confMat,classOrder,accuracy] = SVM_GLCM(table2,0.70)
% disp("confMat");
% confMat
% disp("classOrder");
% classOrder
% disp("accuracy");
% accuracy

%% hammouche + GLCM
disp("hammouche + GLCM");
% with pre-process
disp("Results of hammouche + GLCM: WITHOUT PRE_PROCESS + 2 class");
table2=hammoucheGLCM_without(data,table);
disp("Result 1");
[confMat,classOrder,accuracy] = SVM_GLCM(table2,0.70)
% disp("confMat");
% confMat
% disp("classOrder");
% classOrder
% disp("accuracy");
% accuracy

disp("Result 2");
[confMat,classOrder,accuracy] = SVM_GLCM(table2,0.70)
% disp("confMat");
% confMat
% disp("classOrder");
% classOrder
% disp("accuracy");
% accuracy

disp("Result 3");
[confMat,classOrder,accuracy] = SVM_GLCM(table2,0.70)
% disp("confMat");
% confMat
% disp("classOrder");
% classOrder
% disp("accuracy");
% accuracy


% with pre-process
disp("Results of hammouche + GLCM: WITH PRE_PROCESS + 2 class");
table2=hammoucheGLCM_pre(data,table);
disp("Result 1");
[confMat,classOrder,accuracy] = SVM_GLCM(table2,0.70)
% disp("confMat");
% confMat
% disp("classOrder");
% classOrder
% disp("accuracy");
% accuracy

disp("Result 2");
[confMat,classOrder,accuracy] = SVM_GLCM(table2,0.70)
% disp("confMat");
% confMat
% disp("classOrder");
% classOrder
% disp("accuracy");
% accuracy

disp("Result 3");
[confMat,classOrder,accuracy] = SVM_GLCM(table2,0.70)
% disp("confMat");
% confMat
% disp("classOrder");
% classOrder
% disp("accuracy");
% accuracy

%% region growing + LESH
disp("region growing + LESH");
% without pre-process
disp("Results of region growing + lesh: WITHOUT PRE_PROCESS + 2 class");
table2=regionGrowingLESH_without(data,table);
disp("Result 1");
[confMat,classOrder,accuracy] = SVM_LESH(table2,0.70)
% disp("confMat");
% confMat
% disp("classOrder");
% classOrder
% disp("accuracy");
% accuracy

disp("Result 2");
[confMat,classOrder,accuracy] = SVM_LESH(table2,0.70)
% disp("confMat");
% confMat
% disp("classOrder");
% classOrder
% disp("accuracy");
% accuracy

disp("Result 3");
[confMat,classOrder,accuracy] = SVM_LESH(table2,0.70)
% disp("confMat");
% confMat
% disp("classOrder");
% classOrder
% disp("accuracy");
% accuracy


% with pre-process
disp("Results of region growing + lesh: WITH PRE_PROCESS + 2 class");
table2=regionGrowingLESH_pre(data,table);
disp("Result 1");
[confMat,classOrder,accuracy] = SVM_LESH(table2,0.70)
% disp("confMat");
% confMat
% disp("classOrder");
% classOrder
% disp("accuracy");
% accuracy

disp("Result 2");
[confMat,classOrder,accuracy] = SVM_LESH(table2,0.70)
% disp("confMat");
% confMat
% disp("classOrder");
% classOrder
% disp("accuracy");
% accuracy

disp("Result 3");
[confMat,classOrder,accuracy] = SVM_LESH(table2,0.70)
% disp("confMat");
% confMat
% disp("classOrder");
% classOrder
% disp("accuracy");
% accuracy

%% hammouche + LESH
disp("hammouche + LESH");
% without pre-process
disp("Results of hammouche + lesh: WITHOUT PRE_PROCESS + 2 class");
table2=hammoucheLESH_without(data,table);
disp("Result 1");
[confMat,classOrder,accuracy] = SVM_LESH(table2,0.70)
% disp("confMat");
% confMat
% disp("classOrder");
% classOrder
% disp("accuracy");
% accuracy

disp("Result 2");
[confMat,classOrder,accuracy] = SVM_LESH(table2,0.70)
% disp("confMat");
% confMat
% disp("classOrder");
% classOrder
% disp("accuracy");
% accuracy

disp("Result 3");
[confMat,classOrder,accuracy] = SVM_LESH(table2,0.70)
% disp("confMat");
% confMat
% disp("classOrder");
% classOrder
% disp("accuracy");
% accuracy

% with pre-process
disp("Results of hammouche + lesh: WITH PRE_PROCESS + 2 class");
table2=hammoucheLESH_pre(data,table);
disp("Result 1");
[confMat,classOrder,accuracy] = SVM_LESH(table2,0.70)
% disp("confMat");
% confMat
% disp("classOrder");
% classOrder
% disp("accuracy");
% accuracy

disp("Result 2");
[confMat,classOrder,accuracy] = SVM_LESH(table2,0.70)
% disp("confMat");
% confMat
% disp("classOrder");
% classOrder
% disp("accuracy");
% accuracy

disp("Result 3");
[confMat,classOrder,accuracy] = SVM_LESH(table2,0.70)
% disp("confMat");
% confMat
% disp("classOrder");
% classOrder
% disp("accuracy");
% accuracy

%% 3 class
table =readtable('MIAS_Output_3class.xlsx');

%% region growing + GLCM
disp("region growing + GLCM + 3 class");
% without pre process
disp("Results of region growing + GLCM: WITHOUT PRE_PROCESS + 3 class");
table2=regionGrowingGLCM_without(data,table);
disp("Result 1");
[confMat,classOrder,accuracy] = SVM_GLCM(table2,0.70)
% disp("confMat");
% confMat
% disp("classOrder");
% classOrder
% disp("accuracy");
% accuracy

disp("Result 2");
[confMat,classOrder,accuracy] = SVM_GLCM(table2,0.70)
% disp("confMat");
% confMat
% disp("classOrder");
% classOrder
% disp("accuracy");
% accuracy

disp("Result 3");
[confMat,classOrder,accuracy] = SVM_GLCM(table2,0.70)
% disp("confMat");
% confMat
% disp("classOrder");
% classOrder
% disp("accuracy");
% accuracy

% with pre process
disp("Results of region growing + GLCM: WITH PRE_PROCESS + 3 class");
table2=regionGrowingGLCM_pre(data,table);
disp("Result 1");
[confMat,classOrder,accuracy] = SVM_GLCM(table2,0.70)
% disp("confMat");
% confMat
% disp("classOrder");
% classOrder
% disp("accuracy");
% accuracy

disp("Result 2");
[confMat,classOrder,accuracy] = SVM_GLCM(table2,0.70)
% disp("confMat");
% confMat
% disp("classOrder");
% classOrder
% disp("accuracy");
% accuracy

disp("Result 3");
[confMat,classOrder,accuracy] = SVM_GLCM(table2,0.70)
% disp("confMat");
% confMat
% disp("classOrder");
% classOrder
% disp("accuracy");
% accuracy

%% hammouche + GLCM
disp("hammouche + GLCM");
% with pre-process
disp("Results of hammouche + GLCM: WITHOUT PRE_PROCESS + 3 class");
table2=hammoucheGLCM_without(data,table);
disp("Result 1");
[confMat,classOrder,accuracy] = SVM_GLCM(table2,0.70)
% disp("confMat");
% confMat
% disp("classOrder");
% classOrder
% disp("accuracy");
% accuracy

disp("Result 2");
[confMat,classOrder,accuracy] = SVM_GLCM(table2,0.70)
% disp("confMat");
% confMat
% disp("classOrder");
% classOrder
% disp("accuracy");
% accuracy

disp("Result 3");
[confMat,classOrder,accuracy] = SVM_GLCM(table2,0.70)
% disp("confMat");
% confMat
% disp("classOrder");
% classOrder
% disp("accuracy");
% accuracy

% with pre-process
disp("Results of hammouche + GLCM: WITH PRE_PROCESS + 3 class");
table2=hammoucheGLCM_pre(data,table);
disp("Result 1");
[confMat,classOrder,accuracy] = SVM_GLCM(table2,0.70)
% disp("confMat");
% confMat
% disp("classOrder");
% classOrder
% disp("accuracy");
% accuracy

disp("Result 2");
[confMat,classOrder,accuracy] = SVM_GLCM(table2,0.70)
% disp("confMat");
% confMat
% disp("classOrder");
% classOrder
% disp("accuracy");
% accuracy

disp("Result 3");
[confMat,classOrder,accuracy] = SVM_GLCM(table2,0.70)
% disp("confMat");
% confMat
% disp("classOrder");
% classOrder
% disp("accuracy");
% accuracy

%% region growing + LESH
disp("region growing + LESH + 3 class");
% without pre-process
disp("Results of region growing + lesh: WITHOUT PRE_PROCESS + 3 class");
table2=regionGrowingLESH_without(data,table);
disp("Result 1");
[confMat,classOrder,accuracy] = SVM_LESH(table2,0.70)
% disp("confMat");
% confMat
% disp("classOrder");
% classOrder
% disp("accuracy");
% accuracy

disp("Result 2");
[confMat,classOrder,accuracy] = SVM_LESH(table2,0.70)
% disp("confMat");
% confMat
% disp("classOrder");
% classOrder
% disp("accuracy");
% accuracy
% disp("Result 3");
disp("Result 3");
[confMat,classOrder,accuracy] = SVM_LESH(table2,0.70)
% disp("confMat");
% confMat
% disp("classOrder");
% classOrder
% disp("accuracy");
% accuracy


% with pre-process
disp("Results of region growing + lesh: WITH PRE_PROCESS + 3 class");
table2=regionGrowingLESH_pre(data,table);
disp("Result 1");
[confMat,classOrder,accuracy] = SVM_LESH(table2,0.70)
% disp("confMat");
% confMat
% disp("classOrder");
% classOrder
% disp("accuracy");
% accuracy

disp("Result 2");
[confMat,classOrder,accuracy] = SVM_LESH(table2,0.70)
% disp("confMat");
% confMat
% disp("classOrder");
% classOrder
% disp("accuracy");
% accuracy
% disp("Result 3");

disp("Result 3");
[confMat,classOrder,accuracy] = SVM_LESH(table2,0.70)
% disp("confMat");
% confMat
% disp("classOrder");
% classOrder
% disp("accuracy");
% accuracy

%% hammouche + LESH
disp("hammouche + LESH");
% without pre-process
disp("Results of hammouche + lesh: WITHOUT PRE_PROCESS + 3 class");
table2=hammoucheLESH_without(data,table);

disp("Result 1");
[confMat,classOrder,accuracy] = SVM_LESH(table2,0.70)
% disp("confMat");
% confMat
% disp("classOrder");
% classOrder
% disp("accuracy");
% accuracy

disp("Result 2");
[confMat,classOrder,accuracy] = SVM_LESH(table2,0.70)
% disp("confMat");
% confMat
% disp("classOrder");
% classOrder
% disp("accuracy");
% accuracy

disp("Result 3");
[confMat,classOrder,accuracy] = SVM_LESH(table2,0.70)
% disp("confMat");
% confMat
% disp("classOrder");
% classOrder
% disp("accuracy");
% accuracy

% with pre-process
disp("Results of hammouche + lesh: WITH PRE_PROCESS + 3 class");
table2=hammoucheLESH_pre(data,table);
disp("Result 1");
[confMat,classOrder,accuracy] = SVM_LESH(table2,0.70)
% disp("confMat");
% confMat
% disp("classOrder");
% classOrder
% disp("accuracy");
% accuracy

disp("Result 2");
[confMat,classOrder,accuracy] = SVM_LESH(table2,0.70)
% disp("confMat");
% confMat
% disp("classOrder");
% classOrder
% disp("accuracy");
% accuracy

disp("Result 3");
[confMat,classOrder,accuracy] = SVM_LESH(table2,0.70)
% disp("confMat");
% confMat
% disp("classOrder");
% classOrder
% disp("accuracy");
% accuracy

end

