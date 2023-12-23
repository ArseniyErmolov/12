function inverse(side)
    if side == Nord return Sud
    elseif side == Sud return Nord
    else return side == West ? Ost : West
    end
end

function do_simmetry!(robot, side, flag = false)
    if !isborder(robot, side) && !flag
        move!(robot, side)
        do_simmetry!(robot, side)
        move!(robot, side)
    elseif !isborder(robot, inverse(side))
        move!(robot, inverse(side))
        do_simmetry!(robot, side, true)
    else return end
end
