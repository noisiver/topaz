-----------------------------------
-- Area: Bostaunieux Oubliette (167)
--   NM: Sewer Syrup
-----------------------------------
require("scripts/globals/hunts")
require("scripts/globals/mobs")
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    SetGenericNMStats(mob)
    mob:setMod(tpz.mod.UDMGPHYS, -75)
    mob:setMod(tpz.mod.UDMGMAGIC, 100)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 9500)
end

function onMobInitialize(mob)
end

function onAdditionalEffect(mob, target, damage)
end

function onMobDeath(mob, player, isKiller, noKiller)
end
