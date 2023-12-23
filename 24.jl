function inverse(side)
    if side == Nord return Sud
    elseif side == Sud return Nord
    else return side == West ? Ost : West
    end
end

function rec1!(robot, side)
    if !isborder(robot, side)
        move!(robot, side)
        rec2!(robot, side)
        move!(robot, inverse(side))
    end
    return
end

function rec2!(robot, side)
    if !isborder(robot, side)
        move!(robot, side)
        rec1!(robot, side)
    end
    return
end
