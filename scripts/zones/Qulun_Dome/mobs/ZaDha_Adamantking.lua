-----------------------------------
-- Area: Qulun Dome
--   NM: Za'Dha Adamantking
-- TODO: messages should be zone-wide
-----------------------------------
local ID = require("scripts/zones/Qulun_Dome/IDs")
require("scripts/globals/titles")
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onMobSpawn(mob)
    mob:setDamage(130)
    mob:addMod(tpz.mod.ATTP, 25)
    mob:addMod(tpz.mod.ACC, 20) 
    mob:addMod(tpz.mod.EVA, 20)
    mob:setMod(tpz.mod.DEF, 10000)
    mob:setMod(tpz.mod.UDMGPHYS, -50)
    mob:setMod(tpz.mod.UFASTCAST, 50)
    mob:setSpellList(1)
    mob:setMod(tpz.mod.SDT_WATER, 50)
    mob:setMod(tpz.mod.SDT_LIGHT, 50)
    mob:setMod(tpz.mod.SDT_EARTH, 50)
    mob:setMod(tpz.mod.SDT_WIND, 50)
    mob:setMod(tpz.mod.SDT_THUNDER, 50)
    mob:setMod(tpz.mod.SDT_DARK, 50)
    mob:setMod(tpz.mod.SDT_FIRE, 50)
    mob:setMod(tpz.mod.SDT_ICE, 50)
    mob:setMod(tpz.mod.REFRESH, 400)
    mob:setMobMod(tpz.mobMod.MAGIC_COOL, 15)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 20000)
end

function onMobEngaged(mob, target)
    mob:showText(mob, ID.text.QUADAV_KING_ENGAGE)
    -- Despawn all Quadavs in room and disable them respawning
    for v = 17383425, 17383442, 1 do
        DespawnMob(v)
        DisallowRespawn(v, true)
    end
    -- Reset stats / variables on disengage
    mob:setMod(tpz.mod.SDT_WATER, 50)
    mob:setMod(tpz.mod.SDT_LIGHT, 50)
    mob:setMod(tpz.mod.SDT_EARTH, 50)
    mob:setMod(tpz.mod.SDT_WIND, 50)
    mob:setMod(tpz.mod.SDT_THUNDER, 50)
    mob:setMod(tpz.mod.SDT_DARK, 50)
    mob:setMod(tpz.mod.SDT_FIRE, 50)
    mob:setMod(tpz.mod.SDT_ICE, 50)
    mob:setLocalVar("twohourTime", 0)
    mob:setLocalVar("wingsTime", 0)
    mob:setLocalVar("wingsDown", 0)
end

function onMobFight(mob, target)
    local battletime = mob:getBattleTime()
    local twohourTime = mob:getLocalVar("twohourTime")
    local wingsTime = mob:getLocalVar("wingsTime")
    local wingsDown = mob:getLocalVar("wingsDown")
    local sdtRNG = mob:getLocalVar("sdtRNG")

    if twohourTime == 0 then
        -- printf("Setting two hour time");
        mob:setLocalVar("twohourTime", math.random(30, 45))
    elseif battletime >= twohourTime and wingsDown == 0 then
        -- printf("Wings Up");
        mob:useMobAbility(624) -- 2 hour "cloud" animation
        local zonePlayers = mob:getZone():getPlayers()
        for _, zonePlayer in pairs(zonePlayers) do
            zonePlayer:PrintToPlayer("Your kind needs to be eradicated from existence!",0,"Za'Dha")
        end
        mob:setLocalVar("wingsTime", battletime + 10)
        mob:setLocalVar("wingsDown", 1)
        mob:setLocalVar("sdtRNG", math.random(1, 6))
    end

    if battletime >= wingsTime and wingsDown == 1 then
        -- printf("Wings Down");
        mob:setLocalVar("twohourTime", battletime + math.random(90, 120))
        mob:setLocalVar("wingsTime", 0)
        mob:setLocalVar("wingsDown", 0)
    end

    if sdtRNG == 1 then
        mob:setSpellList(439) -- Thunder
        mob:setMod(tpz.mod.SDT_WATER, 50)
        mob:setMod(tpz.mod.SDT_LIGHT, 50)
        mob:setMod(tpz.mod.SDT_EARTH, 150)
        mob:setMod(tpz.mod.SDT_WIND, 50)
        mob:setMod(tpz.mod.SDT_THUNDER, 50)
        mob:setMod(tpz.mod.SDT_DARK, 50)
        mob:setMod(tpz.mod.SDT_FIRE, 50)
        mob:setMod(tpz.mod.SDT_ICE, 50)
    end
    if sdtRNG == 2 then
        mob:setSpellList(441) -- Fire
        mob:setMod(tpz.mod.SDT_WATER, 150)
        mob:setMod(tpz.mod.SDT_LIGHT, 50)
        mob:setMod(tpz.mod.SDT_EARTH, 50)
        mob:setMod(tpz.mod.SDT_WIND, 50)
        mob:setMod(tpz.mod.SDT_THUNDER, 50)
        mob:setMod(tpz.mod.SDT_DARK, 50)
        mob:setMod(tpz.mod.SDT_FIRE, 50)
        mob:setMod(tpz.mod.SDT_ICE, 50)
    end
    if sdtRNG == 3 then
        mob:setSpellList(440) -- Earth
        mob:setMod(tpz.mod.SDT_WATER, 50)
        mob:setMod(tpz.mod.SDT_LIGHT, 50)
        mob:setMod(tpz.mod.SDT_EARTH, 50)
        mob:setMod(tpz.mod.SDT_WIND, 150)
        mob:setMod(tpz.mod.SDT_THUNDER, 50)
        mob:setMod(tpz.mod.SDT_DARK, 50)
        mob:setMod(tpz.mod.SDT_FIRE, 50)
        mob:setMod(tpz.mod.SDT_ICE, 50)
    end
    if sdtRNG == 4 then
        mob:setSpellList(438) -- Ice
        mob:setMod(tpz.mod.SDT_WATER, 50)
        mob:setMod(tpz.mod.SDT_LIGHT, 50)
        mob:setMod(tpz.mod.SDT_EARTH, 50)
        mob:setMod(tpz.mod.SDT_WIND, 50)
        mob:setMod(tpz.mod.SDT_THUNDER, 50)
        mob:setMod(tpz.mod.SDT_DARK, 50)
        mob:setMod(tpz.mod.SDT_FIRE, 150)
        mob:setMod(tpz.mod.SDT_ICE, 50)
    end
    if sdtRNG == 5 then
        mob:setSpellList(443) -- Wind
        mob:setMod(tpz.mod.SDT_WATER, 50)
        mob:setMod(tpz.mod.SDT_LIGHT, 50)
        mob:setMod(tpz.mod.SDT_EARTH, 50)
        mob:setMod(tpz.mod.SDT_WIND, 50)
        mob:setMod(tpz.mod.SDT_THUNDER, 50)
        mob:setMod(tpz.mod.SDT_DARK, 50)
        mob:setMod(tpz.mod.SDT_FIRE, 50)
        mob:setMod(tpz.mod.SDT_ICE, 150)
    end
    if sdtRNG == 6 then
        mob:setSpellList(442) -- Water
        mob:setMod(tpz.mod.SDT_WATER, 50)
        mob:setMod(tpz.mod.SDT_LIGHT, 50)
        mob:setMod(tpz.mod.SDT_EARTH, 50)
        mob:setMod(tpz.mod.SDT_WIND, 50)
        mob:setMod(tpz.mod.SDT_THUNDER, 150)
        mob:setMod(tpz.mod.SDT_DARK, 50)
        mob:setMod(tpz.mod.SDT_FIRE, 50)
        mob:setMod(tpz.mod.SDT_ICE, 50)
    end
end

function onAdditionalEffect(mob, target, damage)
    local sdtRNG = mob:getLocalVar("sdtRNG")
    if sdtRNG == 1 then
        return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENSTONE, {chance = 100})
    elseif sdtRNG == 2 then
        return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENWATER, {chance = 100})
    elseif sdtRNG == 3 then
        return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENAERO, {chance = 100})
    elseif sdtRNG == 4 then
        return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENFIRE, {chance = 100})
    elseif sdtRNG == 5 then
        return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENBLIZZARD, {chance = 100})
    elseif sdtRNG == 6 then
        return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENTHUNDER, {chance = 100})
    else
        return 0, 0, 0 -- Just in case no variable is set
    end
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(tpz.title.ADAMANTKING_USURPER)
    if isKiller then
        mob:showText(mob, ID.text.QUADAV_KING_DEATH)
    end
    -- Allow Quadav in room to respawn
    for v = 17383425, 17383442, 1 do
        DisallowRespawn(v, false)
    end
end

function onMobDespawn(mob)
    -- reset hqnm system back to the nm placeholder
    local nqId = mob:getID() - 1
    SetServerVariable("[POP]Za_Dha_Adamantking", os.time() + 1) -- 0 hours
    SetServerVariable("[PH]Za_Dha_Adamantking", 0)
    DisallowRespawn(mob:getID(), true)
    DisallowRespawn(nqId, false)
    UpdateNMSpawnPoint(nqId)
    GetMobByID(nqId):setRespawnTime(math.random(36000, 43200)) -- 21 to 23 hours
end

function onMobWeaponSkillPrepare(mob, target)
    return 2378
end