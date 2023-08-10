-----------------------------------
-- Area: Kuftal Tunnel
--   NM: Gizerl's Ghost
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
    local BroDead = GetMobByID(17489926):isDead()
    local BroDeadTwo = GetMobByID(17489927):isDead()
    local BigBoss = GetMobByID(17489930)
    if BroDead and BroDeadTwo then
        BigBoss:spawn()
    end
end

