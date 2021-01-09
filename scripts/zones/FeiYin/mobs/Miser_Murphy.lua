-----------------------------------
-- Area: Fei'Yin
--  NM: Miser Murphy
-----------------------------------
require("scripts/globals/hunts")
require("scripts/globals/titles")
-----------------------------------


function onMobSpawn(mob)
    mob:setMod(tpz.mod.STUNRES, 100)
    mob:setMod(tpz.mod.BINDRES, 100)
end

 function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end


function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.HP_DRAIN, {chance = 100, power = math.random(300, 550)})
end



