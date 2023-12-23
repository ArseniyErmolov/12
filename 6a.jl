moves = Vector()

function start_pos(robot):nothing
    while (!isborder(robot, Nord) || !isborder(robot, Ost))
        if !isborder(robot, Nord)
            move!(robot, Nord)
            push!(moves, Nord)
        end
        if !isborder(robot, Ost)
            move!(robot, Ost)
            push!(moves, Ost)
        end
    end
end

function go(robot, d1, d2, d3):nothing
    flag = true
    while flag
        while isborder(robot, d1) && !isborder(robot, d2)
            move!(robot, d2)
            push!(moves, d2)
            putmarker!(robot)
        end
        while isborder(robot, d2) && flag
            if isborder(robot, d3)
                while !isborder(robot, d1)
                    move!(robot, d1)
                    push!(moves, d1)
                end
                flag = false
            end
            if flag
                move!(robot, d3)
                push!(moves, d3)
            end
        end
        if flag
            if !isborder(robot, d2)
                move!(robot, d2)
                push!(moves, d2)
            end
            while isborder(robot, d1)
                move!(robot, d2)
                push!(moves, d2)
            end
            while !isborder(robot, d1)
                move!(robot, d1)
                push!(moves, d1)
            end
            putmarker!(robot)
        end
    end
end

function go_back(robot):nothing
    moves_revers = reverse(moves) 
    for i in moves_revers
        if i == Nord
            move!(robot, Sud)
        elseif i == Sud
            move!(robot, Nord)
        elseif i == Ost
            move!(robot, West)
        else
            move!(robot, Ost)
        end
    end
end

function result(robot):nothing
    start_pos(robot)
    go(robot, Nord, Ost, Sud)
    go(robot, Ost, Sud, West)
    go(robot, Sud, West, Nord)
    go(robot, West, Nord, Ost)
    go(robot, Nord, Ost, Sud)
    go_back(robot)
end
