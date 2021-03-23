-----------------------------------
-- Area: Balgias Dias
-- Mob: Queen of Cups
-- Royale Ramble
-- !addkeyitem 1178
-----------------------------------
require("scripts/globals/titles")
require("scripts/globals/status")
require("scripts/globals/magic")
mixins =
{
    require("scripts/mixins/job_special"),
    require("scripts/mixins/rage")
}
-----------------------------------

function onMobSpawn(mob)
     mob:addMod(tpz.mod.DEFP, 20) 
     mob:addMod(tpz.mod.ATTP, 10)
     mob:addMod(tpz.mod.ACC, 30) 
     mob:addMod(tpz.mod.EVA, 30)
     mob:setMod(tpz.mod.REGAIN, 250)
     mob:setMobMod(tpz.mobMod.NO_DROPS, 0)
end

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, 1)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onMobFight(mob, target)
    local Rage = mob:getLocalVar("Rage")
    if (mob:hasStatusEffect(tpz.effect.WEIGHT) or mob:hasStatusEffect(tpz.effect.CURSE) or(mob:hasStatusEffect(tpz.effect.BIND)) then
        mob:setLocalVar("Rage", 1)
    end
    if Rage == 1 then
         mob:setLocalVar("[rage]timer", 1)
    end
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.SILENCE, {chance = 25, duration = 25})
end

function onMobDeath(mob, player, isKiller)
end