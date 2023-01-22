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
end
