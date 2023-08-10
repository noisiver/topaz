-----------------------------------
-- Area: The Eldieme Necropolis [S] (175)
--   ANNM
--   NM: Dhoul
--  !addkeyitem RED_LABELED_CRATE
-----------------------------------
require("scripts/globals/annm")
require("scripts/globals/status")
-----------------------------------
function onMobSpawn(mob)
    mob:setMod(tpz.mod.SDT_DARK, 130)
    tpz.annm.PetMods(mob) 
end

function onMobFight(mob, target)
end

function onMobDeath(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
end
