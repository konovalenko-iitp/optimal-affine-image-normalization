
function Y = affineTransformCoords(X, H)
    if norm(H(3, 1:2)) > 0
        errordlg('Non-affine matrix! Calculation is incorrect!','Warning');
    end
    Y = H * [X; ones(1, size(X, 2))];
    Y = Y(1:2, :);
end

