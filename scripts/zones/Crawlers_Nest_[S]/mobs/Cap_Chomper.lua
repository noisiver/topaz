-----------------------------------
-- Area: Crawler's Nest [S]
--   ANNM
--   NM: Cap Champer
--  !addkeyitem BLUE_LABELED_CRATE
-----------------------------------
require("scripts/globals/annm")
require("scripts/globals/status")
-----------------------------------
function onMobSpawn(mob)
    tpz.annm.PetMods(mob) 
end

function onMobFight(mob, target)
end

function onMobDeath(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
end
