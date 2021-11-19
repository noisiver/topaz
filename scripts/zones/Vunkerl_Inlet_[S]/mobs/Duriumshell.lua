-----------------------------------
-- Area: Vunkerl Inlet [S]
--  Mob: Duriumshell
-- Note:Merit camp
-----------------------------------
require("scripts/globals/mobs")
-----------------------------------
function onMobSpawn(mob)
	mob:addMod(tpz.mod.DEF, 60)
end

function onMobDeath(mob, player, isKiller)
end

