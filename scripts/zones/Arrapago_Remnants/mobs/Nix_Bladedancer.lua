-----------------------------------
-- Area: Arrapago Remnants
--  Mob: Nix Bladedancer
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
    for i = 17081185, 17081208 do
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

