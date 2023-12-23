function check(robot, x, y, r):nothing
    fl1 = (x % (2 * r) < r)
    fl2 = (abs(y) % (2 * r) < r)
    if fl1 == fl2
        putmarker!(robot)
    end
end

function go_back(robot, x, y):nothing
    while x > 0
        move!(robot, West)
        x -= 1
    end
    while y < 0
        move!(robot, Nord)
        y += 1
    end
end

function result(robot, r):nothing
    x = 0
    y = 0
    while !isborder(robot, West)
        move!(robot, West)
    end
    while !isborder(robot, Nord)
        move!(robot, Nord)
    end
    
    check(robot, x, y, r)
    dir = Ost
    while (!isborder(robot, Ost) || !isborder(robot, Sud))
        while !isborder(robot, dir)
            move!(robot, dir)
            if dir == Ost
                x += 1
            else
                x -= 1
            end
            check(robot, x, y, r)
        end
        if !isborder(robot, Sud)
            move!(robot, Sud)
            y -= 1
            check(robot, x, y, r)
        end
        if dir == Ost
            dir = West
        else
            dir = Ost
        end
    end
    go_back(robot, x, y)
end
