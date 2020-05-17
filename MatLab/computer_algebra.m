
clc;
clear;
close all;

syms p11 p12 p13
syms p21 p22 p23
syms p31 p32 p33
syms x y
P_x = (p11*x + p12*y + p13) / (p31*x + p32*y + p33);
P_y = (p21*x + p22*y + p23) / (p31*x + p32*y + p33);

% int(P_y, x)
% simplify(int(P_y, x))


% (p21*x)/p31 ...
%     - (log(p33 + p31*x + p32*y)*(p21*p33 - p23*p31 + p21*p32*y - p22*p31*y))/p31^2

% int(int(P_x*P_y, x), y)

syms a b c d
f = ( (a*x + b) / (c*x + d) )^2
f = simplify(f)
int(f,x)