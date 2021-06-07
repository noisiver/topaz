-----------------------------------
-- Area: Throne Room
--  Mob: Shadow of Rage
-- Mission 9-2 BCNM Fight
-----------------------------------
require("scripts/globals/status")
-----------------------------------
function onMobFight(mob, target)
    mob:addMod(tpz.mod.ATTP, 200)
    mob:setMod(tpz.mod.REGAIN, 1000)
end

function onMobDeath(mob, player, isKiller)
end

function onEventUpdate(player, csid, option)
    -- printf("updateCSID: %u", csid)
end

function onEventFinish(player, csid, option)
    -- printf("finishCSID: %u", csid)
end
