
function H = calc_Homography(x, X)
    A = [];
    b = [];
    for i = 1:4
        A = [A; ...
            x(1,i), x(2,i), 1, 0, 0, 0, -x(1,i)*X(1,i), -x(2,i)*X(1,i); ...
            0, 0, 0, x(1,i), x(2,i), 1, -x(1,i)*X(2,i), -x(2,i)*X(2,i)];
        b = [b; X(1,i); X(2,i)];
    end
    h = A^(-1)*b;
    H = [h(1), h(2), h(3); h(4), h(5), h(6); h(7), h(8), 1];
end

