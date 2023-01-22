------------------------------
-- Area: Mount Zhayolm
--   NM: Sulphuric_Jagil
------------------------------
require("scripts/globals/status")
require("scripts/globals/keyitems")
local ID = require("scripts/zones/Mount_Zhayolm/IDs")
------------------------------
function onMobSpawn(mob)
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 25)
end

function onMobDeath(mob, player, isKiller)
    if math.random(1,100) <= 5 then
	    local zonePlayers = mob:getZone():getPlayers()
	    for _, zonePlayer in pairs(zonePlayers) do
		    zonePlayer:addKeyItem(tpz.ki.SICKLEMOON_SALT) -- (ZNM - Tinnin Island)
	    end
	    for _, zonePlayer in pairs(zonePlayers) do
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.SICKLEMOON_SALT)
            break
	    end
    end
end
