-----------------------------------
-- Area: Xarcabard [S]
--   NM: Graoully
-----------------------------------
require("scripts/globals/hunts")
require("scripts/globals/mobs")
require("scripts/globals/status")
mixins = {require("scripts/mixins/families/dahak")}
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onMobSpawn(mob)
    local bufftwo = tpz.effect.BLAZE_SPIKES

    mob:addStatusEffect(tpz.effect.BLAZE_SPIKES, 70, 0, 3600)
    mob:getStatusEffect(bufftwo):unsetFlag(tpz.effectFlag.DISPELABLE)
	mob:setDamage(250) -- 350-450 on DD's
    mob:addMod(tpz.mod.DEFP, 100) 
    mob:addMod(tpz.mod.ACC, 25)
    mob:addMod(tpz.mod.EVA, 50)
    mob:setMod(tpz.mod.REFRESH, 400)
	mob:setMod(tpz.mod.MOVE, 12)
	mob:setMod(tpz.mod.SILENCERESTRAIT, 100)
	mob:setMod(tpz.mod.SLEEPRESTRAIT, 100)
	mob:setMod(tpz.mod.LULLABYRESTRAIT, 100)
	mob:setMod(tpz.mod.BINDRESTRAIT, 100)
	mob:setMod(tpz.mod.GRAVITYRESTRAIT, 100)
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.PLAGUE)
end

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 542)
end
