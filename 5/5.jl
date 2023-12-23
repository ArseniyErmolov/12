function flex(robot, d1, d2, d3, d4):Nothing
    while (!isborder(robot, d1) || !ismarker(robot))
        domark(robot)
        while !isborder(robot, d3)
            move!(robot, d3)
            domark(robot)
        end
        if !isborder(robot, d1)
            move!(robot, d1)
            domark(robot)
        end
        while !isborder(robot, d4)
            move!(robot, d4)
            domark(robot)
        end
        if !isborder(robot, d1)
            move!(robot, d1)
            domark(robot)
        end
    end
end

function along(robot, dir):nothing
    while !isborder(robot, dir)
        move!(robot, dir)
        domark(robot)
    end
end

function startpos(robot, d1, d2, d3, d4):nothing
    along(robot, d1)
    along(robot, d2)
    along(robot, d1)
    along(robot, d2)
    along(robot, d3)
    along(robot, d4)
    along(robot, d1)
    along(robot, d2)
    along(robot, d1)
    along(robot, d2)
end

function domark(robot):nothing
    if (isborder(robot, Ost) || isborder(robot, Sud) || isborder(robot, West) || isborder(robot, Nord))
        putmarker!(robot)
    end
end

function result(robot):nothing
    startpos(robot, Nord, West, Sud, Ost)
    flex(robot, Ost, West, Nord, Sud)

    startpos(robot, Nord, Ost, Sud, West)
    flex(robot, West, Ost, Sud, Nord)
    
    startpos(robot, Sud, Ost, Nord, West)
    flex(robot, Nord, Sud, Ost, West)
    
    startpos(robot, Sud, West, Nord, Ost)
    flex(robot, Sud, Nord, West, Ost)
end
