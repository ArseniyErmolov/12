function along_rec!(robot, side)
    if !isborder(robot, side)
        move!(robot, side)
        along_rec!(robot, side)
    end
end
