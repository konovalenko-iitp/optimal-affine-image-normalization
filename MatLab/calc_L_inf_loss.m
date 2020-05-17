
function L_inf_loss = calc_L_inf_loss(A, P, rect)
    if isLossEqualInf(P, rect)
        L_inf_loss = +Inf;
    else
        V = A*P;
        rect_tops = [rect.x_min rect.x_max rect.x_max rect.x_min; ...
                     rect.y_min rect.y_min rect.y_max rect.y_max];
        R = rect_tops;
        R = [R segment_stationarity(V, rect_tops(:, 1:2))];
        R = [R segment_stationarity(V, rect_tops(:, 2:3))];
        R = [R segment_stationarity(V, rect_tops(:, 3:4))];
        R = [R segment_stationarity(V, [rect_tops(:, 4) rect_tops(:, 1)])];
        d = get_d(V, R);
        L_inf_loss = max(d);
    end
end

