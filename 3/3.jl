function result!(robot):Nothing
    a = 0
    b = 0
    while !isborder(robot, Nord)
        move!(robot, Nord)
        a += 1
    end
    while !isborder(robot, West)
        move!(robot, West)
        b += 1
    end
    while (!isborder(robot, Sud) || !ismarker(robot))
        putmarker!(robot)
        while !isborder(robot, Ost)
            move!(robot, Ost)
            putmarker!(robot)
        end
        while !isborder(robot, West)
            move!(robot, West)
            putmarker!(robot)
        end
        if !isborder(robot, Sud)
            move!(robot, Sud)
        end
    end
    while !isborder(robot, Nord)
        move!(robot, Nord)
    end
    while a > 0
        move!(robot, Sud)
        a -= 1
    end
    while b > 0
        move!(robot, Ost)
        b -= 1
    end
end
