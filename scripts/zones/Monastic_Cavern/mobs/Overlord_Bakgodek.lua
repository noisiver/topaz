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
    mob:addMod(tpz.mod.ATTP, 50)
    mob:addMod(tpz.mod.DEFP, 50) 
    mob:addMod(tpz.mod.ACC, 50) 
    mob:addMod(tpz.mod.EVA, 20)
    mob:setMod(tpz.mod.UDMGMAGIC, 50)
    mob:setMod(tpz.mod.SDT_WATER, 150)
    mob:setMod(tpz.mod.SDT_LIGHT, 115)
    mob:setMod(tpz.mod.SDT_EARTH, 115)
    mob:setMod(tpz.mod.SDT_WIND, 115)
    mob:setMod(tpz.mod.SDT_THUNDER, 115)
    mob:setMod(tpz.mod.SDT_DARK, 115)
    mob:setMod(tpz.mod.SDT_FIRE, 50)
    mob:setMod(tpz.mod.SDT_ICE, 100)
    mob:setMod(tpz.mod.REFRESH, 400)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 20000)
end

function onMobFight(mob, target)
    local hitTrigger = mob:getLocalVar("TriggerHit")

    if mob:getHPP() <= 50 and hitTrigger == 0 then
        target:PrintToPlayer("You are no match for me puny mithra!",0,"Bakgodek")
        mob:useMobAbility(2411) -- Phantasmal Dance
        mob:setModelId(429) -- Orcish Warmachine (WOTG)
        mob:setMobMod(tpz.mobMod.SKILL_LIST, 6025)
        mob:setLocalVar("TriggerHit", 1)
    end
end

function onMobEngaged(mob, target)
    mob:showText(mob, ID.text.ORC_KING_ENGAGE)
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(tpz.title.OVERLORD_OVERTHROWER)
    if isKiller then
        mob:showText(mob, ID.text.ORC_KING_DEATH)
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
    GetMobByID(nqId):setRespawnTime(math.random(75600, 82800)) -- 21 to 23 hours
end
