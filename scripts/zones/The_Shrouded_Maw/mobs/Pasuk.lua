-----------------------------------
-- Area: The Shrouded Maw
--  Mob: Pasuk
-- ENM: Test Your Mite
-- !addkeyitem Astral_Covenant
-----------------------------------
require("scripts/globals/titles")
require("scripts/globals/mobs")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onMobSpawn(mob)
    mob:addMod(tpz.mod.ATTP, 50)
    mob:addMod(tpz.mod.DEFP, 50) 
    mob:addMod(tpz.mod.ACC, 15) 
    mob:addMod(tpz.mod.EVA, 15)
    mob:setMobMod(tpz.mobMod.MAGIC_COOL, 25)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
end

function onMobEngaged(mob, target)
    mob:setLocalVar("ViscidSecretionTimer", math.random(40, 60))
end

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onMobFight(mob, target)
    local TeleportTimer = mob:getLocalVar("TeleportTimer")
    local ViscidSecretionTimer = mob:getLocalVar("ViscidSecretionTimer")
	local BattleTime = mob:getBattleTime()
    -- Uses Viscid Secretion every 60 seconds
    if ViscidSecretionTimer == 0 then
        mob:setLocalVar("ViscidSecretionTimer", BattleTime + math.random(40, 60))
    elseif BattleTime >= ViscidSecretionTimer then
        mob:useMobAbility(1361)
        mob:setLocalVar("ViscidSecretionTimer", BattleTime + math.random(40, 60))
    end
    -- Teleport to target every 30s if out of range
    if mob:checkDistance(target) > 15 and BattleTime >= TeleportTimer then
        printf("teleportin to target")
        local targetPos = target:getPos()
        mob:setPos(targetPos.x, targetPos.y, targetPos.z)
        mob:setLocalVar("TeleportTimer", BattleTime + 30)
    end
end

function onMobWeaponSkill(target, mob, skill)
end

function onMagicHit(caster, target, spell)
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.TP_DRAIN, {chance = 100, power = math.random(200, 250)})
end


function onMobDeath(mob, player, isKiller)
end