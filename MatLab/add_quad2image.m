
function img = add_quad2image(img, x, c, t)

%     plot([coords(1, 1) coords(1, 2)], [coords(2, 1) coords(2, 2)], 'Color', color, 'LineWidth', linewidth);
%     plot([coords(1, 2) coords(1, 3)], [coords(2, 2) coords(2, 3)], 'Color', color, 'LineWidth', linewidth);
%     plot([coords(1, 3) coords(1, 4)], [coords(2, 3) coords(2, 4)], 'Color', color, 'LineWidth', linewidth);
%     plot([coords(1, 4) coords(1, 1)], [coords(2, 4) coords(2, 1)], 'Color', color, 'LineWidth', linewidth);

    img = add_line2image(img, [x(1, 1), x(1, 2); x(2, 1), x(2, 2)], c, t);
    img = add_line2image(img, [x(1, 2), x(1, 3); x(2, 2), x(2, 3)], c, t);
    img = add_line2image(img, [x(1, 3), x(1, 4); x(2, 3), x(2, 4)], c, t);
    img = add_line2image(img, [x(1, 4), x(1, 1); x(2, 4), x(2, 1)], c, t);

end

