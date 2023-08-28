-----------------------------------
-- The Voidwalker NM System
-----------------------------------
require("scripts/globals/mobs")
require("scripts/globals/voidwalkerpos")
require("scripts/globals/items")
require("scripts/globals/keyitems")
require("scripts/globals/titles")
-----------------------------------
tpz = tpz or {}
tpz.voidwalker = tpz.voidwalker or {}

local abyssiteKeyitems =
{
    [9] = tpz.keyItem.BLACK_ABYSSITE,
    [8] = tpz.keyItem.GREY_ABYSSITE,
    [7] = tpz.keyItem.PURPLE_ABYSSITE,
    [6] = tpz.keyItem.YELLOW_ABYSSITE,
    [5] = tpz.keyItem.BROWN_ABYSSITE,
    [4] = tpz.keyItem.ORANGE_ABYSSITE,
    [3] = tpz.keyItem.BLUE_ABYSSITE,
    [2] = tpz.keyItem.COLORFUL_ABYSSITE,
    [1] = tpz.keyItem.CLEAR_ABYSSITE,
}

local abyssiteMessage =
{
    [tpz.keyItem.CLEAR_ABYSSITE]    = 0,
    [tpz.keyItem.COLORFUL_ABYSSITE] = 1,
    [tpz.keyItem.BLUE_ABYSSITE]     = 2,
    [tpz.keyItem.ORANGE_ABYSSITE]   = 2,
    [tpz.keyItem.BROWN_ABYSSITE]    = 2,
    [tpz.keyItem.YELLOW_ABYSSITE]   = 2,
    [tpz.keyItem.GREY_ABYSSITE]     = 2,
    [tpz.keyItem.BLACK_ABYSSITE]    = 3
}

local function getCurrentKIsBitsFromPlayer(player)
    local results = 0

    for i, keyitem in ipairs(abyssiteKeyitems) do
        local currentBit = 0
        if player:hasKeyItem(keyitem) then
            currentBit = 1
        end

        results = results + bit.lshift(currentBit, i - 1)
    end

    return results
end

local function getCurrentKIsFromPlayer(player)
    local results = {}

    for i, keyitem in ipairs(abyssiteKeyitems) do
        if player:hasKeyItem(keyitem) then
            table.insert(results, keyitem)
        end
    end

    return results
end

local function getMobsFromAbyssites(zoneId, abyssites)
    local results = {}

    for i, keyitem in ipairs(abyssites) do
        if
            zones[zoneId] and
            zones[zoneId].mob and
            zones[zoneId].mob.VOIDWALKER[keyitem]
        then
            for _, mobId in ipairs(zones[zoneId].mob.VOIDWALKER[keyitem]) do
                local mob = GetMobByID(mobId)

                if mob:isAlive() and mob:getLocalVar("[VoidWalker]PopedBy") == 0 then
                    table.insert(results, { mobId = mobId, keyItem = keyitem })
                end
            end
        end
    end

    return results
end

local function removeMobIdFromPos(zoneId, mobId)
    for i, pos in ipairs(tpz.voidwalker.pos[zoneId]) do
        if pos.mobId == mobId then
            tpz.voidwalker.pos[zoneId][i].mobId = nil
        end
    end
end

local function searchEmptyPos(zoneId)
    local maxPos     = #tpz.voidwalker.pos[zoneId]
    local pos        = math.random(1, maxPos)
    local currentPos = tpz.voidwalker.pos[zoneId][pos]

    if currentPos.mobId == nil then
        return pos
    else
        return searchEmptyPos(zoneId)
    end
end

local function setRandomPos(zoneId, mobId)
    local mob = GetMobByID(mobId)

    if
        not mob or
        not tpz.voidwalker.pos[zoneId]
    then
        return
    end

    local pos = searchEmptyPos(zoneId)

    tpz.voidwalker.pos[zoneId][pos].mobId = mobId
    local vPos                           = tpz.voidwalker.pos[zoneId][pos].pos

    mob:setSpawn(vPos[1], vPos[2], vPos[3])
    mob:setPos(vPos[1], vPos[2], vPos[3])
end

local getNearestMob = function(player, mobs)
    local results = {}

    for _, v in ipairs(mobs) do
        local mob      = GetMobByID(v.mobId)
        local distance = player:checkDistance(mob)

        table.insert(results, { mobId = v.mobId, keyItem = v.keyItem, distance = distance })
    end

    table.sort(results, function(a, b)
        return a.distance < b.distance
    end)

    if #results > 0 then
        return results[1]
    else
        return nil
    end
end

local getDirection = function(player, mob, distance)
    local posPlayer = player:getPos()
    local posMob    = mob:getPos()
    local diffx     = posMob.x - posPlayer.x
    local diffz     = posMob.z - posPlayer.z
    local tan       = math.atan(diffz / diffx)
    local degree    = math.deg(tan)

    if degree < 0 then
        degree = degree * -1
    end

    local minDegree = 20
    local maxDegree = 70

    -- Degree >= 70
    if degree >= maxDegree then
        if diffz >= 0 then
            return 6
        else
            return 2
        end

    -- Degree <= 20
    elseif degree <= minDegree then
        if diffx >= 0 then
            return 0
        else
            return 4
        end

    -- Degree between 20 and 70
    else
        if diffz >= 0 then
            if diffx >= 0 then
                return 7
            else
                return 5
            end
        else
            if diffx >= 0 then
                return 1
            else
                return 3
            end
        end
    end
end

-----------------------------------
-- check keyitem upgrade
-----------------------------------
local function checkUpgrade(player, mob, nextKeyItem)
    if
        player and
        mob:getZoneID() == player:getZoneID()
    then
        local zoneTextTable  = zones[mob:getZoneID()].text
        local currentKeyItem = mob:getLocalVar("[VoidWalker]PopedWith")
        local rand           = math.random(1, 10)

        if rand == 5 then
            if player:hasKeyItem(currentKeyItem) then
                player:delKeyItem(currentKeyItem)
            end

            if nextKeyItem then
                player:addKeyItem(nextKeyItem)

                if currentKeyItem == tpz.keyItem.CLEAR_ABYSSITE then
                    player:messageSpecial(zoneTextTable.VOIDWALKER_UPGRADE_KI_1, currentKeyItem, nextKeyItem)
                elseif currentKeyItem == tpz.keyItem.COLORFUL_ABYSSITE then
                    player:messageSpecial(zoneTextTable.VOIDWALKER_UPGRADE_KI_2, currentKeyItem, nextKeyItem)
                elseif nextKeyItem == tpz.keyItem.BLACK_ABYSSITE then
                    player:messageSpecial(zoneTextTable.VOIDWALKER_OBTAIN_KI, nextKeyItem)
                end
            end
        end
    end
end

-----------------------------------
-- NPC Assai Nybaem
-----------------------------------
tpz.voidwalker.npcOnTrigger = function(player, npc)
    if tpz.settings.main.ENABLE_VOIDWALKER ~= 1 then
        return
    end

    local currentKIS = getCurrentKIsBitsFromPlayer(player)
    player:startEvent(10120, currentKIS)
end

tpz.voidwalker.npcOnEventUpdate = function(player, csid, option, npc)
    local opt = bit.band(option, 0xF)

    if
        csid == 10120 and
        opt == 3
    then
        local hasGil = player:getGil() >= 1000
        local hasKi  = player:hasKeyItem(tpz.keyItem.CLEAR_ABYSSITE)

        if not hasGil then
            player:updateEvent(3)
        elseif hasKi then
            player:updateEvent(2)
        else
            player:updateEvent(1)
        end
    end
end

tpz.voidwalker.npcOnEventFinish = function(player, csid, option, npc)
    local opt = bit.band(option, 0xF)

    if csid == 10120 then
        if opt == 1 then
            local msg = require("scripts/zones/RuLude_Gardens/IDs")
            local ki  = abyssiteKeyitems[1]
            player:delGil(1000)
            player:addKeyItem(ki)
            player:messageSpecial(msg.text.KEYITEM_OBTAINED, ki)
        elseif opt == 2 then
            local numAbyssite = bit.rshift(option, 4)
            player:delKeyItem(abyssiteKeyitems[numAbyssite])
        end
    end
end

-----------------------------------
-- Zone On Init
-----------------------------------
tpz.voidwalker.zoneOnInit = function(zone)
    local zoneId         = zone:getID()
    local voidwalkerMobs = zones[zoneId].mob.VOIDWALKER

    for ki, mobs in pairs(voidwalkerMobs) do
        for _, mob in pairs(mobs) do
            setRandomPos(zoneId, mob)
        end
    end
end

local mobIsBusy = function(mob)
    local act = mob:getCurrentAction()

    return  act == tpz.act.MOBABILITY_START or
            act == tpz.act.MOBABILITY_USING or
            act == tpz.act.MOBABILITY_FINISH or
            act == tpz.act.MAGIC_START or
            act == tpz.act.MAGIC_CASTING or
            act == tpz.act.MAGIC_FINISH
end

local function doMobSkillEveryHPP(mob, every, start, mobskill, condition)
    local mobhpp = mob:getHPP()

    if
        mobhpp <= start and
        condition
    then
        local mobHppModulo   = mobhpp % every
        local startHppModulo = start % every
        local isSame         = startHppModulo == mobHppModulo

        if
            isSame and
            mob:getLocalVar('MOB_SKILL_' .. mobhpp) == 0
        then
            mob:useMobAbility(mobskill)
            mob:setLocalVar('MOB_SKILL_' .. mobhpp, 1)
        end
    end
end

local function randomly(mob, chance, between, effect, skill)
    if
        math.random(0, 100) <= chance and
        not mob:hasStatusEffect(effect) and
        os.time() > (mob:getLocalVar("MOBSKILL_TIME") + between)
    then
        mob:setLocalVar("MOBSKILL_USE", 1)
        mob:setLocalVar("MOBSKILL_TIME", os.time())
        mob:useMobAbility(skill)
    end
end

local function DespawnPet(mob)
    local zoneId = mob:getZoneID()
    local mobId  = mob:getID()

    if zones[zoneId].pet and zones[zoneId].pet[mobId] then
        local petIds = zones[zoneId].pet[mobId]

        for i, petId in ipairs(petIds) do
            local pet = GetMobByID(petId)
            DespawnMob(petId)
            pet:setSpawn(mob:getXPos(), mob:getYPos(), mob:getZPos())
            pet:setPos(mob:getXPos(), mob:getYPos(), mob:getZPos())
        end
    end
end

local modByMobName =
{
    ['Raker_Bee'] = function(mob)
        mob:addMod(tpz.mod.UDMGMAGIC, 50)
    end,

    ['Capricornus'] = function(mob)
        mob:addImmunity(tpz.immunity.PARALYZE)
    end,

    ['Yacumama'] = function(mob)
        mob:addMod(tpz.mod.MOVE, 25)
        mob:addImmunity(tpz.immunity.SLOW)
    end,

    ['Krabkatoa'] = function(mob)
        mob:addStatusEffect(tpz.effect.REGAIN, 10, 0, 0)
    end,

    ['Tammuz'] = function(mob)
        mob:addStatusEffect(tpz.effect.MIGHTY_STRIKES, 1, 0, 0)
    end,
}

local mixinByMobName =
{
    ['Capricornus'] = function(mob)
        doMobSkillEveryHPP(mob, 20, 80, tpz.jsa.MIGHTY_STRIKES, not mob:hasStatusEffect(tpz.effect.MIGHTY_STRIKES))
        if mob:hasStatusEffect(tpz.effect.MIGHTY_STRIKES) and not mobIsBusy(mob) then
            mob:useMobAbility(tpz.mob.skills.RECOIL_DIVE)
        end
        if mob:getHPP() < 50 then
            mob:setDamage(100)
        elseif mob:getHPP() < 15 then
            mob:setDamage(120)
        end
    end,

    ['Yacumama'] = function(mob)
        doMobSkillEveryHPP(mob, 20, 80, tpz.jsa.HUNDRED_FISTS, not mob:hasStatusEffect(tpz.effect.HUNDRED_FISTS))
        if mob:hasStatusEffect(tpz.effect.HUNDRED_FISTS) then
            mob:addMod(tpz.mod.MOVE, 50)
        else
            mob:addMod(tpz.mod.MOVE, 25)
        end
    end,

    ['Lamprey_Lord'] = function(mob)
        randomly(mob, 10, 60, tpz.effect.BLOOD_WEAPON, tpz.jsa.BLOOD_WEAPON)
    end,

    ['Shoggoth'] = function(mob)
        doMobSkillEveryHPP(mob, 20, 80, tpz.jsa.CHAINSPELL, not mob:hasStatusEffect(tpz.effect.CHAINSPELL))
    end,

    ['Jyeshtha'] = function(mob)
        randomly(mob, 30, 60, tpz.jsa.MIGHTY_STRIKES, tpz.jsa.MIGHTY_STRIKES)
        if
            mob:getLocalVar("MOBSKILL_USE") == 1 and
            not mob:hasStatusEffect(tpz.effect.MIGHTY_STRIKES)
        then
            mob:setLocalVar("MOBSKILL_USE", 0)
        end
    end,

    ['Blobdingnag'] = function(mob)
        doMobSkillEveryHPP(mob, 20, 82, tpz.mob.skills.CYTOKINESIS, true)
    end,

    ['Farruca_Fly'] = function(mob)
        doMobSkillEveryHPP(mob, 20, 80, tpz.jsa.PERFECT_DODGE, not mob:hasStatusEffect(tpz.effect.PERFECT_DODGE))
    end,

    ['Skuld'] = function(mob)
        doMobSkillEveryHPP(mob, 20, 80, tpz.jsa.CHAINSPELL, not mob:hasStatusEffect(tpz.effect.CHAINSPELL))
    end,

    ['Erebus'] = function(mob)
        randomly(mob, 30, 60, tpz.effect.BLOOD_WEAPON, tpz.jsa.BLOOD_WEAPON)
        if
            mob:hasStatusEffect(tpz.effect.BLOOD_WEAPON) and
            not mob:hasStatusEffect(tpz.effect.HUNDRED_FISTS)
        then
            mob:addStatusEffect(tpz.effect.HUNDRED_FISTS, 1, 0, 30)
        end
    end,

    ['Feuerunke'] = function(mob)
        randomly(mob, 30, 60, tpz.effect.HUNDRED_FISTS, tpz.jsa.HUNDRED_FISTS)
    end,

    ['Dawon'] = function(mob)
        doMobSkillEveryHPP(mob, 20, 80, tpz.jsa.PERFECT_DODGE, not mob:hasStatusEffect(tpz.effect.PERFECT_DODGE))
    end
}

-----------------------------------
-- Mob On Init
-----------------------------------
tpz.voidwalker.onMobInitialize = function(mob)
end

tpz.voidwalker.onMobSpawn = function(mob)
    local mobName = mob:getName()
    SetGenericNMStats(mob)
    mob:setMod(tpz.mod.MOVE, 50)
    mob:addImmunity(tpz.immunity.SLEEP)
    mob:addImmunity(tpz.immunity.BIND)
    mob:addImmunity(tpz.immunity.PETRIFY)
    mob:setStatus(tpz.status.INVISIBLE)
    mob:hideHP(true)
    mob:hideName(true)
    mob:untargetable(true)
    local mods = modByMobName[mobName]

    if mods then
        mods(mob)
    end
end

tpz.voidwalker.onMobFight = function(mob, target)
    local mobName = mob:getName()
    local mixin   = mixinByMobName[mobName]

    if mixin then
        mixin(mob)
    end

    local poptime = mob:getLocalVar("[VoidWalker]PopedAt")
    local now     = os.time()

    if
        mob:isSpawned() and
        (
            now > (poptime + 7200) or
            mob:checkDistance(target) > 25
        )
    then
        local zoneTextTable = zones[mob:getZoneID()].text

        target:messageSpecial(zoneTextTable.VOIDWALKER_DESPAWN)
        DespawnMob(mob:getID())
    end
end

tpz.voidwalker.onMobDisengage = function(mob)
    mob:setLocalVar("[VoidWalker]PopedBy", 0)
    mob:setLocalVar("[VoidWalker]checkPopedBy", 0)
    mob:setLocalVar("[VoidWalker]PopedWith", 0)
    mob:setLocalVar("[VoidWalker]PopedAt", 0)
    mob:setLocalVar("MOBSKILL_USE", 0)
    mob:setLocalVar("MOBSKILL_TIME", 0)
    DespawnPet(mob)
    mob:setStatus(tpz.status.INVISIBLE)
    mob:hideHP(true)
    mob:hideName(true)
    mob:untargetable(true)
end

tpz.voidwalker.onMobDespawn = function(mob)
    local zoneId = mob:getZoneID()
    local mobId  = mob:getID()

    removeMobIdFromPos(zoneId, mobId)
    setRandomPos(zoneId, mobId)
    mob:setLocalVar("[VoidWalker]PopedBy", 0)
    mob:setLocalVar("[VoidWalker]checkPopedBy", 0)
    mob:setLocalVar("[VoidWalker]PopedWith", 0)
    mob:setLocalVar("[VoidWalker]PopedAt", 0)
    mob:setLocalVar("MOBSKILL_USE", 0)
    mob:setLocalVar("MOBSKILL_TIME", 0)
    DespawnPet(mob)
end

tpz.voidwalker.onMobDeath = function(mob, player, optParams, keyItem)
    if player then
        local popkeyitem = mob:getLocalVar("[VoidWalker]PopedWith")

        if optParams.isKiller then
            local playerpoped = GetPlayerByID(mob:getLocalVar("[VoidWalker]PopedBy"))
            local alliance    = player:getAlliance()
            local outOfParty  = true

            for _, member in pairs(alliance) do
                if member:getID() == playerpoped:getID() then
                    outOfParty = false
                    break
                end
            end

            if
                outOfParty and
                not playerpoped:hasKeyItem(keyItem)
            then
                checkUpgrade(playerpoped, mob, keyItem)
            end
        end

        if
            player:hasKeyItem(popkeyitem) and
            not player:hasKeyItem(keyItem)
        then
            checkUpgrade(player, mob, keyItem)
        end
    end
end

-----------------------------------
-- onHealing : trigg when player /heal
-----------------------------------
tpz.voidwalker.onHealing = function(player)
    local zoneId        = player:getZoneID()
    local zoneTextTable = zones[zoneId].text
    local abyssites     = getCurrentKIsFromPlayer(player)

    if
        #abyssites == 0 or
        not zones[zoneId].mob or
        not zones[zoneId].mob.VOIDWALKER
    then
        return
    end

    local mobs       = getMobsFromAbyssites(zoneId, abyssites)
    local mobNearest = getNearestMob(player, mobs)

    if not mobNearest then
        player:messageSpecial(zoneTextTable.VOIDWALKER_NO_MOB, abyssites[1])
    elseif mobNearest.distance <= 4 then
        local mob = GetMobByID(mobNearest.mobId)
        mob:setLocalVar("[VoidWalker]PopedBy", player:getID())
        mob:setLocalVar("[VoidWalker]PopedWith", mobNearest.keyItem)
        mob:setLocalVar("[VoidWalker]PopedAt", os.time())

        if
            mobNearest.keyItem ~= tpz.keyItem.CLEAR_ABYSSITE and
            mobNearest.keyItem ~= tpz.keyItem.COLORFUL_ABYSSITE
        then
            player:delKeyItem(mobNearest.keyItem)
            player:messageSpecial(zoneTextTable.VOIDWALKER_BREAK_KI, mobNearest.keyItem)
        else
            player:messageSpecial(zoneTextTable.VOIDWALKER_SPAWN_MOB)
            mob:hideHP(false)
        end

        mob:hideName(false)
        mob:untargetable(false)
        mob:setStatus(tpz.status.UPDATE)
        mob:updateClaim(player)

    elseif mobNearest.distance >= 300 then
        player:messageSpecial(zoneTextTable.VOIDWALKER_MOB_TOO_FAR, mobNearest.keyItem)

    else
        local mob       = GetMobByID(mobNearest.mobId)
        local direction = getDirection(player, mob, mobNearest.distance)
        player:messageSpecial(zoneTextTable.VOIDWALKER_MOB_HINT, abyssiteMessage[mobNearest.keyItem], direction, mobNearest.distance, mobNearest.keyItem)
    end
end