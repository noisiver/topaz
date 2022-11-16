-----------------------------------
-- Area: Arrapago Remnants
--   NM: Armored Chariot
-- ID: 17080585
-----------------------------------
local ID = require("scripts/zones/Arrapago_Remnants/IDs")
require("scripts/globals/instance")
require("scripts/globals/status")
require("scripts/globals/salvage")
require("scripts/globals/items")
require("scripts/globals/mobs")
require("scripts/globals/titles")
-----------------------------------
function onMobSpawn(mob)
    mob:setMod(tpz.mod.DEFP, 25)
    mob:setMobMod(tpz.mobMod.NO_ROAM, 1)
end

function onMobDeath(mob, player, isKiller, noKiller)
    player:addTitle(tpz.title.SUN_CHARIOTEER)
    local instance = mob:getInstance()
    instance:setStage(8)
end
