-----------------------------------
-- Area: Bhaflau Thickets
--   NM: Nis Puk
-- !pos -155.319 -15.959 -599.366 52
-----------------------------------
require("scripts/globals/hunts")
require("scripts/globals/mobs")
local ID = require("scripts/zones/Bhaflau_Thickets/IDs")
-----------------------------------
function onMobSpawn(mob)
	mob:setDamage(125) 
    mob:addMod(tpz.mod.DEFP, 25) 
    mob:setMod(tpz.mod.REFRESH, 400)
end

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENAERO)
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.hunts.checkHunt(mob, player, 453)
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
