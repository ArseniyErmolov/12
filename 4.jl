function vec(robot, dir1, dir2, aa, bb, a, b):nothing
    while (!isborder(robot, dir1) && !isborder(robot, dir2))
        move!(robot, dir1)
        move!(robot, dir2)
        putmarker!(robot)
        a += aa
        b += bb
    end
    return a, b
end

function back(robot, a, b):nothing
    if a < 0
        dir = Sud
    else
        dir = Nord
    end
    while a != 0
        move!(robot, dir)
        if a > 0
            a -= 1
        else
            a += 1
        end
    end

    if b < 0
        dir = Ost
    else
        dir = West
    end
    while b != 0
        move!(robot, dir)
        if b > 0
            b -= 1
        else 
            b += 1
        end
    end
    return a, b
end

function res(robot):nothing
    a = 0
    b = 0
    putmarker!(robot)
    a, b = vec(robot, Nord, Ost, -1, 1, a, b)
    a, b = vec(robot, Sud, West, 1, -1, a, b)
    a, b = back(robot, a, b)
    a, b = vec(robot, Sud, Ost, 1, 1, a, b)
    a, b = vec(robot, Nord, West, -1, -1, a, b)
    a, b = back(robot, a, b)
end
