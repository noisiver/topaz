-----------------------------------
-- Area: Bhaflau Thickets
--  Mob: Olden Treant
-- Note: Place holder Emergent Elm
-----------------------------------
local ID = require("scripts/zones/Bhaflau_Thickets/IDs")
require("scripts/globals/mobs")

function onMobDeath(mob, player, isKiller, noKiller)
	if isKiller and math.random(1,100) <= 24 then 
		player:addTreasure(2488, mob)--Alexandrite 
	end
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.EMERGENT_ELM_PH, 20, 7200) -- 2 hours
end
