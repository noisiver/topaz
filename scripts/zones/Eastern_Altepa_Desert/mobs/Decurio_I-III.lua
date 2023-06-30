-----------------------------------
-- Area: Eastern Altepa Desert
--  Mob: Decurio I-III
-- Involved in Quest: A Craftsman's Work
-- !pos X:113 Y:-7 Z:-72 (106)
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/mobs")
require("scripts/globals/status")
-----------------------------------
function onMobSpawn(mob)
    SetGenericNMStats(mob)
    mob:setMod(tpz.mod.EEM_SILENCE, 5)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
end

function onMobDeath(mob, player, isKiller)
    if player:getCharVar("aCraftsmanWork") == 1 then
        player:setCharVar("Decurio_I_IIIKilled", 1)
    end
end
