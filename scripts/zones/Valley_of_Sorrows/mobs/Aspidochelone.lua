-----------------------------------
-- Area: Valley of Sorrows
--  HNM: Aspidochelone
-----------------------------------
local ID = require("scripts/zones/Valley_of_Sorrows/IDs")
mixins = {require("scripts/mixins/rage")}
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/titles")
-----------------------------------
function onMobSpawn(mob)
    mob:addMod(tpz.mod.ATTP, 33)
    mob:addMod(tpz.mod.DEFP, 100)
    mob:addMod(tpz.mod.EVA, 35)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 20000)
    if LandKingSystem_NQ > 0 or LandKingSystem_HQ > 0 then
        GetNPCByID(ID.npc.ADAMANTOISE_QM):setStatus(tpz.status.DISAPPEAR)
    end
    mob:setLocalVar("[rage]timer", 3600) -- 60 minutes
end

function onMobFight(mob, target)
    local hitTrigger = mob:getLocalVar("TriggerHit")
    local Dmg = mob:getLocalVar("Dmg")
    local Shell = mob:getLocalVar("Shell")

    mob:addListener("TAKE_DAMAGE", "URAGNITE_TAKE_DAMAGE", function(mob, amount, attacker, attackType, damageType)
        if Shell == 1 and amount > 5000  then
        mob:setLocalVar("Dmg", 1)
        end
    end)

    if mob:getHPP() <= 75 and hitTrigger == 0 and Shell == 0 then
        mob:setLocalVar("TriggerHit", 1)
        mob:setLocalVar("Shell", 1)
    end
    if mob:getHPP() <= 50 and hitTrigger == 1 and Shell == 0  then
        mob:setLocalVar("TriggerHit", 2)
        mob:setLocalVar("Shell", 1)
    end
    if mob:getHPP() <= 25 and hitTrigger == 2 and Shell == 0  then
        mob:setLocalVar("TriggerHit", 3)
        mob:setLocalVar("Shell", 1)
    end

    if Shell == 1  then
        mob:setMod(tpz.mod.REGEN, 300)
        mob:setMod(tpz.mod.UDMGPHYS, -95)
        mob:setMod(tpz.mod.UDMGRANGE, -95)
        mob:AnimationSub(1)
        mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
        mob:SetAutoAttackEnabled(false)
        mob:SetMobAbilityEnabled(false)
        mob:setLocalVar("Shell", 2)
    end
    if Shell == 2 and Dmg == 1  then
        mob:setMod(tpz.mod.REGEN, 0)
        mob:setMod(tpz.mod.UDMGPHYS, 0)
        mob:setMod(tpz.mod.UDMGRANGE, 0)
        mob:AnimationSub(0)
        mob:setMobMod(tpz.mobMod.NO_MOVE, 0)
        mob:SetAutoAttackEnabled(true)
        mob:SetMobAbilityEnabled(true)
        mob:setLocalVar("Shell", 0)
        mob:setLocalVar("Dmg", 0)
    end
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(tpz.title.ASPIDOCHELONE_SINKER)
end

function onMobDespawn(mob)
    -- Set Aspidochelone's Window Open Time
    if LandKingSystem_HQ ~= 1 then
        local wait = 72 * 3600
        SetServerVariable("[POP]Aspidochelone", os.time() + wait) -- 3 days
        if LandKingSystem_HQ == 0 then -- Is time spawn only
            DisallowRespawn(mob:getID(), true)
        end
    end

    -- Set Adamantoise's spawnpoint and respawn time (21-24 hours)
    if LandKingSystem_NQ ~= 1 then
        SetServerVariable("[PH]Aspidochelone", 0)
        DisallowRespawn(ID.mob.ADAMANTOISE, false)
        UpdateNMSpawnPoint(ID.mob.ADAMANTOISE)
        GetMobByID(ID.mob.ADAMANTOISE):setRespawnTime(75600 + math.random(0, 6) * 1800) -- 21 - 24 hours with half hour windows
    end
end
