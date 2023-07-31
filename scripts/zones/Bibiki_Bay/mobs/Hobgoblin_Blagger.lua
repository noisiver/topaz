-----------------------------------
-- Area: Bibiki Bay
--  Mob: Hobgoblin Blagger
-- Job: THF
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:setMod(tpz.mod.TRIPLE_ATTACK, 5)
end

function onMobDeath(mob, player, isKiller, noKiller)
end