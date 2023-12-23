function inverse(side)
    if side == Nord return Sud
    elseif side == Sud return Nord
    else return side == West ? Ost : West
    end
end

function along_rec!(robot, side)
    if isborder(robot, side) putmarker!(robot)
    else
        move!(robot, side)
        along_rec!(robot, side)
        move!(robot, inverse(side))
    end
end
