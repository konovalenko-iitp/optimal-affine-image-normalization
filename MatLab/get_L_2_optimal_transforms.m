
function L_2_optimal_transforms = get_L_2_optimal_transforms(H, rect, isVerticesOnly)
    if nargin < 3
        isVerticesOnly = false;
    end
    P = H^(-1);
    if isLossEqualInf(P, rect)
        errordlg('Loss anyway is equal to infinitive','Break');
    else
        if isVerticesOnly
            [K_0, K_1, K_2] = calc_Coef_VerticesOnly(P, rect);
        else
            [K_0, K_1, K_2] = calc_Coef(P, rect);
        end
        transform_families = { ...
            'shift', ...
            'shift_scale_by_x', ...
            'shift_scale_by_y', ...
            'shift_isotropic_scale', ...
            'shift_anisotropic_scale', ...
            'full_affine' ...
            };
        num_families = size(transform_families, 2);
        L_2_optimal_transforms = cell(1,num_families);
        for family = 1:num_families
            S = apply_transform_family(transform_families{family});
            [K_sub_1, K_sub_2] = sub_affine(K_1, K_2, S);
            a = calc_Paraboloid_min(K_sub_1, K_sub_2);
            a = S * [a; 1];
            L_2_opt_transf.transform_family = transform_families{family};
            A = v2m(a);
            L_2_opt_transf.A = A;
            L_2_opt_transf.L_2_loss = calc_L_2_loss(a, K_0, K_1, K_2);
            L_2_opt_transf.L_inf_loss = calc_L_inf_loss([A; 0 0 1], P, rect);
            L_2_optimal_transforms{family} = L_2_opt_transf;
        end
    end
end

