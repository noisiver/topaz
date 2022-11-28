-----------------------------------
-- Area: Arrapago Remnants
--  Mob: Lamie Bellydancer
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
    mob:setMobMod(tpz.mobMod.NO_ROAM, 1)
end

function onMobEngaged(mob, target)
    local instance = mob:getInstance()
    local pet = GetMobByID(mob:getID(instance)+1, instance)
    pet:updateEnmity(target)
end

function onMobFight(mob, target)
    local bellyDanceEnabled = mob:getLocalVar("bellyDanceEnabled")

    -- Belly Dance is used immediately after Hypnotic Sway
    if (bellyDanceEnabled == 1) then
        mob:setLocalVar("bellyDanceEnabled", 0)
        mob:useMobAbility(1762) -- Belly Dance
    end
end

function onMobWeaponSkillPrepare(mob, target)
    return 1759 -- Hypnotic Sway
end

function onMobWeaponSkill(target, mob, skill)
    if skill:getID() == 1759 then -- Hypnotic Sway
        mob:setLocalVar("bellyDanceEnabled", 1)
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
    salvageUtil.spawnRandomEvent(mob, player, isKiller, noKiller, 10, ID.mob.random_trash_start, ID.mob.random_trash_end)
end

function onMobDespawn(mob)
    local instance = mob:getInstance()
    for i = 17081189, 17081208 do
        if not GetMobByID(i, instance):isDead() then
            return
        end
    end
    exon1 = GetMobByID(17081209, instance)
    exon2 = GetMobByID(17081210, instance)
    if not exon1:isSpawned() and not exon2:isSpawned() then
        SpawnMob(17081209, instance)
        SpawnMob(17081210, instance)
        salvageUtil.msgGroup(mob, "Our queen will not be happy about this.", 0, "Lamia Exon")
    end
end


