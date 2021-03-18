function homogenize(coords::A)::A where {A <: AbstractArray}
    new_dims = collect(size(coords))
    new_dims[1] += 1
    new_dims_tup = tuple(new_dims...)

    out = reshape(similar(coords, eltype(coords), new_dims_tup), new_dims[1], :)

    out[1:end-1,:] .= reshape(coords, size(coords)[1], :)

    out[end,:] .= 1

    return reshape(out, new_dims_tup)
end

_raw_dist(points::AbstractArray, ind1, ind2) = norm(points[ind1] - points[ind2])

function _vec_angle(points::AbstractArray, ind1, ind2)
    a = points[:,ind1] .- points[:ind2]
    b = baseline_p[:,ind1] .- baseline_p[:,ind2]
    return acosd((a ⋅ b) / (norm(a) * norm(b)))
end