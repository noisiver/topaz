-----------------------------------
-- Area: Al'Taieu
--   NM: Ulxzomit
-- Note: Babies follow it around
-----------------------------------
local ID = require("scripts/zones/AlTaieu/IDs")
require("scripts/globals/status")
require("scripts/globals/mobs")
require("scripts/globals/pathfind")
-----------------------------------
local path1 = {
    -77, 0, -495,
    -100, 0, -566,
    19, 0, -616,
    41, 0, -496,
}

local path2 = {
    -25, 0, -760,
    23, 0, -765,
    55, 0, -661,
}

local path3 = {
    137, -1, -699,
    288, 0 ,-592,
    160, 0, -554,
}

local path4 = {
    313, -1, -660,
    312, 0 ,-530,
    193, 0, -478,
    209, 0, -587,
}

local path5 = {
    -382, 0, -592,
    138, 0, -650,
}

local path6 = {
    219, 0, -424,
    330, 0, -309,
    461, 0, -316,
    559, 0, -527,
}

local path7 = {
    -101, 0, -571,
    -100, 0, -520,
    -211, 0, -501,
    -152, 0, -605,
    -279, 0, -640,
    -414, 0, -490,
    -509, 0, -457,
    -589, 0, -314,
}

local path8 = {
     247, 0, -378,
     639, 0, -332,
     578, 0, -25,
     701, -1, 10,
}

local path9 = {
     -417, -1, -572,
     -405, 0, -493,
     -576, 0, -436,
}

function onPath(mob)
    local mobID = mob:getID()
    if mobID == 16912394 then
        tpz.path.patrolsimple(mob, path1, tpz.path.flag.RUN)
    elseif mobID == 16912409 then
        tpz.path.patrolsimple(mob, path2, tpz.path.flag.RUN)
    elseif mobID == 16912422 then
        tpz.path.patrolsimple(mob, path3, tpz.path.flag.RUN)
    elseif mobID == 16912426 then
        tpz.path.patrolsimple(mob, path4, tpz.path.flag.RUN)
    elseif mobID == 16912443 then
        tpz.path.patrolsimple(mob, path5, tpz.path.flag.RUN)
    elseif mobID == 16912449 then
        tpz.path.patrolsimple(mob, path6, tpz.path.flag.RUN)
    elseif mobID == 16912455 then
        tpz.path.patrolsimple(mob, path7, tpz.path.flag.RUN)
    elseif mobID == 16912468 then
        tpz.path.patrolsimple(mob, path8, tpz.path.flag.RUN)
    elseif mobID == 16912545 then
        tpz.path.patrolsimple(mob, path9, tpz.path.flag.RUN)
    end
end

function onMobSpawn(mob)
    onPath(mob)
end

function onMobRoam(mob)
    onPath(mob)
end


function onMobDeath(mob, player, isKiller, noKiller)
end

