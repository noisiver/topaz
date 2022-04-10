-----------------------------------
-- Area: Aydeewa Subterrane
--  Mob: Mold Eater
-----------------------------------
mixins = {require("scripts/mixins/families/worm")}
require("scripts/globals/keyitems")
local ID = require("scripts/zones/Aydeewa_Subterrane/IDs")
------------------------------

function onMobDeath(mob, player, isKiller)
    if math.random(1,100) <= 5 then
	    local zonePlayers = mob:getZone():getPlayers()
	    for _, zonePlayer in pairs(zonePlayers) do
		    zonePlayer:addKeyItem(tpz.ki.SILVER_SEA_SALT) -- (ZNM - Sarameya Island)
	    end
	    for _, zonePlayer in pairs(zonePlayers) do
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.SILVER_SEA_SALT)
            break
	    end
    end
end
