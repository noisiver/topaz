-----------------------------------
-- Area: Beaucedine Glacier [S]
--   NM: Grand'Goule
-----------------------------------
require("scripts/globals/hunts")
require("scripts/globals/mobs")
require("scripts/globals/status")
-----------------------------------
function onMobSpawn(mob)
	mob:setDamage(250) -- 350-450 on DD's
    mob:addMod(tpz.mod.DEFP, 50) 
    mob:addMod(tpz.mod.ACC, 25)
    mob:addMod(tpz.mod.EVA, 50)
	mob:setMod(tpz.mod.SLEEPRESTRAIT, 100)
	mob:setMod(tpz.mod.LULLABYRESTRAIT, 100)
	mob:setMod(tpz.mod.BINDRESTRAIT, 100)
	mob:setMod(tpz.mod.GRAVITYRESTRAIT, 100)
	mob:AnimationSub(0)
end

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.PETRIFY)
end

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 538)
end
