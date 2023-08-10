-----------------------------------
-- Area: FeiYin
--   NM: Dabotz's Ghost
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    SetGenericNMStats(mob)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
end

function onMobDeath(mob, player, isKiller, noKiller)
    if player:hasKeyItem(tpz.ki.AQUAFLORA3) then
        player:setCharVar("DabotzKilled", 1)
    end
end
