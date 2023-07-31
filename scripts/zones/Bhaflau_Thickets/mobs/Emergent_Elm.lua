-----------------------------------
-- Area: Bhaflau Thickets
--   NM: Emergent Elm
-- !pos 71.000 -33.000 627.000 52
-----------------------------------
require("scripts/globals/hunts")
local ID = require("scripts/zones/Bhaflau_Thickets/IDs")
-----------------------------------
function onMobSpawn(mob)
	mob:setDamage(125) 
    mob:addMod(tpz.mod.DEFP, 25) 
end

function onMobFight(mob, target)
    if VanadielHour() >= 6 and VanadielHour() <= 18 then
	    mob:setMod(tpz.mod.REGEN, 50)
    else
	    mob:setMod(tpz.mod.REGEN, 0)
    end
end

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.BIND)
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.hunts.checkHunt(mob, player, 452)
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
