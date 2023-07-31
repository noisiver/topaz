-----------------------------------
-- Area: Mamook
--  Mob: Ziz
-- Note: PH for Zizzy Zillah
-----------------------------------
mixins = {require("scripts/mixins/families/ziz")}
local ID = require("scripts/zones/Mamook/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
	if isKiller and math.random(1,100) <= 24 then 
		player:addTreasure(2488, mob)--Alexandrite 
	end
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.ZIZZY_ZILLAH_PH, 20, 3600) -- 1 hour
end
