-----------------------------------
-- Area: FeiYin
--   NM: Dabotz's Ghost
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    SetGenericNMStats(mob)
end

function onMobDeath(mob, player, isKiller)
    if player:hasKeyItem(tpz.ki.AQUAFLORA3) then
        player:setCharVar("DabotzKilled", 1)
    end
end
