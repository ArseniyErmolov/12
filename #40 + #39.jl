function changeXY(side, x, y)
    if side == Nord
        return (x, y + 1)
    elseif side == Ost
        return (x + 1, y)
    elseif side == Sud
        return (x, y - 1)
    else
        return (x - 1, y)
    end
end

function square!(robot)
    Sides = (Nord, Ost, Sud, West)
    flag = true
    for side in Sides
        flag = flag && isborder(robot, side)
    end
    !flag ? flag = true : (println("робот внутри лабиринта"), return 1)
 
    yy = -1000
    used = Set{Tuple{Int, Int}}()

    x, y = 0, 0
    moves = Vector{Tuple{Int, Int}}()
    i, id = 0, 0 # [id] -> вперед, [id + 1] -> вправо
    pred_len = -1
    sum = 0

    while (length(moves) == 0) || (2 * i != length(moves))
        if !((x, y) in used)
            if (isborder(robot, Sud)) sum -= (yy - y) end
            if (isborder(robot, Nord)) sum += (yy - y - 1) end
        end
        push!(used, (x, y))
        
        if isborder(robot, Sides[1 + (id + 1) % 4])
            flag = isborder(robot, Sides[1 + id])
            if flag
                id = (id + 1) % 4
            else
                move!(robot, Sides[1 + id])
                x, y = changeXY(Sides[1 + id], x, y)
            end
        elseif !flag
            move!(robot, Sides[1 + (id + 1) % 4])
            x, y = changeXY(Sides[1 + (id + 1) % 4], x, y)
            id = (id + 1) % 4
        else
            for j in 0:3
                isborder(robot, Sides[1 + (id + 1) % 4]) ? break :
                id = (id + 1) % 4
            end
        end
        if (length(moves) == 0) push!(moves, (x, y))
        elseif ((x, y) != moves[end]) push!(moves, (x, y))
        end
        if (length(moves) != 1) && (pred_len != length(moves))
            i = (moves[i+1] == moves[end]) ? i += 1 : 0
        end
        pred_len = length(moves)
    end

    if (sum < 0) println("робот внутри лабиринта")
    else println("робот снаружи лабиринта") end
    return abs(sum)
end