-----------------------------------
-- Area: Alzadaal Undersea Ruins (72)
--  Mob: Qiqirn Goldsmith
-- Note: PH for Cookieduster Lipiroon
-----------------------------------
local ID = require("scripts/zones/Alzadaal_Undersea_Ruins/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    player:addCurrency("zeni_point", 10)
	if isKiller and math.random(1,100) <= 24 then 
		player:addTreasure(2488, mob)--Alexandrite 
	end
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.COOKIEDUSTER_LIPIROON_PH, 5, 3600) -- 1 hour
end
