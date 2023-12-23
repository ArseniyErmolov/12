function result(robot):nothing
    k = 1
    while !ismarker(robot)
        for i in 1:k
            if ismarker(robot)
                break
            end
            move!(robot, Nord)
        end
        for i in 1:k
            if ismarker(robot)
                break
            end
            move!(robot, Ost)
        end
        for i in 1:(k + 1)
            if ismarker(robot)
                break
            end
            move!(robot, Sud)
        end
        for i in 1:(k + 1)
            if ismarker(robot)
                break
            end
            move!(robot, West)
        end
        k += 2
    end
end
