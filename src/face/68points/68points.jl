abstract type Abstract68PointVentr <: AbstractFaceVentr end
 
function ind_compare(::Abstract68PointVentr)
    return collect(Iterators.flatten((28:31, 34, 37, 40:42, 43, 46:48)))
end

function proj_mat(ventr::Abstract68PointVentr, coords::AbstractArray, baseline::AbstractArray)
    Y = coords[comp_ind(ventr)]'
    X = baseline[comp_ind(ventr)]'

    return inv(X'X)X'Y
end

function proj_points(::Abstract68PointVentr, points::AbstractArray, beta_mat::AbstractArray)
    X = points'
    B = beta_mat'

    return X * B
end

function _raw_left_eye_openness(::Abstract68PointVentr, points::AbstractArray)
    # Some 68-point systems struggle with detecting the top of the eye, but
    # many 68-point systems tend to perform well at detecting eyebrow distance
    # from the bottom of the eye even in low lighting conditions, for those
    # with dark eyebrows and light skin. 

    # The eyebrow alongside the top of the eye, so this can be a useful proxy
    # for judging the true state of the eye

    # This approach might be less effective for people with less visible eyebrows

    _raw_openness.((points,), [20, 21], [42, 41])
end

_raw_right_eye_openness(::Abstract68PointVentr, points::AbstractArray) = _raw_openness.((points,), [24, 25], [48, 47])

_raw_mouth_openness(::Abstract68PointVentr, points::AbstractArray) = _raw_openness.((points,), [62, 63, 64], [68, 67, 66])

left_brow_angle(::Abstract68PointVentr, points::AbstractArray, baseline_p::AbstractArray) = _vec_angle(points, 18, 22)

right_brow_angle(::Abstract68PointVentr, points::AbstractArray, baseline_p::AbstractArray) = _vec_angle(points, 23, 27)