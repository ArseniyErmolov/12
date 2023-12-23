function along!(stop_condition::Function, robot, side, k)
    for i in 1:k
        if stop_condition(robot) return end
        move!(robot, side)
    end
end

function spiral!(stop_condition::Function, robot)
    k = 1
    while !stop_condition(robot)
        along!(stop_condition, robot, Nord, k)
        along!(stop_condition, robot, Ost, k)
        along!(stop_condition, robot, Sud, k + 1)
        along!(stop_condition, robot, West, k + 1)
        k += 2
    end
end
