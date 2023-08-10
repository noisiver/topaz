-----------------------------------
-- Area: Cloister of Storms
--  NM: Thunder Gremlin
-- SMN AF3
-- RDM
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------
function onMobSpawn(mob)
    mob:setMod(tpz.mod.ATTP, 25)
    mob:setMod(tpz.mod.DEFP, 25)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
    mob:addImmunity(tpz.immunity.SLEEP)
end

function onMobFight(mob, target)
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.MP_DRAIN, {chance = 75, power = math.random(30, 40)})
end


function onMobDeath(mob, player, isKiller, noKiller)
end
