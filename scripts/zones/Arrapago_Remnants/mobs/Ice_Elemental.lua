-----------------------------------
-- Area: Arrapago Remnants
--  Mob: Ice Elemental
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

function onMobDeath(mob, player, isKiller)
    salvageUtil.spawnRandomEvent(mob, player, isKiller, 5, ID.mob.random_trash_start, ID.mob.random_trash_end)
end

function onMobDespawn(mob)
    local instance = mob:getInstance()
    for i = 17081073, 17081080 do
        if not GetMobByID(i, instance):isDead() then
            return
        end
    end
    SpawnMob(17081107, instance)
end


-- For testing purposes only
--function onMobWeaponSkillPrepare(mob, target)
--    return 1560 
--end
