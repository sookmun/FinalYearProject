function output = regionGrowingFun(input)
    assert(( ndims(input) == 3 && size(input,3) == 3 ), "Error: input must be 3D image");
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
end