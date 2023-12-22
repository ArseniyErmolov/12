function result!(robot):Nothing
    a = 0
    putmarker!(robot)
    while !isborder(robot, Nord)
        move!(robot, Nord)
        putmarker!(robot)
        a -= 1
    end
    while !isborder(robot, Sud)
        move!(robot, Sud)
        putmarker!(robot)
        a += 1
    end
    while a > 0
        move!(robot, Nord)
        a -= 1
    end
    while !isborder(robot, West)
        move!(robot, West)
        putmarker!(robot)
        a -= 1
    end
    while !isborder(robot, Ost)
        move!(robot, Ost)
        putmarker!(robot)
        a += 1
    end
    while a > 0
        move!(robot, West)
        a -= 1
    end
end
