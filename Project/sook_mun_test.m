[csvfile,path] = uigetfile({'*.xls';'*.xlsx';'*.csv';});

File = fullfile(path, csvfile);
csvFile=readtable(File);
% hi = readtable(File);
path = uigetdir('C:\Users\Sook Mun\Google Drive\Y3S2\CS2\fit3162\Dataset_Tester');
% hi = readtable(File);
% actual_condition=hi(:,2);
% % lst=[actual_condition];
% lst=table2array(actual_condition);
% y=lst(7,1);
% lst

% data=readtable("results_extra_hammouche_glcm.xlsx");
% [conf,b,c]=SVM_GLCM(data,0.9);
% disp(conf)
% disp(b)
% disp(c)
% fig = uifigure;
% message = {'Fire hazard!','Consider reducing temperature.'};
% uialert(fig,message,'Warning','Icon','warning');

outputTable=hammoucheLESH(path,csvFile);
[con_matric,noClasses,accuracy]=SVM_LESH(outputTable,0.9);