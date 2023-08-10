-----------------------------------
-- Area: North Gustaberg [S] 
--   ANNM
--   NM: Feeorin
--  !addkeyitem BLUE_LABELED_CRATE
-----------------------------------
require("scripts/globals/annm")
require("scripts/globals/status")
-----------------------------------
function onMobSpawn(mob)
    tpz.annm.NMMods(mob)
    mob:setMod(tpz.mod.REGAIN, 0)
end

function onMobFight(mob, target)
    mob:setMobMod(tpz.mobMod.MAGIC_COOL, 10)
    tpz.annm.PetShield(mob, 17138052, 17138057)
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.annm.SpawnChest(mob, player, isKiller)
end

function onMobDespawn(mob)
end
