------------------------------
-- Area: Newton Movalpolos
--   PH for  Swashstox Beadblinker
------------------------------
require("scripts/globals/mobs")
require("scripts/globals/status")
local ID = require("scripts/zones/Newton_Movalpolos/IDs")
-----------------------------------
function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.SWASHTOX_BEADBLINKER_PH, 20, 7200) -- 2hr
end