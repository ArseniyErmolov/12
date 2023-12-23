function sum_vec(v::AbstractVector{T}, s::T = 0) where T
    if length(v) == 0 
        return s
    end 
    return sum_vec(@view(v[1:end-1]), s + v[end])
end
