-----------------------------------
-- Area: Mount Zhayolm
--  Mob: Wamoura
-- Note: PH for Ignamoth
-----------------------------------
local ID = require("scripts/zones/Mount_Zhayolm/IDs")
require("scripts/globals/mobs")
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
    if evolvedFromPrince(mob) then
        local princeID = mob:getID() - 1
        DisallowRespawn(princeID, false)
    end
end


function evolvedFromPrince(mob)
    local evolved = false
    local mobId = mob:getID()

    for i,v in pairs(ID.mob.EVOLVING_WAMOURA_PRINCES) do
        if mobId == v+1 then
            evolved = true
        end
    end

    return evolved    
end
