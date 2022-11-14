-----------------------------------
-- Area: Bhaflau Thickets
--  Mob: Ameretat
-----------------------------------
require("scripts/globals/mobs")
require("scripts/globals/status")
mixins = {require("scripts/mixins/families/ameretat")}
-----------------------------------
function onMobInitialize(mob)
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.HP_DRAIN, {chance = 100, power = math.random(100, 200)})
end

function onMobDeath(mob, player, isKiller)
	if isKiller and math.random(1,100) <= 24 then 
		player:addTreasure(5735, mob)--Cotton Coin Purse
	end
end
