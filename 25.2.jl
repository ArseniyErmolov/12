function rec!(robot, side)
    if !isborder(robot, side)
        putmarker!(robot)
        move!(robot, side)
        rec1!(robot, side)
    end
    return
end

function call_me!(robot, side)
    if !isborder(robot, side)
        move!(robot, side)
        putmarker!(robot)
        rec2!(robot, side)
    end
    return
end
