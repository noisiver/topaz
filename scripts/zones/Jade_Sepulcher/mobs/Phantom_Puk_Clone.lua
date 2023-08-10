-----------------------------------
-- Area: Jade Sepulcher
-- MOB: Phantom Puk Clone
-- ISNM3000: Shadows of the Mind
-----------------------------------
local ID = require("scripts/zones/Jade_Sepulcher/IDs")
-----------------------------------
function onMobSpawn(mob)
    mob:setMod(tpz.mod.REFRESH, 40)
    mob:setMod(tpz.mod.UDMGMAGIC, 200)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
end

function onMobDeath(mob, player, isKiller, noKiller)
end
