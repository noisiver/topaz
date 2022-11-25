-----------------------------------
-- Area: Arrapago Remnants
--  Mob: Psycheflayer
-----------------------------------
local ID = require("scripts/zones/Arrapago_Remnants/IDs")
require("scripts/globals/instance")
require("scripts/globals/status")
require("scripts/globals/msg")
mixins = {require("scripts/mixins/families/soulflayer")}
-----------------------------------
local buddies =
{
    [1] = { 17081167, 17081168, 17081170 },
    [2] = { 17081171, 17081172, 17081174 },
    [3] = { 17081176, 17081175, 17081177 },
    [4] = { 17081180, 17081179, 17081181 },
}
function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.NO_ROAM, 1)
    mob:delImmunity(tpz.immunity.SILENCE) 
end

function onMobEngaged(mob, target)
    salvageUtil.ForceLink(mob, target, buddies)
    salvageUtil.msgGroup(mob, "Two imps appear to help the " ..  MobName(mob) .. "." , 0xD, none)
end

function onMobFight(mob, target)
end

function onMobWeaponSkillPrepare(mob, target)
end

function onMobDeath(mob, player, isKiller, noKiller)
    local instance = mob:getInstance()
    local mobId = mob:getID(instance)

    -- Despawn Imps
    for _,party in ipairs(buddies) do
        for _,mob in ipairs(party) do
            if mob == mobId then
                for _,mob2 in ipairs(party) do
                    DespawnMob(mob2, instance)
                end
                break
            end
        end
    end
    salvageUtil.spawnRandomEvent(mob, player, isKiller, noKiller, 10, ID.mob.random_trash_start, ID.mob.random_trash_end)
end

function onMobDespawn(mob)
    local instance = mob:getInstance()
    local soulflayers = {17081167, 17081171, 17081176, 17081180}

    for _, mobId in pairs(soulflayers) do
        if not GetMobByID(mobId, instance):isDead() then
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


