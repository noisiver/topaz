-----------------------------------
-- Area: Mount Zhayolm
--  Mob: Wamoura
-- Note: PH for Ignamoth
-----------------------------------
local ID = require("scripts/zones/Mount_Zhayolm/IDs")
require("scripts/globals/mobs")
mixins = {require("scripts/mixins/families/wamoura")}
-----------------------------------

function onMobSpawn(mob)
end

function onMobDeath(mob)
	if isKiller and math.random(1,100) <= 24 then 
		player:addTreasure(2488, mob)--Alexandrite 
	end
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.IGNAMOTH_PH, 20, 7200) -- 2 hours
end
