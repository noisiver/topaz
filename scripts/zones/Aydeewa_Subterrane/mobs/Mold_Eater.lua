-----------------------------------
-- Area: Aydeewa Subterrane
--  Mob: Mold Eater
-----------------------------------
mixins = {require("scripts/mixins/families/worm")}
require("scripts/globals/keyitems")
require("scripts/globals/utils")
local ID = require("scripts/zones/Aydeewa_Subterrane/IDs")
------------------------------
function onMobDeath(mob, player, isKiller, noKiller)
    if isKiller or noKiller then
        if math.random(1,100) <= 5 then
            utils.givePartyKeyItem(player, tpz.ki.SILVER_SEA_SALT)
        end
    end
end
