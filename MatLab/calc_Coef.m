
function [K_0, K_1, K_2] = calc_Coef(P, rect)
    Z = @(x, y) P(3,1)*x+P(3,2)*y+P(3,3);
    r = rect.U * [rect.x_min; rect.y_min];
    if Z(r(1), r(2)) < 0
        P = -P;
    end
    P = P * [rect.U [0; 0]; 0 0 1];
    [F_0, F_1, F_2] = calc_F(P);
    [K_0, K_1, K_2] = calc_K(F_0, F_1, F_2, rect);
    U66 = U2U66(rect.U);
%     K_1
%     K_2
%     a = calc_Paraboloid_min(K_1, K_2)
    
    K_1 = K_1 * U66';
%     K_2 = U66' * K_2 * U66;
    
%     K_1
%     K_2
%     a = calc_Paraboloid_min(K_1, K_2)
end
