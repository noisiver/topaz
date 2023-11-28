-----------------------------------
-- Area: Al'Taieu
--   NM: Omxzomit
-- Note: Babies follow it around
-----------------------------------
local ID = require("scripts/zones/AlTaieu/IDs")
require("scripts/globals/status")
require("scripts/globals/mobs")
require("scripts/globals/pathfind")
-----------------------------------
local path1 = {
    477, -1, -562,
    546, -1, -202,
    690, -1, -163,
}

local path2 = {
    657, -1, -356,
    674, 0, -249,
    723, 0, -226,
    687, 0, -180,
    727, -1, -69,
}

local path3 = {
    580, 0, -151,
    559, 0 ,-301,
    493, 0, -338,
    528, 0, -539,
}

local path4 = {
    -571, 0, -437,
    -588, 0 ,-323,
    -468, 0, -271,
    -546, 0, -10.9,
}

local path5 = {
    -456, 0, 212,
    -379, 0 ,220,
    -376, 0, 283,
    -461, -1, 358,
    -624, -1 ,296,
    -609, -1, 238,
    -541, 0, 175,
}

local path6 = {
    622, 0, 418,
    506, 0, 517,
    428, 0, 442,
    489, 0, 408,
    505, -1, 321,
    617, 0, 374,
}

local path7 = {
    501, 0, 501,
    423, 0, 431,
    438, 0, 326,
    500, 0, 340,
    579, 0, 337,
    606, 0, 401,
}

local path8 = { -- TODO: Needs path
    501, 0, 501,
    423, 0, 431,
    438, 0, 326,
    500, 0, 340,
    579, 0, 337,
    606, 0, 401,
}

function onPath(mob)
    local mobID = mob:getID()
    if mobID == 16912484 then
        tpz.path.patrolsimple(mob, path1, tpz.path.flag.RUN)
    elseif mobID == 16912504 then
        tpz.path.patrolsimple(mob, path2, tpz.path.flag.RUN)
    elseif mobID == 16912521 then
        tpz.path.patrolsimple(mob, path3, tpz.path.flag.RUN)
    elseif mobID == 16912578 then
        tpz.path.patrolsimple(mob, path4, tpz.path.flag.RUN)
    elseif mobID == 16912687 then
        tpz.path.patrolsimple(mob, path5, tpz.path.flag.RUN)
    elseif mobID == 16912785 then
        tpz.path.patrolsimple(mob, path6, tpz.path.flag.RUN)
    elseif mobID == 16912792 then
        tpz.path.patrolsimple(mob, path7, tpz.path.flag.RUN)
    elseif mobID == 16912545 then -- TODO: Needs path
        tpz.path.patrolsimple(mob, path8, tpz.path.flag.RUN)
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

