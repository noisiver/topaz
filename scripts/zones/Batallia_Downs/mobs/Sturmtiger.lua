-----------------------------------
-- Area: Batallia Downs
--  Mob: Sturmtiger
-- Involved in Quest: Chasing Quotas
-- !pos -715.882, -10.75, 65.982 (105)
-----------------------------------
require("scripts/globals/mobs")
require("scripts/globals/status")
-----------------------------------
function onMobSpawn(mob)
    SetGenericNMStats(mob)
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 50)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
end

function onMobDeath(mob, player, isKiller, noKiller)
    if (player:getCharVar("ChasingQuotas_Progress") == 5) then
        player:setCharVar("SturmtigerKilled", 1)
    end
end
