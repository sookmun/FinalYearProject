function output = regionGrowingFun(input)
    try
        I = im2gray(input);
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

        output = imreconstruct(SI,TI);
    
    catch ME
        error('Error in regionGrowing');
    end
end