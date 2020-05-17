
function [K_0, K_1, K_2] = calc_Coef_VerticesOnly(P, rect)
    r_vert = ...
        [rect.x_min rect.x_max rect.x_max rect.x_min; ...
         rect.y_min rect.y_min rect.y_max rect.y_max];
    r_vert = rect.U' * r_vert;
    q_vert = projectTransformCoords(r_vert, P);
    n = size(r_vert, 2);
    K_0 = 0;
    K_1 = zeros(1,6);
    K_2 = zeros(6,6);
    for i = 1:n
        r = r_vert(:, i);
        q = q_vert(:, i);
        Q = [q(1) q(2) 1 0 0 0; ...
             0 0 0 q(1) q(2) 1];
        K_0 = K_0 + r'*r;
        K_1 = K_1 + r'*Q;
        K_2 = K_2 + Q'*Q;
    end
%     K_0 = K_0 / n;
%     K_1 = K_1 / n;
%     K_2 = K_2 / n;
end