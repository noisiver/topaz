-----------------------------------
-- Area: Apollyon NW
--  Mob: Cynoprosopi
-----------------------------------
require("scripts/globals/pathfind")
local ID = require("scripts/zones/Apollyon/IDs")
local flags = tpz.path.flag.NONE
local path =
{
    {-553.732,0.000,599.452},
    {-606.096,0.000,567.105},
    {-577.405,-0.642,541.362},
    {-543.441,0.000,523.866}
}
function onMobSpawn(mob)
    mob:setDamage(50)
    mob:setMod(tpz.mod.DEF, 4000)
	mob:setBehaviour(bit.bor(mob:getBehaviour(), tpz.behavior.NO_TURN))
end

function onMobRoam(mob)
    if not mob:isFollowingPath() then
        local point = math.random(#path)
        while point == mob:getLocalVar("point") do
            point = math.random(#path)
        end
        mob:setLocalVar("point", point)
        mob:pathTo(path[point][1], path[point][2], path[point][3], flags)
    end
end

function onMobEngaged(mob)
    local GorynichKillCounter = GetServerVariable("GorynichKillCounter")
    if mob:getHP() > 10000 then
	    mob:setHP(15000 - (GorynichKillCounter * 10))
	mob:setDamage(500 - GorynichKillCounter)
    end
end

function onMobFight(mob, target)
    local GorynichKillCounter = GetServerVariable("GorynichKillCounter")
    if mob:getHP() > 10000 then
	    mob:setHP(15000 - (GorynichKillCounter * 10))
	mob:setDamage(500 - GorynichKillCounter)
    end
end


function onMobDeath(mob, player, isKiller, noKiller)
    SetServerVariable("GorynichKillCounter", 0)
    if isKiller or noKiller then
        local mobX = mob:getXPos()
        local mobY = mob:getYPos()
        local mobZ = mob:getZPos()
        GetNPCByID(ID.npc.APOLLYON_NW_CRATE[4][1]):setPos(mobX, mobY, mobZ)
        GetNPCByID(ID.npc.APOLLYON_NW_CRATE[4][1]):setStatus(tpz.status.NORMAL)
    end
end
