-----------------------------------
-- Area: Apollyon NE
--  Mob: Cornu
-----------------------------------
require("scripts/globals/limbus");
-----------------------------------
function onMobSpawn(mob)
    mob:addMod(tpz.mod.EVA, 50)
end

function onMobDeath(mob, player, isKiller, noKiller)
end;

function onMobDespawn(mob)
end;
