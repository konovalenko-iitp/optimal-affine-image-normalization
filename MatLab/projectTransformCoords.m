
function Y = projectTransformCoords(X, H)
    Y = H * [X; ones(1, size(X, 2))];
    for i = 1:size(Y, 2)
        Y(:, i) = Y(:, i) / Y(3, i);
    end
    Y = Y(1:2, :);
end