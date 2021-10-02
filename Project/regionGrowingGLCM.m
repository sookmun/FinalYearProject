function [finalTable] = regionGrowingGLCM(data,tableOfActualCon)
    breastImds=imageDatastore(data);

    %add more condition 
%     condition = ['B';'B';'N';'N';'B';'B';'N';'N';'N';'N';'B';'N';'B';'B';'N';'B';
%         'N';'B';'N';'B';'N';'B';'N';'M';'N';'B';'N';'N';'M';'N';'B';'N';'B';'N';
%         'N';'N';'N';'N';'N';'N';'N';'N';'N';'N';'N';'N';'N';'N';'N';'N';'N';'N';
%         'N';'N';'N';'N';'N';'N';'M';'B';'N';'N';'N';'B';'N';'N';'N';'N';'N';'B';
%         'N';'N';'M';'N';'N';'M';'N';'N';'N';'N';'B';'B';'N';'B';'N';'N';'N';'N';
%         'N';'N';'M';'B';'M';'N';'N';'M';'N';'B';'N';'B';'N';'N';'M';'N';'B';'M';
%         'N';'B';'N';'N';'M';'M';'N';'N';'N';'M';'N';'M';'N';'N';'M';'B';'N';'N';
%         'M';'M';'B';'B';'N';'N';'M';'N';'B';'B';'N';'M';'N';'N';'N';'N';'N';'N';
%         'M';'B';'N';'B';'M';'B';'N';'N';'M';'N';'B';'N';'B';'N';'N';'M';'N';'N';
%         'M';'N';'B';'N';'N';'B';'N';'B';'N';'B';'N';'N';'M';'M';'N';'N';'N';'B';
%         'N';'N';'M';'M';'N';'M';'N';'N';'M';'N';'M';'N';'B';'N';'B';'B';'N';'B';
%         'N';'B';'N';'N';'B';'B';'N';'N';'M';'N';'B';'N';'M';'B';'N';'M';'N';'M';
%         'B';'M';'B';'N';'M';'N';'B';'B';'N';'N';'B';'B';'B';'N';'N';'B';'B';'B';
%         'B';'N';'N';'N';'M';'N';'M';'N';'N';'B';'N';'M';'M';'M';'B';'M';'N';'N';
%         'B';'M';'N';'N';'B';'M';'M';'N';'N';'B';'M';'N';'N';'M';'N';'N';'N';'N';
%         'N';'N';'N';'M';'M';'N';'M';'N';'N';'M';'M';'N';'N';'M';'N';'N';'N';'N';
%         'N';'N';'N';'N';'N';'N';'N';'N';'N';'N';'N';'B';'N';'N';'N';'N';'N';'N';
%         'N';'N';'N';'N';'N';'N';'N';'N';'N';'N';'N';'N';'N';'N';'N';'B';'N';'B';
%         'B';'N';'N';'N';'N';'N';'N';'N'];
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


        [GLCM, SI] = graycomatrix(IM,'Offset',[1 1],'NumLevels',2,'GrayLimits',[],'Symmetric', true);
        stats = graycoprops(GLCM,'all');
        cell = struct2cell(stats);
        flipCell = transpose(cell);
        rowToAdd = [flipCell condition(j,1)];
        adding = [final;rowToAdd];
        final = adding;
        j = j+1;
    end

    Table = table(final);
    filename = 'results_extra_rgrowing_glcm.xlsx';
    writetable(Table,filename,'Sheet',1,'Range','A1');
    finalTable = readtable(filename);
    finalTable.Properties.VariableNames{'final_1'} = 'Contrast';
    finalTable.Properties.VariableNames{'final_2'} = 'Correlation';
    finalTable.Properties.VariableNames{'final_3'} = 'Energy';
    finalTable.Properties.VariableNames{'final_4'} = 'Homogeneity';
    finalTable.Properties.VariableNames{'final_5'} = 'Actual Condition';
    disp(finalTable);
    writetable(finalTable,filename,'Sheet',1,'Range','A1');
    

end
