
function S = apply_transform_family(transform_family)
    if strcmp(transform_family,'shift')
        S = [0 0 1; 0 0 0; 1 0 0; 0 0 0; 0 0 1; 0 1 0];
    elseif strcmp(transform_family,'shift_scale_by_x')
        S = [1 0 0 0; 0 0 0 0; 0 1 0 0; 0 0 0 0; 0 0 0 1; 0 0 1 0];
    elseif strcmp(transform_family,'shift_scale_by_y')
        S = [0 0 0 1; 0 0 0 0; 0 1 0 0; 0 0 0 0; 1 0 0 0; 0 0 1 0];
    elseif strcmp(transform_family,'shift_isotropic_scale')
        S = [1 0 0 0; 0 0 0 0; 0 1 0 0; 0 0 0 0; 1 0 0 0; 0 0 1 0];
    elseif strcmp(transform_family,'shift_anisotropic_scale')
        S = [1 0 0 0 0; 0 0 0 0 0; 0 0 1 0 0; 0 0 0 0 0; 0 1 0 0 0; 0 0 0 1 0];
    elseif strcmp(transform_family,'full_affine')
        S = [eye(6,6), [0; 0; 0; 0; 0; 0]];
    else
        errordlg('Inappropriate mode','Mode Error');
    end
end