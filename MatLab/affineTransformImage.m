
function image_out = affineTransformImage(image_inp, H)
    image_out = image_inp;  
    si = size(image_out, 1);
    sj = size(image_out, 2);
    N = si*sj;
    T = zeros(2, N);
    for i = 1:si
        T(1, (i-1)*sj+1:i*sj) = (1:sj)';
        T(2, (i-1)*sj+1:i*sj) = i;
    end    
    T = fix(affineTransformCoords(T, H));    
    for i = 1:size(image_out, 1)
        for j = 1:size(image_out, 2)
            J = T(1, (i-1)*sj+j);
            I = T(2, (i-1)*sj+j);
            if 1<=I && I<=size(image_inp, 1) && 1<=J && J<=size(image_inp, 2)
                image_out(i, j, :) = image_inp(I, J, :);
            else
                image_out(i, j, :) = 240*[1 1 1];
                if mod(fix((i-si)/50)+fix((j-0)/50), 2) == 0
                    image_out(i, j, :) = 150*[1 1 1];
                end
            end
        end
    end
end