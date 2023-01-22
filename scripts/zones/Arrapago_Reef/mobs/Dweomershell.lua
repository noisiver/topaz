------------------------------
-- Area: Arrapago Reef
--   NM: Dweomershell
------------------------------
require("scripts/globals/status")
require("scripts/globals/keyitems")
require("scripts/globals/utils")
local ID = require("scripts/zones/Arrapago_Reef/IDs")
------------------------------
function onMobDeath(mob, player, isKiller, noKiller)
    if isKiller or noKiller then
        if math.random(1,100) <= 5 then
            utils.givePartyKeyItem(player, tpz.ki.CYAN_DEEP_SALT)
        end
    end
end
