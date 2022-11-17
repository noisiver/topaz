-----------------------------------
-- Area: Arrapago Remnants
--  Mob: Heraldic Imp
-----------------------------------
local ID = require("scripts/zones/Arrapago_Remnants/IDs")
require("scripts/globals/instance")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.CHECK_AS_NM, 1)
    mob:delImmunity(tpz.immunity.SILENCE) 
end

function onMobEngaged(mob, target)
end

function onMobFight(mob, target)
end

function onMobWeaponSkillPrepare(mob, target)
end

function onMobDeath(mob, player, isKiller, noKiller)
    salvageUtil.spawnRandomEvent(mob, player, isKiller, noKiller, 10, ID.mob.random_trash_start, ID.mob.random_trash_end)
end

function onMobDespawn(mob)
    local instance = mob:getInstance()
    for i = 17081167, 17081181 do
        if not GetMobByID(i, instance):isDead() then
            return
        end
    end
    medjedshead = GetMobByID(17081183, instance)
    medjedsbody = GetMobByID(17081184, instance)
    medjedshead:setSpawn(mob:getXPos(), mob:getYPos(), mob:getZPos(), mob:getRotPos())
    medjedsbody:setSpawn(mob:getXPos() +3, mob:getYPos(), mob:getZPos() +3, mob:getRotPos())
    if not medjedshead:isSpawned() and not medjedsbody:isSpawned() then
        SpawnMob(17081183, instance)
        SpawnMob(17081184, instance)
        salvageUtil.msgGroup(mob, "Two ghosts appear!", 0xD, none)
    end
end

