-----------------------------------
-- Area: Arrapago Remnants
--  Mob: Lamie Deathdancer
-----------------------------------
local ID = require("scripts/zones/Arrapago_Remnants/IDs")
require("scripts/globals/instance")
require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/salvage")
mixins = {require("scripts/mixins/weapon_break")}
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.CHECK_AS_NM, 1)
    mob:setMobMod(tpz.mobMod.NO_ROAM, 0)
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
    for i = 17081185, 17081208 do
        if not GetMobByID(i, instance):isDead() then
            return
        end
    end
    SpawnMob(17081209, instance)
    SpawnMob(17081210, instance)
    salvageUtil.msgGroup(mob, "Our queen will not be happy about this.", 0, "Lamia Exon")
end


