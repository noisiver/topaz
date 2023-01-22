------------------------------
-- Area: Arrapago Reef
--   NM: Dweomershell
------------------------------
require("scripts/globals/status")
require("scripts/globals/keyitems")
local ID = require("scripts/zones/Arrapago_Reef/IDs")
------------------------------

function onMobFight(mob, target)
    mob:setDropID(2107)
end

function onMobDeath(mob, player, isKiller)
    if math.random(1,100) <= 5 then
	    local zonePlayers = mob:getZone():getPlayers()
	    for _, zonePlayer in pairs(zonePlayers) do
		    zonePlayer:addKeyItem(tpz.ki.CYAN_DEEP_SALT) -- (ZNM - Tyger Island)
	    end
	    for _, zonePlayer in pairs(zonePlayers) do
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.CYAN_DEEP_SALT)
            break
	    end
    end
end
