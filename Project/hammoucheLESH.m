function [finalTable] = hammoucheLESH(data,tableOfActualCon)
    %use absolute path to indicate file location
    breastImds=imageDatastore(data);
    %reading the data of actual condition 
    condition=tableOfActualCon(:,2);
    condition=table2array(condition);
    final = [];
    j = 1;

    %loop through the images
    while(hasdata(breastImds))
        I = read(breastImds);
        img_seg = segmenta(I);
        [lesh] = calc_LESH(img_seg);
        lesh = num2cell(lesh);
        newRow = [lesh condition(j,1)];
        adding = [final;newRow];
        final = adding;
        j = j+1;
    end

    Table = table(final);
    filename = 'results_hammouche_lesh.xlsx';
    writetable(Table,filename,'Sheet',1,'Range','A1');
    finalTable = readtable(filename);
    finalTable.Properties.VariableNames{width(finalTable)} = 'Actual Condition';
    writetable(finalTable,filename,'Sheet',1,'Range','A1');

end
