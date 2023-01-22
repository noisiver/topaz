------------------------------
-- Area: Mount Zhayolm
--   NM: Sulphuric_Jagil
------------------------------
require("scripts/globals/status")
require("scripts/globals/keyitems")
require("scripts/globals/utils")
local ID = require("scripts/zones/Mount_Zhayolm/IDs")
------------------------------
function onMobDeath(mob, player, isKiller, noKiller)
    if isKiller or noKiller then
        if math.random(1,100) <= 5 then
            utils.givePartyKeyItem(player, tpz.ki.SICKLEMOON_SALT)
        end
    end
end
