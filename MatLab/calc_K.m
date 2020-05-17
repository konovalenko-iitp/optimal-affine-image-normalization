
function [K_0, K_1, K_2] = calc_K(F_0, F_1, F_2, rect)
    if (rect.x_min>=rect.x_max) || (rect.y_min>=rect.y_max)
        error('Rectangle parameterization not valid!');
    end
    n = 6;
    K_2 = zeros(n,n);
    K_1 = zeros(1,n);
    K_0 = F_0(rect.x_min,rect.y_min) ...
        + F_0(rect.x_max,rect.y_max) ...
        - F_0(rect.x_min,rect.y_max) ...
        - F_0(rect.x_max,rect.y_min);
    for i = 1:n
        K_1(i) = F_1{i}(rect.x_min,rect.y_min) ...
               + F_1{i}(rect.x_max,rect.y_max) ...
               - F_1{i}(rect.x_min,rect.y_max) ...
               - F_1{i}(rect.x_max,rect.y_min);
        for j = 1:n
            K_2(i,j) = F_2{i,j}(rect.x_min,rect.y_min) ...
                     + F_2{i,j}(rect.x_max,rect.y_max) ...
                     - F_2{i,j}(rect.x_min,rect.y_max) ...
                     - F_2{i,j}(rect.x_max,rect.y_min);
        end
    end
%     area = (rect.x_max-rect.x_min) * (rect.y_max-rect.y_min);
%     K_0 = K_0 / area;
%     K_1 = K_1 / area;
%     K_2 = K_2 / area;
end

