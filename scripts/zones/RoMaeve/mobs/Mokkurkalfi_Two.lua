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
    local mobID = mob:getID()
    local Bro = GetMobByID(17276929)
    local Self = GetMobByID(mobID)
    local HPvariance = bro
    mob:addMod(tpz.mod.ATTP, 25)
    mob:addMod(tpz.mod.DEFP, 35)
    mob:addMod(tpz.mod.ACC, 25) 
    mob:addMod(tpz.mod.EVA, 30)
    DespawnMob(mob:getID(), 180)
end

function onMobFight(mob, target)
    local mobID = mob:getID()
    local Bro = GetMobByID(17276929)
    local Self = GetMobByID(mobID)
    local HPvariance = (Self:getHPP() - Bro:getHPP())
    if (Self:getHPP() > Bro:getHPP()  == true) then
        mob:setMod(tpz.mod.HASTE_MAGIC, mob:getMod(tpz.mod.HASTE_MAGIC) + (HPvariance * 500))
    else
        mob:setMod(tpz.mod.HASTE_MAGIC, mob:getMod(tpz.mod.HASTE_MAGIC) + 0)
    end
    mob:setMobMod(tpz.mobMod.SHARE_TARGET, 17276929)
end

function onMobDeath(mob, player, isKiller)
    if player:getCurrentMission(BASTOK) == tpz.mission.id.bastok.THE_FINAL_IMAGE and player:getCharVar("MissionStatus") == 1 then
        player:setCharVar("Mission7-1MobKilled", 1)
    end
end
