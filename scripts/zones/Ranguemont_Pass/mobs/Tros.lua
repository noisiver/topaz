-----------------------------------
-- Area: Ranguemont Pass
--   NM: Tros
-- Used in Quests: Painful Memory
-- !pos -289 -45 212 166
-----------------------------------
require("scripts/globals/keyitems")
-----------------------------------

function onMobSpawn(mob)
    mob:setMod(tpz.mod.LULLABYRES, 100)
    mob:setMod(tpz.mod.REPOSERES, 100)
end

function onMobDeath(mob, player, isKiller)
    if (player:hasKeyItem(tpz.ki.MERTAIRES_BRACELET)) then
        player:setCharVar("TrosKilled", 1)
        player:setCharVar("Tros_Timer", os.time())
    end
end
