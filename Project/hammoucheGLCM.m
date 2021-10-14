%Image segmentation using region growing

function [finalTable] = hammoucheGLCM(data,tableOfActualCon)
    try
        breastImds=imageDatastore(data);
    catch ME
        error('Unable to read image in folder');
    end

    %reading the data of actual condition 
    try
        [~,n] = size(tableOfActualCon);
        assert(n==2,'Invalid number of row');
        condition=tableOfActualCon(:,2);
        condition=table2array(condition);
    catch
        error('Unable to read csv file');
    end
    
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