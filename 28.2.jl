function F_Sequence(n)
    if n < 3 return 1
    else
        return F_Sequence(n - 1) + F_Sequence(n - 2) 
    end
end
