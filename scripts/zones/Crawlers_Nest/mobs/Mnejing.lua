-----------------------------------
-- Area: Crawler's Nest'
--  Mob: Mnejing
-- Note: PUP mythic weapon fight
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------
function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.SHARE_TARGET, 17584515)
end

function onMobDeath(mob, player, isKiller, noKiller)
end