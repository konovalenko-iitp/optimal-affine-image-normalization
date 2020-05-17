
function d = get_d(V, r)    
    d = sqrt(sum((r - projectTransformCoords(r, V)).^2, 1));
end