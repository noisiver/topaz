-----------------------------------
-- Area: Silver Sea Route to Nashmau (Zone 58)
--  NM: Proteus
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    SetGenericNMStats(mob)
    mob:setMod(tpz.mod.TRIPLE_ATTACK, 100)
    mob:addImmunity(tpz.immunity.SLEEP)
end

function onMobDeath(mob, player, isKiller)
end