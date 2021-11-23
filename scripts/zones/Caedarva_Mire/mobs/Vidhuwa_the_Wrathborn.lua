------------------------------
-- Area: Caedarva Mire
--   NM: Vidhuwa the Wrathborn
------------------------------
require("scripts/globals/hunts")
require("scripts/globals/mobs")
require("scripts/globals/status")
------------------------------

function onMobSpawn(mob)
	mob:setDamage(120) 
    mob:addMod(tpz.mod.DEFP, 20) 
    mob:addMod(tpz.mod.ACC, 50) 
    mob:addMod(tpz.mod.MOVE, 12) 
    mob:addMod(tpz.mod.SPELLINTERRUPT, 95) 
	mob:setMod(tpz.mod.DOUBLE_ATTACK, 25)
    mob:setMod(tpz.mod.REFRESH, 400)
	mob:setMod(tpz.mod.SLEEPRESTRAIT, 100)
	mob:setMod(tpz.mod.LULLABYRESTRAIT, 100)
	mob:setMod(tpz.mod.BINDRESTRAIT, 100)
	mob:setMod(tpz.mod.GRAVITYRESTRAIT, 100)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
end

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onSpellPrecast(mob, spell)
    if spell:getID() == 214 then -- Flood
        spell:setAoE(tpz.magic.aoe.RADIAL)
        spell:setFlag(tpz.magic.spellFlag.HIT_ALL)
        spell:setRadius(10)
	end
end


function onAdditionalEffect(mob, target, damage)
	return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.POISON, {chance = 100, power = 40})
end

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 471)
	if isKiller  then 
		player:addTreasure(5735, mob)--Cotton Coin Purse
	end
	if isKiller and math.random(1,100) <= 24 then 
		player:addTreasure(5735, mob)--Cotton Coin Purse
	end
	if isKiller and math.random(1,100) <= 15 then 
		player:addTreasure(5735, mob)--Cotton Coin Purse
	end
end
