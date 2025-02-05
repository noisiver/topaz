-----------------------------------
-- Area: Western Altepa Desert
--  Mob: Sabotender Enamorado
-----------------------------------
require("scripts/globals/missions")
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 180)
end

function onMobDeath(mob, player, isKiller, noKiller)
    if player:getCurrentMission(SANDORIA) == tpz.mission.id.sandoria.LEAUTE_S_LAST_WISHES and player:getCharVar("MissionStatus") == 2 then
        player:setCharVar("Mission6-1MobKilled", 1)
    end
end
