
clc;
clear;
close all;

%%

% a = randn(6,1);
% A = randn(2,3);
% 
% m2v(v2m(a)) - a
% v2m(m2v(A)) - A

%%

% alpha = 2*pi*rand(1,1);
% U = [cos(alpha), -sin(alpha); sin(alpha), cos(alpha)];
% a = randn(6,1);
% % a = [0; 0; 0; 1; 0; 0]
% b = m2v(U*v2m(a));
% U66 = U2U66(U);
% bb = U66 * a;
% bb - b
% % UU
% % UU'*UU
% % UU*UU'

%%

% alpha = 2*pi*rand(1,1);
% U = [cos(alpha), -sin(alpha); sin(alpha), cos(alpha)];
% U66 = U2U66(U);
% 
% Q = randn(2, 6);
% Q(1, 4:6) = 0;
% Q(2, 1:3) = 0;
% Q(2, 4:6) = Q(1, 1:3)
% Q
% U*Q - Q*U66

%%
N = 10^4;
A = 10^6;
t_calc = 1.917 * (A/N)
t_min_affin = 352.081 * (A/N)
t_min_proj = 345.046 * (A/N)

t_openCV_affin = (0*60+59.550190) * (A/N)
t_openCV_proj = (1*60+39.106371) * (A/N)



