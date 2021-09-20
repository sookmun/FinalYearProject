function img_seg=segmenta(im,val)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DECLARATION OF GLOBAL VARIABLES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%global im;
%global Caa Cdd;
%global niv;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% REALIZA UM MELHORAMENTO NA IMAGEM
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%im_un=im2double(im);
%im_st=im2uint8(ContrastStretchNorm(adapthisteq(im_un),val));
%im_st=adapthisteq(im);
%b=adapthisteq(im);
%im_st=decorrstretch(b,'Tol',.05);
im_st=im;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% GENERATES HISTORY. OF IMAGE //should be histogram I think
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Ca0 = imhist(im_st);
%x=.0:255;
%y=Ca0;
%plot(x,y);
%axis([0 255 0 12000])
%set(gca, 'xtick', 0:10:255)
%set(gca, 'ytick', 0:1000:11000)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% REDUCES THE SIZE OF HISTO.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[Ca1,Cd1]=dwt(Ca0,'db1');
[Ca2,Cd2]=dwt(Ca1,'db1');
[Ca3,Cd3]=dwt(Ca2,'db1');
[Ca4,Cd4]=dwt(Ca3,'db1');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SELECTS THE DECOMP. LEVEL.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
niv=2;
if niv==0 Caa=Ca0; end;
if niv==1 Caa=Ca1; end;
if niv==2 Caa=Ca2; end;
if niv==3 Caa=Ca3; end;
if niv==4 Caa=Ca4; end;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  CALCULATE THE SIZE OF THE HISTO.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
long=size(Caa);
taille=long(1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% GENETIC ALGORITHM OPTIONS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
options = gaoptimset;
Popsize=round(300/(2^niv));
rand('twister' ,110);
randn('state' ,110);
%Popsize =35;
Mat =double( logical(0.5 > rand(Popsize,taille)));  %initial population
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% REMOVE SEQUENCE FROM ZEROS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:Popsize
        for j=1:taille-1    
          if Mat(i,j)==0
             for k=j+1:taille 
               if Mat(i,k)==0
                 Mat(i,j)=1;
               else break;end;
             end;
          end;
        end;
    end;    
options = gaoptimset(options,'PopulationSize',Popsize);
options = gaoptimset(options,'InitialPopulation',Mat); %define the initial population
options = gaoptimset(options,'Generations',100);
options = gaoptimset(options,'StallGenLimit' ,100);
options = gaoptimset(options,'FitnessScalingFcn',@fitscalingtop);
options = gaoptimset(options,'PopulationType' ,'bitString');
%options = gaoptimset(options,'SelectionFcn' ,@selectionroulette);
options = gaoptimset(options,'SelectionFcn' ,{@selectiontournament 4});
options = gaoptimset(options,'CrossoverFcn' , @crossovertwopoint);
options = gaoptimset(options,'CrossoverFraction',0.9);
options = gaoptimset(options,'MutationFcn' ,{ @mutationgaussian 0.01 });
options = gaoptimset(options,'EliteCount' ,1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PERFORMS THE GENETIC ALGORITHM
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Fitness_Function = @(x) fun_custo(x,Caa,niv,im_st);
[x,fval,reason,output,population,scores] =  ga(Fitness_Function,taille,[],[],[],[],[],[],[],options);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% EXTEND THE THRESHOLD VALUES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ns=1;thr=[];
for i=2:length(x)-1
    if (x(i) == 0)
        thr(ns) = i;
        ns = ns+1;
    end
end
ns = ns - 1;

thr = thr*2^niv;

plot(thr,'-g')
%plot(res(:,5),res(:,6),'-g')
axis([0 255 0 12000])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% REFINES THRESHOLD VALUES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
seuil=cat(2,[1],thr,[length(Ca0)-1]);
retorno=false;
while retorno==false
  seuilavant=seuil;
  m=zeros(1,ns+1);
  n=zeros(1,ns+1);
  for s=1:ns+1
    for j=seuil(s):(seuil(s+1)-1)
        %if j == 0
        %   j; 
        %end
       m(s)=m(s)+j*Ca0(j);
       n(s)=n(s)+Ca0(j);
    end
    if (n(s) ~= 0) 
        m(s)=m(s)/n(s);
    end
  end
  retorno=true;
  for s=2:ns+1
    seuil(s)=round((m(s-1)+m(s))/2);
    if seuil(s) ~= seuilavant(s) 
        retorno=false;
    end
  end    
end  


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% SEGMENTS THE IMAGE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%seuil=cat(2,[1],thr,[length(Ca0)-1])
seuil
for i=2:(length(seuil))
    aux = 0;
    n = 1;
    for j=seuil(i-1):(seuil(i)-1)
        aux = aux + j; % ou N(2)
        n = n+1;
    end
    med(i) = round(aux/n); %#ok<AGROW>
end

for i=1:size(im,1)
    for j=1:size(im,2)
        if (im_st(i,j) < seuil(2))
            im1(i,j) = seuil(1);
        end
        if (im_st(i,j) >= seuil(length(seuil)-1))
            im1(i,j) = seuil(length(seuil));
        end
        if (im_st(i,j) >= seuil(2)) && (im_st(i,j) < seuil(length(seuil)-1))
            for z=2:(length(seuil)-1)
                if (im_st(i,j) >= seuil(z)) && (im_st(i,j) < (seuil(z+1)-1)) 
                    im1(i,j) = med(z);
                end
            end
        end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% RETURN IMAGE COMPLEMENT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
im2=wiener2(im1,[2 2]);
se=strel('disk',2);
img_seg=uint8(imdilate(im2,se));

%img_seg=im1;
%clear global im,Caa;