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
    putmarker!(robot)
    while !isborder(robot, Ost)
        putmarker!(robot)
        move!(robot, Ost)
    end
    while !isborder(robot, Sud)
        putmarker!(robot)
        move!(robot, Sud)
    end
    while !isborder(robot, West)
        putmarker!(robot)
        move!(robot, West)
    end
    while !isborder(robot, Nord)
        putmarker!(robot)
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
