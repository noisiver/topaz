-----------------------------------
-- Area: Arrapago Reef
--  Mob: Archaic_Mirror
-----------------------------------
require("scripts/globals/mobs")
require("scripts/globals/status")
-----------------------------------
function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
    mob:setBehaviour(bit.bor(mob:getBehaviour(), tpz.behavior.NO_TURN))
end

function onMobDeath(mob, player, isKiller, noKiller)
	if isKiller then 
		player:addTreasure(5736, mob)--Linen Coin Purse
	end
end
