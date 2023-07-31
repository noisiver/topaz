-----------------------------------
-- Area: Grauberg [S]
--   ANNM
--   NM: Simorg
--  !addkeyitem BLUE_LABELED_CRATE
-----------------------------------
require("scripts/globals/annm")
require("scripts/globals/status")
-----------------------------------
function onMobSpawn(mob)
    tpz.annm.NMMods(mob) 
end

function onMobFight(mob, target)
    if mob:getHPP() > 50 then
        mob:setMod(tpz.mod.REGAIN, 0)
    else
        mob:setMod(tpz.mod.REGAIN, 250)
    end
    tpz.annm.PetShield(mob, 17142114, 17142119)
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.annm.SpawnChest(mob, player, isKiller)
end

function onMobDespawn(mob)
end
