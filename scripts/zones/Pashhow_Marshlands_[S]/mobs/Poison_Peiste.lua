-----------------------------------
-- Area: Pashhow Marshlands [S]
--   ANNM
--   NM: Poison Peiste
--  !addkeyitem BLUE_LABELED_CRATE
-----------------------------------
require("scripts/globals/annm")
require("scripts/globals/status")
mixins = {require("scripts/mixins/families/peiste")}
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
