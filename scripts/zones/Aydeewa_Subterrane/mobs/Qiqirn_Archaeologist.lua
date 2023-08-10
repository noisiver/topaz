-----------------------------------
-- Area: Aydeewa Subterrane
--  Mob: Qiqirn Archaeologist
-- Note: PH for Bluestreak Gyugyuroon
-----------------------------------
local ID = require("scripts/zones/Aydeewa_Subterrane/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
	if isKiller and math.random(1,100) <= 24 then 
		player:addTreasure(2488, mob)--Alexandrite 
	end
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.BLUESTREAK_GYUGYUROON_PH, 20, 7200) -- 2 hours
end
