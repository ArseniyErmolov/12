function go_back(robot, x, y):nothing
    while y < 0
        move!(robot, Nord)
        y += 1
    end
    while x > 0
        move!(robot, West)
        x -= 1
    end
end

function result(robot):nothing
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
    cnt = 0
    dir = Ost
    flag = false
    while (!isborder(robot, Ost) || !isborder(robot, Sud))
        if flag cnt += 1 end
        flag = false
        delay = 0
        while !isborder(robot, dir)
            move!(robot, dir)
            if dir == Ost x += 1
            else x -= 1 end
            if isborder(robot, Sud)
                flag = true
                delay = 0
            else 
                delay += 1
                if (flag && delay > 1) 
                    cnt += 1
                    flag = false 
                end 
            end
        end
        if !isborder(robot, Sud)
            move!(robot, Sud)
            y -= 1
        end
        if dir == Ost dir = West
        else dir = Ost end
    end
    print("Count Of Borders: ", cnt)
    go_back(robot, x, y)
end
