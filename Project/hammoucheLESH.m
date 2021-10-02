function hammoucheLESH(data)
    %use absolute path to indicate file location
    breastImds=imageDatastore(data);

    %add more condition 
    condition = ['B';'B';'N';'N';'B';'B';'N';'N';'N';'N';'B';'N';'B';'B';'N';'B';...
        'N';'B';'N';'B';'N';'B';'N';'M';'N';'B';'N';'N';'M';'N';'B';'N';'B';'N';...
        'N';'N';'N';'N';'N';'N';'N';'N';'N';'N';'N';'N';'N';'N';'N';'N';'N';'N';...
        'N';'N';'N';'N';'N';'N';'M';'B';'N';'N';'N';'B';'N';'N';'N';'N';'N';'B';...
        'N';'N';'M';'N';'N';'M';'N';'N';'N';'N';'B';'B';'N';'B';'N';'N';'N';'N';...
        'N';'N';'M';'B';'M';'N';'N';'M';'N';'B';'N';'B';'N';'N';'M';'N';'B';'M';...
        'N';'B';'N';'N';'M';'M';'N';'N';'N';'M';'N';'M';'N';'N';'M';'B';'N';'N';...
        'M';'M';'B';'B';'N';'N';'M';'N';'B';'B';'N';'M';'N';'N';'N';'N';'N';'N';...
        'M';'B';'N';'B';'M';'B';'N';'N';'M';'N';'B';'N';'B';'N';'N';'M';'N';'N';...
        'M';'N';'B';'N';'N';'B';'N';'B';'N';'B';'N';'N';'M';'M';'N';'N';'N';'B';...
        'N';'N';'M';'M';'N';'M';'N';'N';'M';'N';'M';'N';'B';'N';'B';'B';'N';'B';...
        'N';'B';'N';'N';'B';'B';'N';'N';'M';'N';'B';'N';'M';'B';'N';'M';'N';'M';...
        'B';'M';'B';'N';'M';'N';'B';'B';'N';'N';'B';'B';'B';'N';'N';'B';'B';'B';...
        'B';'N';'N';'N';'M';'N';'M';'N';'N';'B';'N';'M';'M';'M';'B';'M';'N';'N';...
        'B';'M';'N';'N';'B';'M';'M';'N';'N';'B';'M';'N';'N';'M';'N';'N';'N';'N';...
        'N';'N';'N';'M';'M';'N';'M';'N';'N';'M';'M';'N';'N';'M';'N';'N';'N';'N';...
        'N';'N';'N';'N';'N';'N';'N';'N';'N';'N';'N';'B';'N';'N';'N';'N';'N';'N';...
        'N';'N';'N';'N';'N';'N';'N';'N';'N';'N';'N';'N';'N';'N';'N';'B';'N';'B';...
        'B';'N';'N';'N';'N';'N';'N';'N'];
    
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