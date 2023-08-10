-----------------------------------
-- Area: RoMaeve
--   NM: Martinet
-----------------------------------
require("scripts/globals/hunts")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.AUTO_SPIKES, 1)
    mob:addStatusEffect(tpz.effect.SHOCK_SPIKES, 55, 0, 0)
    mob:getStatusEffect(tpz.effect.SHOCK_SPIKES):setFlag(tpz.effectFlag.DEATH)
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.hunts.checkHunt(mob, player, 329)
end

function onMobDespawn(mob)
    -- UpdateNMSpawnPoint(mob:getID())
    -- mob:setRespawnTime(math.random((?), (?))) -- Uncertain repop time
end
