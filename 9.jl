function check(robot, x, y)
    if ((x + y) % 2 == 0)
        putmarker!(robot)
    end
end

function go_back(robot, x, y)
    while x > 0
        move!(robot, West)
        x -= 1
    end
    while y < 0
        move!(robot, Nord)
        y += 1
    end
end

function result(robot)
    x = 0
    y = 0
    while !isborder(robot, West)
        move!(robot, West)
        x -= 1
    end
    while !isborder(robot, Nord)
        move!(robot, Nord)
        y += 1
    end
    
    check(robot, x, y)
    dir = Ost
    while (!isborder(robot, Ost) || !isborder(robot, Sud))
        while !isborder(robot, dir)
            move!(robot, dir)
            if dir == Ost
                x += 1
            else
                x -= 1
            end
            check(robot, x, y)
        end
        if !isborder(robot, Sud)
            move!(robot, Sud)
            y -= 1
            check(robot, x, y)
        end
        if dir == Ost
            dir = West
        else
            dir = Ost
        end
    end
    go_back(robot, x, y)
end
