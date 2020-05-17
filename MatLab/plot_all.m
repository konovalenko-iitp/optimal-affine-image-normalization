
% clc;
% clear;
% 
% P = randn(3, 3);
% P = P + 10*eye(3, 3);

% e = 1;

function plot_all(V, R)

    P = V;

    % P = P ./ P(3, 3);
    % P(2, :) = 0;
    % P(:, 2) = 0;
    % P(2, 2) = P(1, 1);
    % P(2, 3) = P(1, 3);
    % P(3, 2) = P(3, 1);
    % P
    % alpha = -0.2;
    % P = [cos(alpha) -sin(alpha) 0; sin(alpha) cos(alpha) 0; 0.1 0.2 1];

    % P = [4  -1   -1; ...
    %      -1  4   -1; ...
    %      0.2  0.2 0];
    
    miX = min(R(1, :));
    maX = max(R(1, :));
    miY = min(R(2, :));
    maY = max(R(2, :));

    [X, Y] = meshgrid(miX:3:maX,miY:3:maY);
    Z = zeros(size(X));
    for i = 1:size(X, 1)
        for j = 1:size(Y, 2)
            x = X(i, j);
            y = Y(i, j);
            z = P*[x; y; 1];
            z = z./z(3) - [x; y; 1];
    %         z(2) = 0;
            Z(i, j) = z'*z;
    %         Z(i, j) = 4*x.^2 - y.^2;
        end
    end
    Z = sqrt(Z);
    ThH = 1 + max(max(Z));
%     Z = Z - max(max(Z)) - 1;
%     Z = Z.^(1/4);
%     Z = min(100, Z);
%     contourf(X, Y, Z);
    % contourf(X, Y, Z.^(1/4));
    % mesh(X, Y, Z-100);
%     Z(1, 1) = min(min(Z))-0.0*(max(max(Z))-min(min(Z)));
    surf(X, Y, Z.^(1/2),'EdgeColor','none');
%     colormap hot;
%     colormap default;
%     colormap jet;
    colormap gray;
%     colorbar;
    % axis equal;
%     dfx = @(x,y) 2*((P(1,1)*x + P(1,2)*y + P(1,3)) ./ (P(3,1)*x + P(3,2)*y + P(3,3)) - x) ...
%         .* ((P(1,1)*(P(3,1)*x + P(3,2)*y + P(3,3)) - P(3,1)*(P(1,1)*x + P(1,2)*y + P(1,3)))./((P(3,1)*x + P(3,2)*y + P(3,3)).^2) - 1) ...
%         + 2*((P(2,1)*x + P(2,2)*y + P(2,3)) ./ (P(3,1)*x + P(3,2)*y + P(3,3)) - y) ...
%         .* ((P(2,1)*(P(3,1)*x + P(3,2)*y + P(3,3)) - P(3,1)*(P(2,1)*x + P(2,2)*y + P(2,3)))./((P(3,1)*x + P(3,2)*y + P(3,3)).^2));
%     fimplicit3(dfx, 'LineWidth', 5, 'EdgeColor', 'y');
    
%     dfy = @(x,y) 2*((P(1,1)*x + P(1,2)*y + P(1,3)) ./ (P(3,1)*x + P(3,2)*y + P(3,3)) - x) ...
%         .* ((P(1,2)*(P(3,1)*x + P(3,2)*y + P(3,3)) - P(3,2)*(P(1,1)*x + P(1,2)*y + P(1,3)))./((P(3,1)*x + P(3,2)*y + P(3,3)).^2)) ...
%         + 2*((P(2,1)*x + P(2,2)*y + P(2,3)) ./ (P(3,1)*x + P(3,2)*y + P(3,3)) - y) ...
%         .* ((P(2,2)*(P(3,1)*x + P(3,2)*y + P(3,3)) - P(3,2)*(P(2,1)*x + P(2,2)*y + P(2,3)))./((P(3,1)*x + P(3,2)*y + P(3,3)).^2) - 1);
%     fimplicit3(dfy, 'LineWidth', 5, 'EdgeColor', 'r');

%     fimplicit(@(x, y) P(1, :) * [x; y; 1], 'LineWidth', 2);
%     fimplicit(@(x, y) P(2, :) * [x; y; 1], 'LineWidth', 2);
%     fimplicit(@(x, y) P(3, :) * [x; y; 1], 'LineWidth', 4);

%     w = 30000*(-500:1:500);
%     P = P / P(3, 3);
%     ZN = (P(3, 1)^2 + P(3, 2)^2).*w + 1;
%     c11 = P(1, 1) * P(3, 2) - P(1, 2) * P(3, 1);
%     c12 = P(1, 1) * P(3, 1) + P(1, 2) * P(3, 2);
%     c21 = P(2, 1) * P(3, 2) - P(2, 2) * P(3, 1);
%     c22 = P(2, 1) * P(3, 1) + P(2, 2) * P(3, 2);
%     k1 = c11./ZN - P(3, 2);
%     k2 = c21./ZN + P(3, 1);
%     A = k1.^2 + k2.^2;
%     B = - (k1 .* ((c12*w+P(1, 3))./ZN-P(3, 1)*w) + k2 .* ((c22*w+P(2, 3))./ZN-P(3, 2)*w));
%     z = B./A;
%     Po = [P(3, 2), P(3, 1); -P(3, 1), P(3, 2)]*[z; w];
%     plot3(Po(1, :), Po(2, :), ThH*ones(size(Po(1, :))), 'black', 'MarkerSize', 10, 'LineWidth', 3);
%     plot3(Po(1, :), Po(2, :), ThH*ones(size(Po)));
    
    [X, Y] = meshgrid(miX:(maX-miX)/24:maX,miY:(maY-miY)/16:maY);
%     X(2:end-1, 2:end-1) = miX;
%     Y(2:end-1, 2:end-1) = miY;
    U = zeros(size(X));
    V = zeros(size(X));
    for i = 1:size(X, 1)
        for j = 1:size(Y, 2)
            x = X(i, j);
            y = Y(i, j);
            z = P*[x; y; 1];
            z = z./z(3);
            U(i, j) = z(1);
            V(i, j) = z(2);
            U(i, j) = U(i, j) - x;
            V(i, j) = V(i, j) - y;
        end
    end
    scale = 0;
    % figure(1);
    % hold on;
    % L = sqrt(U.^2 + V.^2);
    % U = U ./ L;
    % V = V ./ L;
    % quiver(X,Y,U,V,'black');
    quiver3(X,Y,ThH*ones(size(X)),U,V,zeros(size(X)),scale,'black');
    a = [miX; miY; 1];
    b = [maX; miY; 1];
    c = [maX; maY; 1];
    d = [miX; maY; 1];
    plot3([a(1) b(1)], [a(2), b(2)], [ThH, ThH], 'black', 'linewidth', 1);
    plot3([b(1) c(1)], [b(2), c(2)], [ThH, ThH], 'black', 'linewidth', 1);
    plot3([c(1) d(1)], [c(2), d(2)], [ThH, ThH], 'black', 'linewidth', 1);
    plot3([d(1) a(1)], [d(2), a(2)], [ThH, ThH], 'black', 'linewidth', 1);
    a = P*a;
    b = P*b;
    c = P*c;
    d = P*d;
    a = a/a(3);
    b = b/b(3);
    c = c/c(3);
    d = d/d(3);
    plot3([a(1) b(1)], [a(2), b(2)], [ThH, ThH], 'black', 'linewidth', 1);
    plot3([b(1) c(1)], [b(2), c(2)], [ThH, ThH], 'black', 'linewidth', 1);
    plot3([c(1) d(1)], [c(2), d(2)], [ThH, ThH], 'black', 'linewidth', 1);
    plot3([d(1) a(1)], [d(2), a(2)], [ThH, ThH], 'black', 'linewidth', 1);
    axis equal;

    % syms a11 a12 a13 a21 a22 a23 a31 a32
    % syms x
    % syms nx ny cx cy
    % 
    % L = (((a11 * (nx * x + cx) + a12 * (ny * x + cy) + a13) / (a31 * (nx * x + cx) + a32 * (ny * x + cy) + 1)) - (nx * x + cx))^2
    % diff(L, x)
    % 
    % dL = 2 * ...
    %     (cx - (a13 + a11*(cx + nx*x) + a12*(cy + ny*x))/(a31*(cx + nx*x) + a32*(cy + ny*x) + 1) + nx*x) * ...
    %     (...
    %         nx ...
    %         - (a11*nx + a12*ny)/(a31*(cx + nx*x) + a32*(cy + ny*x) + 1) ...
    %         + ((a31*nx + a32*ny)*(a13 + a11*(cx + nx*x) + a12*(cy + ny*x))) / (a31*(cx + nx*x) + a32*(cy + ny*x) + 1)^2)

%     xlim([min(R(1, :))-400 max(R(1, :))+400]);
%     ylim([min(R(1, :))-400 max(R(1, :))+400]);
    
end


