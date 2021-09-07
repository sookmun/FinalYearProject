function Fit = fun_custo(x, Caa, niv,im)

% x=[1 1 1 0 1 1 1 0 1 1 1 1 1 1 1 1];
% im=imread('e:\images\lena256.bmp');

%%global Caa;
%%global niv;
N = size(Caa);
%%global im;
[H L]=size(im);
Npixels=H*L;

%% Class Probability
t(1)=1;
z=2;
%%%%%%%%%%%%%%%%%% Doubt of X //i think it's divisible not doubt
for i=2:N(1)
    if (x(i) == 0) 
        t(z) = i;
        z=z+1;
    end
end
Fit=0;
if z>2
t(length(t)+1)=N(1)+1;
W = 0;
k = length(t)-1;
for i=1:k
    media = 0;
    Ntotal= 0;
    for j=t(i):(t(i+1)-1)
        media = media + j*Caa(j); 
        Ntotal= Ntotal + Caa(j);
    end
    if Ntotal>0
      for j=t(i):(t(i+1)-1)
        W = W + ((j-media/Ntotal)^2)*Caa(j);
      end 
    end  
end
W=sqrt(W/Npixels);
Fit = (0.5*2^niv)*W+(log2(k))^2;
end %if


