using LinearAlgebra

abstract type Abstract3d68PointVentr <: Abstract68PointVentr end

dim_n(::Abstract3d68PointVentr) = 3

_raw_openness(::Abstract3d68PointVentr, points::AbstractArray, ind1, ind2) = sum(_raw_dist.((points,), ind1, ind2))

 