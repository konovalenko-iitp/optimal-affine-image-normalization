
function [K_sub_1, K_sub_2] = sub_affine(K_1, K_2, S)
    K_1 =      K_1 * S;
    K_2 = S' * K_2 * S;
    d = size(S, 2) - 1;
    I = [eye(d, d); zeros(1, d)];
    i = [zeros(d, 1); 1];
    K_sub_1 = (K_1 - i'*K_2) * I;
    K_sub_2 = I' * K_2 * I;
%     K_sub_1 = K_1(1:(end-1)) - (K_2(end, 1:(end-1))+(K_2(1:(end-1), end))') / 2;
%     K_sub_2 = K_2(1:(end-1), 1:(end-1));
end

