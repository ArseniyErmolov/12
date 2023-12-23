# isborder = stop_condition()
function shuttle!(stop_condition::Function, robot, side)
    k = 1
    side2 = (side == Nord) ? West : Nord 
    while stop_condition(r, side)
        for i in 1:k
            move!(robot, Ost)
        end
        if stop_condition(r, side)
            for i in 1:(k + 1)
                move!(robot, side2)
            end
        end
        k += 2
    end
end
