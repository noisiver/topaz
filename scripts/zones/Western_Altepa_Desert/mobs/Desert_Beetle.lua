-----------------------------------
-- Area: Western Altepa Desert
--  Mob: Desert Beetle
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobFight(mob, target)
    local TeleportTimer = mob:getLocalVar("TeleportTimer")
	local BattleTime = mob:getBattleTime()
    -- Teleport to target every 30s if out of range
    if mob:checkDistance(target) > 10 and BattleTime >= TeleportTimer then
        printf("teleportin to target")
        local targetPos = target:getPos()
        mob:setPos(targetPos.x, targetPos.y, targetPos.z)
        mob:setLocalVar("TeleportTimer", BattleTime + 30)
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 136, 1, tpz.regime.type.FIELDS)
end
