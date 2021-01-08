-----------------------------------
-- Area: Fei'Yin
--  NM: Altedour I Tavnazia
-----------------------------------
require("scripts/globals/hunts")
require("scripts/globals/titles")
-----------------------------------


function onMobSpawn(mob)
    mob:setMod(tpz.mod.STUNRES, 100)
    mob:setMod(tpz.mod.SILENCERES, 100)
    mob:setMod(tpz.mod.SLEEPRES, 100)
    mob:setMod(tpz.mod.DMGMAGIC, 70)
    mob:setMod(tpz.mod.ACC, 100)
    tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = tpz.jsa.MANAFONT, hpp = math.random(50, 50)},
        },
    })
end

 function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end


function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENASPIR)
end



