function left_eye_openness(ventr::AbstractFaceVentr, points::AbstractArray, baseline_p::AbstractArray)
    _raw_left_eye_openness(ventr, points) / _raw_left_eye_openness(ventr, baseline_p)
end

function right_eye_openness(ventr::AbstractFaceVentr, points::AbstractArray, baseline_p::AbstractArray)
    _right_left_eye_openness(ventr, points) / _right_left_eye_openness(ventr, baseline_p)
end

function mouth_openness(ventr::AbstractFaceVentr, points::AbstractArray, baseline_p::AbstractArray)
    _raw_mouth_openness(ventr, points) / _raw_mouth_openness(ventr, baseline_p)
end