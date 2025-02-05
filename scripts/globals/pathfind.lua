------------------------------------
--
-- NPC PATH WALKING
--
------------------------------------
tpz = tpz or {}

tpz.path =
{
    flag =
    {
        NONE     = 0,
        RUN      = 1,
        WALLHACK = 2,
        REVERSE  = 4,
    },

    -- returns the point at the given index
    get = function(points, index)
        local pos = {}

        if index < 0 then
            index = (#points + index - 2) / 3
        end

        pos[1] = points[index*3-2]
        pos[2] = points[index*3-1]
        pos[3] = points[index*3]

        return pos
    end,

    -- returns number of points in given path
    length = function(points)
        return #points / 3
    end,

    -- returns first point in given path
    first = function(points)
        return tpz.path.get(points, 1)
    end,

    -- are two points the same?
    equal = function(point1, point2)
        return point1[1] == point2[1] and point1[2] == point2[2] and point1[3] == point2[3]
    end,

    -- returns last point in given path
    last = function(points)
        local length = tpz.path.length(points)
        return tpz.path.get(points, length)
    end,

    -- returns random point from given path
    random = function(points)
        local length = tpz.path.length(points)
        return tpz.path.get(points, math.random(length))
    end,

    -- returns the start path without the first element
    fromStart = function(points, start)
        start = start or 1
        local t2 = {}
        local maxLength = 50
        local length = tpz.path.length(points)
        local count = 1
        local pos = start + 1
        local index = 1

        while pos <= length and count <= maxLength do
            local pt = tpz.path.get(points, pos)

            t2[index] = pt[1]
            t2[index+1] = pt[2]
            t2[index+2] = pt[3]

            pos = pos + 1
            count = count + 1
            index = index + 3
        end

        return t2
    end,

    -- reverses the array and removes the first element
    fromEnd = function(points, start)
        start = start or 1
        local t2 = {}
        local length = tpz.path.length(points)
        start = length - start
        local index = 1

        for i = start, 1, -1 do
            local pt = tpz.path.get(points, i)

            t2[index] = pt[1]
            t2[index+1] = pt[2]
            t2[index+2] = pt[3]

            index = index + 3

            if i > 50 then
                break
            end
        end

        return t2
    end,


    -- continusly run the path
    patrol = function(npc, points, flags)
        if npc:atPoint(tpz.path.first(points)) or npc:atPoint(tpz.path.last(points)) then
            npc:pathThrough(tpz.path.fromStart(points), flags)
        else
            local length = tpz.path.length(points)
            local currentLength = 0
            local i = 51

            while(i <= length) do
                if npc:atPoint(tpz.path.get(points, i)) then
                    npc:pathThrough(tpz.path.fromStart(points, i), flags)
                    break
                end

                i = i + 50
            end
        end
    end,

    patrolsimple = function(npc, points, flags)
        local nextPatrolIndex = npc:getLocalVar("nextPatrolIndex")
        local length = tpz.path.length(points)
        local i = nextPatrolIndex > 0 and nextPatrolIndex or 1

        if i <= length then
            if npc:atPoint(tpz.path.get(points, i)) then
                i = i + 1
            end
        else
            i = 1
        end

        npc:pathThrough(tpz.path.get(points, i), flags)
        npc:setLocalVar("nextPatrolIndex", i)
    end,

    -- Loops back and forth from point 1 > 2 > 3 > 4 > 3 > 2 > 1 etc.
    loop = function(npc, points, flags)
        if not npc:isFollowingPath() then
            local path = npc:getLocalVar("path")
            local reverse = npc:getLocalVar("pathreverse");
            local step = (reverse == true) and -1 or 1;
            path = path + step;
            if (path > #points) then
                path = #points - 1;
                npc:setLocalVar("pathreverse", true);
            elseif (path < 1) then
                path = 2;
                npc:setLocalVar("pathreverse", false);
            end
        
            npc:setLocalVar("path", path);
            local currentPath = points[path];
            -- print(currentPath.x)
            -- print(currentPath.y)
            -- print(currentPath.z)
            npc:pathTo(currentPath.x, currentPath.y, currentPath.z, flags);
        end
    end,

}
