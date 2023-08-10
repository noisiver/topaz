-----------------------------------
-- Area: Silver Sea Route to Nashmau (Zone 58)
--  NM: Proteus
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    SetGenericNMStats(mob)
    mob:addImmunity(tpz.immunity.SLEEP)
end

function onMobFight(mob, target)
    local TPMoveTime = mob:getLocalVar("TPMoveTime")
    local BattleTime = mob:getBattleTime()

    if TPMoveTime == 0 then
        mob:setLocalVar("TPMoveTime", 10)
    elseif BattleTime >= TPMoveTime then
        mob:useMobAbility(math.random(1713, 1717)) -- Random Apkalu TP move
        mob:setLocalVar("TPMoveTime", BattleTime + 10)
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
end