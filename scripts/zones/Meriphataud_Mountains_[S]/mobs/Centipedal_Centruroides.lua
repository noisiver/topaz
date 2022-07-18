-----------------------------------
-- Area: Meriphataud Mountains [S]
--   NM: Centipedal Centruroides
-----------------------------------
require("scripts/globals/hunts")
require("scripts/globals/mobs")
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
end

function onMobSpawn(mob)
	mob:setDamage(250) -- 350-450 on DD's
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 100)
    mob:addMod(tpz.mod.DEFP, 25) 
    mob:addMod(tpz.mod.ACC, 25) 
    mob:addMod(tpz.mod.EVA, 25)
    mob:setMod(tpz.mod.REFRESH, 400)
	mob:setMod(tpz.mod.SLEEPRESTRAIT, 100)
	mob:setMod(tpz.mod.LULLABYRESTRAIT, 100)
	mob:setMod(tpz.mod.BINDRESTRAIT, 100)
	mob:setMod(tpz.mod.GRAVITYRESTRAIT, 100)
    mob:setMod(tpz.mod.MOVE, 15)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.POISON, {power = 30})
end

function onMobDeath(mob, player, isKiller)
    player:addCurrency("allied_notes", 200)
	if isKiller and math.random(1,100) <= 24 then 
		player:addTreasure(2968, mob)-- Daybreak Soul
	end
	if isKiller and math.random(1,100) <= 24 then 
		player:addTreasure(2969, mob) -- Twilight Soul
	end
    tpz.hunts.checkHunt(mob, player, 528)
end
