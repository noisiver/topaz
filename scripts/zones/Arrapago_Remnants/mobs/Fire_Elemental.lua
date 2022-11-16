-----------------------------------
-- Area: Arrapago Remnants
--  Mob: Fire Elemental
-----------------------------------
local ID = require("scripts/zones/Arrapago_Remnants/IDs")
require("scripts/globals/instance")
require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/salvage")
-----------------------------------

function onMobSpawn(mob)
end

function onMobEngaged(mob, target)
end

function onMobFight(mob, target)
end

function onMobWeaponSkillPrepare(mob, target)
end

function onMobDeath(mob, player, isKiller, noKiller)
    salvageUtil.spawnRandomEvent(mob, player, isKiller, noKiller, 5, ID.mob.random_trash_start, ID.mob.random_trash_end)
end

function onMobDespawn(mob)
end

-- For testing purposes only
--function onMobWeaponSkillPrepare(mob, target)
--    return 1560 
--end
