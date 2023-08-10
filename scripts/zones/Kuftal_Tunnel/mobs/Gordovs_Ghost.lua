-----------------------------------
-- Area: Kuftal Tunnel
--   NM: Gordov's Ghost
-----------------------------------
require("scripts/globals/missions")
require("scripts/globals/status")
-----------------------------------
function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 0)
end

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 180)
end

function onMobDeath(mob, player, isKiller, noKiller)
    local BroDeadTwo = GetMobByID(17489927):isDead()
    local BroDeadThree = GetMobByID(17489928):isDead()
    local BigBoss = GetMobByID(17489930)
    if BroDeadTwo and BroDeadThree then
        BigBoss:spawn()
    end
end
