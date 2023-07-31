-----------------------------------
-- Area: RoMaeve
--   NM: Mokkurkalfi
-- Note: spawned during mission "The Final Image"
-----------------------------------
local ID = require("scripts/zones/RoMaeve/IDs")
require("scripts/globals/missions")
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 180)
end

function onMobSpawn(mob)
    mob:setMod(tpz.mod.SLEEPRESTRAIT, 100)
    mob:setMod(tpz.mod.LULLABYRESTRAIT, 100)
    mob:setMod(tpz.mod.BINDRESTRAIT, 100)
    mob:addMod(tpz.mod.ATTP, 25)
    mob:addMod(tpz.mod.DEFP, 35)
    mob:addMod(tpz.mod.ACC, 25) 
    mob:addMod(tpz.mod.EVA, 30)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 0)
	mob:setLocalVar("hastemod", 0)
    DespawnMob(mob:getID(), 180)
end

function onMobFight(mob, target)
    local mobID = mob:getID()
    local Bro = GetMobByID(17276930)
    local Self = GetMobByID(mobID)
    local HPvariance = math.abs(Bro:getHPP() - Self:getHPP())
    local lastVariance = mob:getLocalVar("hastemod")
    local BroDead = GetMobByID(17276930):isDead()
    if (HPVariance ~= lastVariance) then
        mob:setMod(tpz.mod.HASTE_MAGIC, mob:getMod(tpz.mod.HASTE_MAGIC) + ((HPvariance - lastVariance) * 300))
        mob:setLocalVar("hastemod", HPvariance)
    end
    if BroDead then
            mob:setLocalVar("hastemod", 0)
    end
    mob:setMobMod(tpz.mobMod.SHARE_TARGET, 17276929)
end

function onMobDeath(mob, player, isKiller, noKiller)
    if player:getCurrentMission(BASTOK) == tpz.mission.id.bastok.THE_FINAL_IMAGE and player:getCharVar("MissionStatus") == 1 then
        player:setCharVar("Mission7-1MobKilled", 1)
    end
end
