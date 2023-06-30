-----------------------------------
-- Area: Castle Zvahl Baileys
--  Mob: Dark Spark
-- Involved in Quests: Borghertz's Hands (AF Hands, Many job)
-- !pos 63 -24 21 161
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

function onMobDeath(mob, player, isKiller)
    if
        player:getCharVar("BorghertzSparkKilled") == 0 and
        player:hasKeyItem(tpz.ki.OLD_GAUNTLETS) and
        not player:hasKeyItem(tpz.ki.SHADOW_FLAMES) and
        player:getCharVar("BorghertzCS") >= 2
    then
        player:setCharVar("BorghertzSparkKilled", 1)
    end
end
