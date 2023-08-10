-----------------------------------
-- Area: Dynamis - Jeuno
--  Mob: Goblin Golem
-- Note: Mega Boss
-----------------------------------
require("scripts/globals/dynamis")
local ID = require("scripts/zones/Dynamis-Jeuno/IDs")
require("scripts/globals/mobs")
require("scripts/globals/status")
-----------------------------------
function onMobSpawn(mob)
    mob:setMod(tpz.mod.REFRESH, 300)
    mob:delImmunity(tpz.immunity.STUN)
    mob:delImmunity(tpz.immunity.PARALYZE)
    mob:delImmunity(tpz.immunity.BLIND)
    mob:delImmunity(tpz.immunity.POISON)
end

function onMobDeath(mob, player, isKiller, noKiller)
    dynamis.megaBossOnDeath(mob, player, isKiller)
end
