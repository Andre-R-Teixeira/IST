%  Matlab arrays start in one index, so you need to performa shift to align
%  with the array given in the exercicse

K12 = 0.3 * 3600; 
K21 = 0.2455 * 3600; 
K10 = 0.0643 *3600;
V1 = 3110; 
V2 = 3100; 
delta = 1000; 
sampling = 1; % in days

numberOfDays = 120;
% d = upsample(zeros(1, 100) + 3, 6); 
d = upsample(zeros(1,20)+3,6);

d(121) = 0;
c1 = zeros(1, 120);
c2 = zeros(1, 120);
t = zeros (1, 120);


% Declare the figure i will need to use
figure(1)
grid on 
hold on
title('1 dose of 3mg each 6 days'); 
xlabel('time - days');
ylabel('concentrarion - mg');

% setting of initial condition 
c1(1) = 0;
c2(1) = 0;

coeficientMatrix1 = [-1/V1 * (K12 + K10), 1/V1 * K21; 1/V2 * K12, -1/V2 * K21];
coeficientMatrix2 = [1/V1; 0];

for ii = 1:numberOfDays
    t(ii+1) = ii * sampling;
    
    C = coeficientMatrix1 * [c1(ii); c2(ii)]...
        + coeficientMatrix2 * delta * d(ii);
    
    c1(ii+1) = c1(ii) + sampling * C(1);
    c2(ii+1) = c2(ii) + sampling * C(2);
end 

figure(1)
plot(t, c1, 'o-'); 
plot(t, c2, 'o-');
legend('c1', 'c2');