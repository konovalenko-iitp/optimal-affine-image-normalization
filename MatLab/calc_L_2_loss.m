
function L_2_loss = calc_L_2_loss(a, K_0, K_1, K_2)
    L_2_loss = K_0 - 2*K_1*a + a'*K_2*a;
end

