%_________________________________________________________________________%
%  Whale Optimization Algorithm (WOA) source codes demo 1.0               %
%                                                                         %
%  Developed in MATLAB R2011b(7.13)                                       %
%                                                                         %
%  Author and programmer: Seyedali Mirjalili                              %
%                                                                         %
%         e-Mail: ali.mirjalili@gmail.com                                 %
%                 seyedali.mirjalili@griffithuni.edu.au                   %
%                                                                         %
%       Homepage: http://www.alimirjalili.com                             %
%                                                                         %
%   Main paper: S. Mirjalili, A. Lewis                                    %
%               The Whale Optimization Algorithm,                         %
%               Advances in Engineering Software , in press,              %
%               DOI: http://dx.doi.org/10.1016/j.advengsoft.2016.01.008   %
%                                                                         %
%_________________________________________________________________________%

% This function containts full information and implementations of the benchmark 
% functions in Table 1, Table 2, and Table 3 in the paper

% lb is the lower bound: lb=[lb_1,lb_2,...,lb_d]
% up is the uppper bound: ub=[ub_1,ub_2,...,ub_d]
% dim is the number of variables (dimension of the problem)

function [lb,ub,dim,fobj] = Get_Functions_details(F)

        fobj = @F1;
        lb=-100;
        ub=100;
        dim=1;          

end

% F1

function o = F1(Scaling_Factor)
global  watermark0 ExtractWatermark;
global  m2 n2; 
global  LL_R_S  LL_G_S  LL_B_S;
global  LL_R_S2 LL_G_S2 LL_B_S2;
 
ExtractWatermark_R=(LL_R_S2-LL_R_S)/Scaling_Factor;
ExtractWatermark_G=(LL_G_S2-LL_G_S)/Scaling_Factor;
ExtractWatermark_B=(LL_B_S2-LL_B_S)/Scaling_Factor;
 
ExtractWatermark=cat(3,ExtractWatermark_R,ExtractWatermark_G,ExtractWatermark_B);
ExtractWatermark = double(imresize((ExtractWatermark),[m2,n2]));
x=PSNR(watermark0,ExtractWatermark);
o=100-x;
end
