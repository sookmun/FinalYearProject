function outpic = pre_process(inpic)

I = inpic;

se = strel("disk", 10); bw1= imopen (I, se); outpic= imclose (bw1, se);
% subplot(1,2,1);imshow(bw1);subplot(1,2,2);imshow(bw2);

end

