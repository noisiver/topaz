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
    if mob:getTP() > 1000 then
        mob:setTP(1000)
    end
    mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
end

function onMobEngaged(mob)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 0)
end

function onMobFight(mob, target)
end

function onMobWeaponSkillPrepare(mob, target)
end

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
end
