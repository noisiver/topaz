-----------------------------------
-- Area: Beaucedine Glacier [S]
--   NM: Amphiptere
-----------------------------------
mixins = {require("scripts/mixins/families/amphiptere")}
require("scripts/globals/status")
require("scripts/globals/pathfind")
-----------------------------------

local path1 = {
    312, 0, 58,
    189, 0, 115,
    281, 0, -16,
    313, 0, -105,
    380, 0, -270,
    224, 0, -194,
	146, 0, -180,
}

local path2 = {
    61, -39, 141,
    43, -39, 72,
    36, -41, -10,
    5, -60, 41,
    -28, -62, 100,
    -95, -75, 104,
    -148, -79, 148,
    -116, -80, 205,
    -22, -80, 127,
}

local path3 = {
    -55, -98, 53,
    -127, -99 ,64,
    -114, -99, 4,
    -197, -99, -23,
    -255, -99, 23,
    -294, -100, 23,
    -315, -100, 61,
    -360, -100, 75,
    -361, -99, 132,
    -318, -100, 122,
}

function onPath(mob)
    local mobID = mob:getID()
    if mobID == 17334337 then
        tpz.path.patrolsimple(mob, path1, tpz.path.flag.RUN)
    elseif mobID == 17334380 then
        tpz.path.patrolsimple(mob, path2, tpz.path.flag.RUN)
    elseif mobID == 17334539 then
        tpz.path.patrolsimple(mob, path3, tpz.path.flag.RUN)
    end
end

function onMobSpawn(mob)
    onPath(mob)
end

function onMobRoam(mob)
    onPath(mob)
end

function onMobDeath(mob, player, isKiller, noKiller)
    mob:setRespawnTime(1800) -- 30 minutes
end