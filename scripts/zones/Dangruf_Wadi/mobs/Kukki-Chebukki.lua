-----------------------------------
-- Area: Dangruf Wadi
--  Mob: Kukki-Chebukki
-- WHM Mythic weapon fight
-----------------------------------
local ID = require("scripts/zones/Dangruf_Wadi/IDs")
require("scripts/globals/instance")
require("scripts/globals/mobs")
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------
function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, 0)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
end

function onMobDeath(mob, player, isKiller, noKiller)
end