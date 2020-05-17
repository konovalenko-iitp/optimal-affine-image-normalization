
function image_out = add_line2image(image_int, coords, color, linewidth)

    image_out = image_int;
    R_1 = [coords(1, 1); coords(2, 1)];
    R_2 = [coords(1, 2); coords(2, 2)];
    
    l = norm(R_2 - R_1);

    for t = 0:1/(2*l):1
        R = (R_2-R_1)*t + R_1;
        x = fix(R(2));
        y = fix(R(1));
        for i = - linewidth:linewidth
            for j = - linewidth:linewidth
                if norm([i; j])<=linewidth
                    image_out(x+i, y+j, :) = color;
                end
            end
        end
    end

end

