-----------------------------------
-- Area: Balgias Dias
-- Mob: Queen of Batons
-- Royale Ramble
-- !addkeyitem 1178
-----------------------------------
require("scripts/globals/titles")
require("scripts/globals/status")
require("scripts/globals/magic")
mixins =
{
    require("scripts/mixins/job_special"),
}
-----------------------------------

function onMobSpawn(mob)
     mob:addMod(tpz.mod.DEFP, 20) 
     mob:addMod(tpz.mod.ATTP, 10)
     mob:addMod(tpz.mod.ACC, 30) 
     mob:addMod(tpz.mod.EVA, 30)
     mob:setMod(tpz.mod.REGAIN, 250)
     mob:setMod(tpz.mod.REFRESH, 400)
     mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
end

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, 1)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onMobFight(mob, target)
	if (mob:hasStatusEffect(tpz.effect.WEIGHT) or mob:hasStatusEffect(tpz.effect.CURSE) or mob:hasStatusEffect(tpz.effect.BIND)) then
        mob:setDamage(255)
        mob:setMod(tpz.mod.HASTE_MAGIC, mob:getMod(tpz.mod.HASTE_MAGIC) + 8000)
        mob:setMod(tpz.mod.MEVA, 999)
        mob:setMod(tpz.mod.SLEEPRESTRAIT, 100)
        mob:setMod(tpz.mod.LULLABYRESTRAIT, 100)
        mob:setMod(tpz.mod.BINDRESTRAIT, 100)
        mob:setMod(tpz.mod.GRAVITYRESTRAIT, 100)
        mob:setMod(tpz.mod.POISONRESTRAIT, 100)
        mob:setMod(tpz.mod.PARALYZERESTRAIT, 100)
        mob:setMod(tpz.mod.BLINDRESTRAIT, 100)
        mob:setMod(tpz.mod.SILENCERESTRAIT, 100)
        mob:setMod(tpz.mod.VIRUSRESTRAIT, 100)
        mob:setMod(tpz.mod.PETRIFYRESTRAIT, 100)
        mob:setMod(tpz.mod.CURSERESTRAIT, 100)
        mob:setMod(tpz.mod.SLOWRESTRAIT, 100)
        mob:setMod(tpz.mod.STUNRESTRAIT, 100)
        mob:setMod(tpz.mod.CHARMRESTRAIT, 100)
        mob:setMod(tpz.mod.AMNESIARESTRAIT, 100)
        mob:setMod(tpz.mod.DEATHRESTRAIT, 100)
        mob:setMod(tpz.mod.UDMGMAGIC, -95)
        mob:setMod(tpz.mod.UDMGPHYS, -95)
        mob:setMod(tpz.mod.UDMGRANGE, -95)
        mob:setMod(tpz.mod.UDMGBREATH, -95)
    end
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.PARALYZE, {chance = 25, power = 25, duration = 30})
end

function onMobDeath(mob, player, isKiller)
end