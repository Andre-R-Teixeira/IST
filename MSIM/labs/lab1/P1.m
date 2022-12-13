%  Matlab arrays start in one index, so you need to performa shift to align
%  with the array given in the exercicse

k12 = 0.3 * 3600; 
k21 = 0.2455 * 3600; 
k10 = 0.0643 *3600;
V1 = 3110; 
v2 = 3100; 
delta = 1000; 
sampling = 1; % in days

% setting of initial condition 
c1(1) = 0;
c2(1) = 0;

d = upsample(zeros(1, 100) + 3, 6); 

numberOfDays =  d.size();

coeficientMatrix1 = [-1/V1 * (k12 + k10), 1/v1(k21); 1/V2k12, -1/V2 * K21]; 
coeficientMatrix2 = [1/V1; 0];

constEquation = coeficientMatrix2 * delta;

for ii=1,numberOfDays
    
end 


