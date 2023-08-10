-----------------------------------
-- Area: Quicksand Caves
--   NM: Antican Legatus
-----------------------------------
local ID = require("scripts/zones/Quicksand_Caves/IDs")
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
-----------------------------------
function onMobSpawn(mob)
    SetGenericNMStats(mob)
    mob:setMod(tpz.mod.UFASTCAST, 50)
    mob:setMod(tpz.mod.SDT_WATER, 115)
    mob:setMod(tpz.mod.SDT_LIGHT, 130)
    mob:setMod(tpz.mod.SDT_EARTH, 70)
    mob:setMod(tpz.mod.SDT_WIND, 130)
    mob:setMod(tpz.mod.SDT_THUNDER, 50)
    mob:setMod(tpz.mod.SDT_DARK, 50)
    mob:setMod(tpz.mod.SDT_FIRE, 130)
    mob:setMod(tpz.mod.SDT_ICE, 70)
    mob:setMod(tpz.mod.EEM_SILENCE, 30)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 20000)
    mob:setLocalVar("Guards", 0)
end

function onMobEngaged(mob, target)
    -- Despawn all Anticans in his room disable them respawning
    for v = 17629632, 17629638, 1 do
        DespawnMob(v)
        DisallowRespawn(v, true)
    end
end

function onMobFight(mob, target)
    local hitTrigger = mob:getLocalVar("TriggerHit")
    local Guard = GetMobByID(mob:getID()-1)
    local GuardTwo = GetMobByID(mob:getID()+1)
    local Guards = mob:getLocalVar("Guards")

    if mob:getHPP() <= 75 and hitTrigger == 0 then
        local zonePlayers = mob:getZone():getPlayers()
        for _, zonePlayer in pairs(zonePlayers) do
            zonePlayer:PrintToPlayer("I have no more time for your games.",0,"Legatus")
        end
        mob:useMobAbility(624) -- 2 hour "cloud" animation
        Guard:setSpawn(mob:getXPos() + math.random(1, 3), mob:getYPos(), mob:getZPos() + math.random(1, 3))
        Guard:spawn()
        Guard:updateEnmity(target)
        GuardTwo:setSpawn(mob:getXPos() + math.random(1, 3), mob:getYPos(), mob:getZPos() + math.random(1, 3))
        GuardTwo:spawn()
        GuardTwo:updateEnmity(target)
        mob:setLocalVar("TriggerHit", 1)
        mob:setLocalVar("Guards", 1)
        --printf("Spawning Guards 75");
    end
    if mob:getHPP() <= 50 and hitTrigger == 1 then
        local zonePlayers = mob:getZone():getPlayers()
        for _, zonePlayer in pairs(zonePlayers) do
            zonePlayer:PrintToPlayer("I have no more time for your games.",0,"Legatus")
        end
        mob:useMobAbility(624) -- 2 hour "cloud" animation
        mob:addMod(tpz.mod.ATTP, 25)
        mob:addMod(tpz.mod.ACC, 50)
        mob:setMod(tpz.mod.DOUBLE_ATTACK, 20)
        mob:setDelay(3000)
        Guard:setSpawn(mob:getXPos() + math.random(1, 3), mob:getYPos(), mob:getZPos() + math.random(1, 3))
        Guard:spawn()
        Guard:updateEnmity(target)
        GuardTwo:setSpawn(mob:getXPos() + math.random(1, 3), mob:getYPos(), mob:getZPos() + math.random(1, 3))
        GuardTwo:spawn()
        GuardTwo:updateEnmity(target)
        mob:setLocalVar("TriggerHit", 2)
        mob:setLocalVar("Guards", 1)
        --printf("Spawning Guards 50");
    end
    if mob:getHPP() <= 25 and hitTrigger == 2 then
        local zonePlayers = mob:getZone():getPlayers()
        for _, zonePlayer in pairs(zonePlayers) do
            zonePlayer:PrintToPlayer("I have no more time for your games.",0,"Legatus")
        end
        mob:useMobAbility(624) -- 2 hour "cloud" animation
        mob:addMod(tpz.mod.ATTP, 25)
        mob:addMod(tpz.mod.ACC, 50)
        mob:setMod(tpz.mod.TRIPLE_ATTACK, 20)
        mob:setDelay(2000)
        Guard:setSpawn(mob:getXPos() + math.random(1, 3), mob:getYPos(), mob:getZPos() + math.random(1, 3))
        Guard:spawn()
        Guard:updateEnmity(target)
        GuardTwo:setSpawn(mob:getXPos() + math.random(1, 3), mob:getYPos(), mob:getZPos() + math.random(1, 3))
        GuardTwo:spawn()
        GuardTwo:updateEnmity(target)
        mob:setLocalVar("TriggerHit", 3)
        mob:setLocalVar("Guards", 1)
        --printf("Spawning Guards 25");
    end

    if Guards == 0 then
        --printf("Protective shell removed");
        mob:setMod(tpz.mod.REGEN, 0)
        mob:setMod(tpz.mod.UDMGPHYS, 0)
        mob:setMod(tpz.mod.UDMGRANGE, 0)
        mob:setMod(tpz.mod.UDMGMAGIC, 0)
        mob:setMobMod(tpz.mobMod.NO_MOVE, 0)
        mob:SetAutoAttackEnabled(true)
        mob:SetMobAbilityEnabled(true)
        mob:SetMagicCastingEnabled(true)
    end

    if Guards == 1  then
        --printf("Protective Shell");
        mob:setMod(tpz.mod.REGEN, 300)
        mob:setMod(tpz.mod.UDMGPHYS, -100)
        mob:setMod(tpz.mod.UDMGRANGE, -100)
        mob:setMod(tpz.mod.UDMGMAGIC, -100)
        mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
        mob:SetAutoAttackEnabled(false)
        mob:SetMobAbilityEnabled(false)
        mob:SetMagicCastingEnabled(false)
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
    -- Allow Anticans in his room to respawn
    for v = 17629632, 17629638, 1 do
        DisallowRespawn(v, false)
    end
end
