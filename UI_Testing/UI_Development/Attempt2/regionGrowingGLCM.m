function regionGrowingGLCM(breastImds)
breastImds=imageDatastore(breastImds);

%add more condition 
condition = ['B';'B';'N';'N';'B';'N';'N';'N';'N';'B';'N';'B';'B';...
    'N';'B';'N';'B';'N';'B';'N'; 'B' ;'N'; 'M'; 'N' ;'B';'N';'N';...
     'N'; 'B' ; 'N';'B' ;'N';'N';'N';'N';'N'; 'N';'N'; 'N';'N'; ...
     'M';'M' ;'M' ; 'B' ;'M';'M' ;'M' ; 'M';'M';'M';];
final = [];
j = 1;

%loop through the images
while(hasdata(breastImds))
    I = read(breastImds);
    
    IM=RegionGrowing(I);
    
    [GLCM, SI] = graycomatrix(IM,'Offset',[1 1],'NumLevels',2,'GrayLimits',[],'Symmetric', true);
    stats = graycoprops(GLCM,'all');
    %disp(GLCM);
    %disp(stats);
    cell = struct2cell(stats);
    flipCell = transpose(cell);
    rowToAdd = [flipCell condition(j,1)];
    adding = [final;rowToAdd];
    final = adding;
    j = j+1;
end

Table = table(final);
filename = 'results_extra.xlsx';
writetable(Table,filename,'Sheet',1,'Range','B3');
finalTable = readtable(filename);
finalTable.Properties.VariableNames{'final_1'} = 'Contrast';
finalTable.Properties.VariableNames{'final_2'} = 'Correlation';
finalTable.Properties.VariableNames{'final_3'} = 'Energy';
finalTable.Properties.VariableNames{'final_4'} = 'Homogeneity';
finalTable.Properties.VariableNames{'final_5'} = 'Actual Condition';
writetable(finalTable,filename,'Sheet',1,'Range','B3');
end

