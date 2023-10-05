-----------------------------------
-- Area: Mount Zhayolm
--  Mob: Hilltroll_Puppetmaster
-- Job: PUP
-----------------------------------
local ID = require("scripts/zones/Mount_Zhayolm/IDs")
require("scripts/globals/mobs")
mixins = {require("scripts/mixins/weapon_break")}
-----------------------------------
function onMobEngaged(mob, target)
    mob:useMobAbility(1901) -- Activate
end

function onMobDeath(mob)
	if isKiller and math.random(1,100) <= 24 then 
		player:addTreasure(2488, mob)--Alexandrite 
	end
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.FAHRAFAHR_THE_BLOODIED_PH, 20, 3600) -- 1 hour
end


