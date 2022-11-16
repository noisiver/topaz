-----------------------------------
-- Area: Arrapago Remnants
--  Mob: Dark Elemental
-----------------------------------
local ID = require("scripts/zones/Arrapago_Remnants/IDs")
require("scripts/globals/instance")
require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/salvage")
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.NO_AGGRO, 1)
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
    local instance = mob:getInstance()
    for i = 17081089, 17081096 do
        if not GetMobByID(i, instance):isDead() then
            return
        end
    end
    SpawnMob(17081105, instance)
end
