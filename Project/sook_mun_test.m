[file,path] = uigetfile({'*.xls';'*.xlsx';'*.csv';});

File = fullfile(path, file);
hi = readtable(File);
actual_condition=hi(:,2);
% lst=[actual_condition];
lst=table2array(actual_condition);
y=lst(7,1);
lst