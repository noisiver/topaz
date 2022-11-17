-----------------------------------
-- Area: Arrapago Remnants
--  Mob:Blooddrinker
-----------------------------------
local ID = require("scripts/zones/Arrapago_Remnants/IDs")
require("scripts/globals/instance")
require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/salvage")
-----------------------------------

function onMobSpawn(mob)
	mob:SetAutoAttackEnabled(false)
    mob:SetMagicCastingEnabled(false)
    mob:SetMobAbilityEnabled(false)
    mob:setUnkillable(true)
    mob:setMobMod(tpz.mobMod.CHECK_AS_NM, 1)
    mob:setMobMod(tpz.mobMod.NO_AGGRO, 1)
end

function onMobEngaged(mob, target)
    mob:pathTo(-268, -0, 179)
    salvageUtil.msgGroup(target, "The " .. MobName(mob) .. " runs away in fear!", 0xD, none)
end

function onMobFight(mob, target)
    local instance = mob:getInstance()
    local currentMob = GetMobByID(mob:getID(instance), instance)
    local Pos = currentMob:getPos()
    if Pos.x == -268 and Pos.y == -0 and Pos.z == 179 then
        DespawnMob(mob:getID(instance), instance)
    end
end

function onMobWeaponSkillPrepare(mob, target)
end

function onMobDeath(mob, player, isKiller, noKiller)
    salvageUtil.spawnRandomEvent(mob, player, isKiller, noKiller, 5, ID.mob.random_trash_start, ID.mob.random_trash_end)
end

function onMobDespawn(mob)
    local instance = mob:getInstance()
     -- Increase progress counter after each bat despawns
    instance:setProgress(instance:getProgress() +1) 
end


