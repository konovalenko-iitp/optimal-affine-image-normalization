
function bool = isLossEqualInf(P, rect)
    vertices = [ ...
        rect.x_min rect.x_min rect.x_max rect.x_max; ...
        rect.y_min rect.y_max rect.y_min rect.y_max];
    vertices = rect.U * vertices;
    Z = @(x,y) P(3, :) * [x; y; ones(size(x))];
    bool = (abs(sum(sign(Z(vertices(1, :), vertices(2, :))))) ~= 4);
end

