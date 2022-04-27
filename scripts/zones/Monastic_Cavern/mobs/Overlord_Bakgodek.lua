-----------------------------------
-- Area: Monastic Cavern
--  Mob: Overlord Bakgodek
-- TODO: messages should be zone-wide
-----------------------------------
local ID = require("scripts/zones/Monastic_Cavern/IDs")
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/titles")
-----------------------------------
function onMobSpawn(mob)
    mob:setDamage(145)
    mob:addMod(tpz.mod.ATTP, 50)
    mob:addMod(tpz.mod.DEFP, 50) 
    mob:addMod(tpz.mod.ACC, 50) 
    mob:addMod(tpz.mod.EVA, 20)
    mob:setMod(tpz.mod.REGAIN, 0)
    mob:setMod(tpz.mod.UDMGMAGIC, 50)
    mob:setMod(tpz.mod.SDT_WATER, 150)
    mob:setMod(tpz.mod.SDT_LIGHT, 100)
    mob:setMod(tpz.mod.SDT_EARTH, 115)
    mob:setMod(tpz.mod.SDT_WIND, 115)
    mob:setMod(tpz.mod.SDT_THUNDER, 115)
    mob:setMod(tpz.mod.SDT_DARK, 115)
    mob:setMod(tpz.mod.SDT_FIRE, 50)
    mob:setMod(tpz.mod.SDT_ICE, 50)
    mob:setMod(tpz.mod.REFRESH, 400)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 20000)
    mob:setMobMod(tpz.mobMod.SKILL_LIST, 6024)
    mob:setModelId(4) -- Normal orcish form
end

function onMobRoam(mob)
    mob:setMod(tpz.mod.REGAIN, 0)
    mob:setMobMod(tpz.mobMod.SKILL_LIST, 6024)
    mob:setModelId(4) -- Normal orcish form
    mob:setLocalVar("TriggerHit", 0)
end

function onMobEngaged(mob, target)
    mob:showText(mob, ID.text.ORC_KING_ENGAGE)
    -- Despawn all Orcs in room and disable them respawning
    for v = 17391756, 17391802, 1 do
        DespawnMob(v)
        DisallowRespawn(v, true)
    end
end

function onMobFight(mob, target)
    local hitTrigger = mob:getLocalVar("TriggerHit")

    if mob:getHPP() < 50 and hitTrigger == 0 then
        local zonePlayers = mob:getZone():getPlayers()
        for _, zonePlayer in pairs(zonePlayers) do
            zonePlayer:PrintToPlayer("You are no match for me puny mithra!",0,"Bakgodek")
        end
        mob:useMobAbility(2411) -- Phantasmal Dance
        mob:setModelId(429) -- Orcish Warmachine (WOTG)
        mob:setMobMod(tpz.mobMod.SKILL_LIST, 6025)
        mob:setLocalVar("TriggerHit", 1)
    end
    if mob:getHPP() < 25 then
        mob:setMod(tpz.mod.REGAIN, 100)
    end
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(tpz.title.OVERLORD_OVERTHROWER)
    if isKiller then
        mob:showText(mob, ID.text.ORC_KING_DEATH)
    end
    -- Allow Orcs in room to respawn
    for v = 17391756, 17391802, 1 do
        DisallowRespawn(v, false)
    end
end

function onMobDespawn(mob)
    -- reset hqnm system back to the nm placeholder
    local nqId = mob:getID() - 1
    SetServerVariable("[POP]Overlord_Bakgodek", os.time() + 1) -- 0 hours
    SetServerVariable("[PH]Overlord_Bakgodek", 0)
    DisallowRespawn(mob:getID(), true)
    DisallowRespawn(nqId, false)
    UpdateNMSpawnPoint(nqId)
    GetMobByID(nqId):setRespawnTime(math.random(36000, 43200)) -- 21 to 23 hours
end
