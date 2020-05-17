
% verification

clc;
clear;

A = randn(2, 3);
P = randn(3, 3);
rect.x_min = randn(1,1);
rect.y_min = randn(1,1);
rect.x_max = rect.x_min + rand(1,1);
rect.y_max = rect.y_min + rand(1,1);
alpha = 2*pi*rand(1,1);
rect.U = [cos(alpha), -sin(alpha); sin(alpha), cos(alpha)];

if isLossEqualInf(P, rect)
    L_2_loss_analytical = Inf;
else
    [K_0, K_1, K_2] = calc_Coef(P, rect);
    a = m2v(A);
    L_2_loss_analytical = calc_L_2_loss(a, K_0, K_1, K_2);
end
L_2_loss_analytical
    
%%

P1 = @(x,y) (P(1,1)*x+P(1,2)*y+P(1,3)) ./ (P(3,1)*x+P(3,2)*y+P(3,3));
P2 = @(x,y) (P(2,1)*x+P(2,2)*y+P(2,3)) ./ (P(3,1)*x+P(3,2)*y+P(3,3));
loss = @(x,y) sum(([x;y] - A * [P1(x,y); P2(x,y); ones(size(P1(x,y)))]).^2);
N = 10000;
X = rect.x_min + (rect.x_max-rect.x_min) * rand(1, N);
Y = rect.y_min + (rect.y_max-rect.y_min) * rand(1, N);
R = rect.U * [X; Y];
area = (rect.x_max-rect.x_min) * (rect.y_max-rect.y_min);
L_2_loss_numerical = area * mean(loss(R(1, :),R(2, :)));
L_2_loss_numerical

%%

% K_0
% K_1
% K_2
% K_0 = zeros(1, 1);
% K_1 = zeros(1, 6);
% K_2 = zeros(6, 6);
% for i = 1:N
%     r = R(:,i);
%     Q = @(x,y) [P1(x,y) P2(x,y) 1 0 0 0; 0 0 0 P1(x,y) P2(x,y) 1];
%     K_0 = K_0 + r' * r;   
%     K_1 = K_1 + r' * Q(r(1),r(2));   
%     K_2 = K_2 + Q(r(1),r(2))' * Q(r(1),r(2));   
% end
% K_0 = area * K_0 / N
% K_1 = area * K_1 / N
% K_2 = area * K_2 / N
