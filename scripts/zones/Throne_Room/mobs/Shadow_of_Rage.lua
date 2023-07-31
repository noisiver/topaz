-----------------------------------
-- Area: Throne Room
--  Mob: Shadow of Rage
-- Mission 9-2 BCNM Fight
-----------------------------------
require("scripts/globals/status")
-----------------------------------
function onMobSpawn(mob)
     mob:addMod(tpz.mod.ATTP, 200)
     mob:addMod(tpz.mod.SLEEPRESTRAIT, 100)
     mob:addMod(tpz.mod.LULLABYRESTRAIT, 100)
     mob:setMobMod(tpz.mobMod.NO_DROPS, 0)
end

function onMobFight(mob, target)
    mob:setMod(tpz.mod.REGAIN, 1000)
end

function onMobDeath(mob, player, isKiller, noKiller)
end

function onEventUpdate(player, csid, option)
    -- printf("updateCSID: %u", csid)
end

function onEventFinish(player, csid, option)
    -- printf("finishCSID: %u", csid)
end
