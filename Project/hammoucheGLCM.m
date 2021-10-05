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
        cell = struct2cell(stats);
        flipCell = transpose(cell);
        rowToAdd = [flipCell condition(j,1)];
        adding = [final;rowToAdd];
        final = adding;
        j = j+1;
    end

    Table = cell2table(final);
    Table.Properties.VariableNames = {'Contrast' 'Correlation' 'Energy' 'Homogeneity','Actual Condition'};
    finalTable=Table;
end