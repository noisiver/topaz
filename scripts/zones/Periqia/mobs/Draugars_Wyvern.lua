-----------------------------------
-- Area: Periqia (Requiem)
--  Mob: Draugar's Wyvern
-----------------------------------
local ID = require("scripts/zones/Periqia/IDs")
-----------------------------------
function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
    mob:setMobMod(tpz.mobMod.CHECK_AS_NM, 1)
end

function onMobRoam(mob)
    local instance = mob:getInstance()
	local Master = 0
    if mob:getTP() > 1000 then
        mob:setTP(1000)
    end
    if mob:getID(instance) == 17006913 then
        Master = GetMobByID(mob:getID(instance)-1, instance)
        mob:pathTo(Master:getXPos(), Master:getYPos(), Master:getZPos())
    end
    if mob:getID(instance) == 17006917 then
        Master = GetMobByID(mob:getID(instance)-1, instance)
        mob:pathTo(Master:getXPos(), Master:getYPos(), Master:getZPos())
    end
end

function onMobEngaged(mob)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 0)
end

function onMobFight(mob, target)
end

function onMobWeaponSkillPrepare(mob, target)
end

function onMobDeath(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
end
