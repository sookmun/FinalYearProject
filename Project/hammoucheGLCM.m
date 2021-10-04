%Image segmentation using region growing

function [finalTable] = hammoucheGLCM(data,tableOfActualCon)
    breastImds=imageDatastore(data);
    %reading the data of actual condition 
    condition=tableOfActualCon(:,2);
    condition=table2array(condition);
    
    final = [];
    j = 1;

    %loop through the images
    while(hasdata(breastImds))
        I = read(breastImds);
        I=pre_process(I);
        img_seg = segmenta(I);
        [GLCM, SI] = graycomatrix(img_seg,'Offset',[1 1],'NumLevels',2,'GrayLimits',[],'Symmetric', true);
        stats = graycoprops(GLCM,'all');
        % disp(GLCM);
        % disp(stats);
        cell = struct2cell(stats);
        flipCell = transpose(cell);
        rowToAdd = [flipCell condition(j,1)];
        adding = [final;rowToAdd];
        final = adding;
        j = j+1;
    end

    Table = table(final);
    filename = 'results_extra_hammouche_glcm.xlsx';
    writetable(Table,filename,'Sheet',1,'Range','A1');
    finalTable = readtable(filename);
    finalTable.Properties.VariableNames{'final_1'} = 'Contrast';
    finalTable.Properties.VariableNames{'final_2'} = 'Correlation';
    finalTable.Properties.VariableNames{'final_3'} = 'Energy';
    finalTable.Properties.VariableNames{'final_4'} = 'Homogeneity';
    finalTable.Properties.VariableNames{'final_5'} = 'Actual Condition';
    writetable(finalTable,filename,'Sheet',1,'Range','A1');
end