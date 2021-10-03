function [finalTable] = regionGrowingLESH(data,tableOfActualCon)
    breastImds=imageDatastore(data);
    %reading the data of actual condition 
    condition=tableOfActualCon(:,2);
    condition=table2array(condition);
    final = [];
    j = 1;

    %loop through the images
    while(hasdata(breastImds))
        I = read(breastImds);
        I = im2gray(I);

        I = double(I);
        Seeds = [180];
        SI = I == Seeds;
        T = 30;
        TI = false(size(I));

        for i = 1:length(Seeds)
            seed_val = Seeds(i);
            S = abs(I-seed_val) <= T;
            TI = TI | S;
        end

        IM = imreconstruct(SI,TI);


        [lesh] = calc_LESH(IM);
        lesh = num2cell(lesh);
        newRow = [lesh condition(j,1)];
        adding = [final;newRow];
        final = adding;
        j = j+1;
    end

    Table = table(final);
    filename = 'results_extra_rgrowing_lesh.xlsx';
    writetable(Table,filename,'Sheet',1,'Range','A1');
    finalTable = readtable(filename);
    finalTable.Properties.VariableNames{width(finalTable)} = 'Actual Condition';
    disp(finalTable)
    writetable(finalTable,filename,'Sheet',1,'Range','A1');
end
