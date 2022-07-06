-----------------------------------
-- Area: East Ronfaure [S]
--   ANNM
--   NM: Queenbug
--  !addkeyitem RED_LABELED_CRATE
-----------------------------------
require("scripts/globals/annm")
require("scripts/globals/status")
-----------------------------------
function onMobSpawn(mob)
    tpz.annm.NMMods(mob) 
end

function onMobFight(mob, target)
    tpz.annm.PetShield(mob, 17121699, 17121704)
end

function onMobDeath(mob, player, isKiller)
    tpz.annm.SpawnChest(mob, player, isKiller)
end

function onMobDespawn(mob)
end
