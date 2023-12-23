Sides = (Nord, Ost, Sud, West)

function along!(stop_condition::Function, robot, id, k)
    for i in 1:k
        if stop_condition(robot) return end
        if isborder(robot, Sides[id])
            cnt = 0
            while isborder(robot, Sides[id])
                move!(robot, Sides[(id + 2) % 4 + 1])
                cnt += 1
            end
            move!(robot, Sides[id])
            while cnt > 0
                move!(robot, Sides[id % 4 + 1])
                cnt -= 1
            end
        else 
            move!(robot, Sides[id])
        end
    end
end

function spiral!(stop_condition::Function, robot)
    k = 1
    while !stop_condition(robot)
        along!(stop_condition, robot, 1, k)
        along!(stop_condition, robot, 2, k)
        along!(stop_condition, robot, 3, k + 1)
        along!(stop_condition, robot, 4, k + 1)
        k += 2
    end
end
