using HorizonSideRobots

left(side::HorizonSide) = HorizonSide(mod(Int(side)+1, 4))
right(side::HorizonSide) = HorizonSide(mod(Int(side)-1, 4))
inverse(side::HorizonSide) = HorizonSide(mod(Int(side)+2, 4))

try_move!(robot, side) = 
    if isborder(robot, side)
        return false
    else
        move!(robot, side)
        return true
    end

along!(stop_condition::Function, robot, side) = 
    while stop_condition() == false && try_move!(robot, side) end

function numsteps_along!(stop_condition::Function, robot, side)
    n = 0
    while stop_condition() == false && try_move!(robot, side)
        n += 1
    end
    return n
end

function snake!(stop_condition::Function, robot; start_side, ortogonal_side)
    s = start_side
    along!(robot, s) do 
        stop_condition() || isborder(robot, s)
    end
    while !stop_condition() && try_move!(robot, ortogonal_side)
        s = inverse(s)
        along!(robot, s) do 
            stop_condition() || isborder(robot, s)
        end
    end
end

snake!(robot; start_side, ortogonal_side) = 
    snake!(() -> false, robot, start_side, ortogonal_side)

function shatl!(stop_condition::Function, robot; start_side)
    s = start_side
    n = 0
    while stop_condition() == false
        n += 1
        move!(robot, s, n)
        s = inverse(s)
    end
    return (n+1)÷2
end

function spiral!(stop_condition::Function, robot; start_side = Nord, nextside::Function = left)
    side = start_side
    n = 0
    while stop_condition() == false
        if iseven(n)
            n += 1
        end
        move!(stop_condition, robot, side, num_maxsteps = n)
        side = nextside(side)
        move!(stop_condition, robot, side, num_maxsteps = n)
        side = nextside(side)
    end
end

function HorizonSideRobots.move!(stop_condition::Function, robot, side; num_maxsteps::Integer)
    n = 0
    while n < num_maxsteps && stop_condition() == false
        n += 1
        move!(robot, side)
    end
    return n
end
