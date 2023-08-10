-----------------------------------
-- Area: Mine Shaft #2716 (Pulling The Strings)
--   NM: Moblin Fantocinniman
-----------------------------------
local ID = require("scripts/zones/Mine_Shaft_2716/IDs")
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize(mob)
    mob:addListener("TAKE_DAMAGE", "MOBLIN_FANTOCINNI_TAKE_DAMAGE", function(mob, damage, attacker, attackType, damageType)
        if mob:getLocalVar("standby") == 1 and mob:getHPP() < 99 then
            mob:messageText(mob, ID.text.OW_YOU_MAKE_ME_MAD_NOW)
            mob:setLocalVar("standby", 0)
            mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
            mob:SetAutoAttackEnabled(true)
            mob:setMobMod(tpz.mobMod.SKILL_LIST, 184)
            mob:getBattlefield():setEnemyCondition(mob, 2) -- CONDITION_WIN_REQUIREMENT
        end
    end)
end

function onMobSpawn(mob)
    mob:setLocalVar("standby", 1)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, 99)
    mob:SetAutoAttackEnabled(false)
end

function onMobSkillTarget(target, mob, skill)
    local skillId = skill:getID()
    local player = mob:getBattlefield():getPlayers()

    if skillId == 1343 or skillId == 1415 or skillId == 1417 or skillId == 1418 or skillId == 1419 then
        return player
    elseif skillId >= 1420 and skillId <= 1424 then
        return GetMobByID(mob:getID() + 2)
    elseif skillId == 1457 then
        if target:isPet() then
            return target:getMaster()
        else
            return player
        end
    end
    return target
end
function onMonsterAbilityPrepare(mob)
    return 1457
end

function onMobFight(mob, target)
mob:setMod(tpz.mod.REGAIN, 500) -- normaly 100, set high for testing
 --[[   local dice_rolls =
    {
        -- Ability ID, weight, target type (0 = Fantoccini, 1 = Fantoccini's Target, 2 = Player)
        {1343, 75, 1}, -- gives mp to fanto's target for param amount: 44? message id 110? havign trouble reading packets (assumed usable only in fights with mob mp)
        {1415, 75, 1}, -- heals fanto's target for param amount: param: 407 messageID: 238
        {1417, 50, 1}, -- gave attack boost to fanto's target: param: 91 messageId: 194
        {1418, 50, 1}, -- gave defense boost to fanto's target: param: 93 messageId: 194
        {1419, 100, 1}, -- grant tp to fanto's target: param: 1404 messageId: 409 
        {1420, 0, 0}, -- triggers spell from fantoccini (not sure what weight to give) param 1420?
        {1421, 100, 0}, -- grant tp to fanto: param 3000 messageId: 409
        {1422, 50, 0}, -- gave attack boost to fanto: param: 91 messageId: 194
        {1423, 50, 0}, -- gave defense boost to fanto: param: 93 messageId: 194
        {1424, 75, 0}, -- heals fanto for param amount param: 401 messageID: 238
        {1427, 10, 2}, -- Resets all abilities including 2 hour
        {1457, 25, 2}, -- reset JA for player param: 0 messageId: 360
    }

    local now = os.time()
    if mob:getLocalVar("standby") == 1 and mob:getLocalVar("dice_roll") <= now then
        local weights = {}
        local sum = 0
        for i, info in ipairs(dice_rolls) do
            sum = sum + info[2]
            weights[i] = sum
        end
        local number = math.random(sum)
        local ability = 0
        for i, weight in ipairs(weights) do
            if weight >= number then
                ability = dice_rolls[i]
                break
            end
        end
        local abilityId = ability[1]
        local targetType = ability[3]
        local target = nil
        local fantocinni = GetMobByID(mob:getID() + 2) -- Fantocinni is always offset by 2
        if targetType == 0 then
            target = fantocinni
        elseif targetType == 1 then
            target = mob:getTarget()
        elseif targetType == 2 then
            target = mob:getTarget()
            if target:isPet() then
                target = target:getMaster()
            end
        end

        if target then
            mob:messageText(mob, ID.text.ROLY_POLY_ROLY_POLY)
            mob:useMobAbility(abilityId)
            mob:setLocalVar("dice_roll", os.time() + math.random(25, 30))
        end
    end]]
end

function onMobDeath(mob, player, isKiller, noKiller)
    mob:messageText(mob, ID.text.HUFF_YOU_PLAY_TOO_ROUGH)
    local fantocinni = GetMobByID(mob:getID() + 2) -- Fantocinni is always offset by 2
    if fantocinni and fantocinni:isAlive() then
        fantocinni:addStatusEffect(tpz.effect.TERROR, 1, 0, 900)
        if fantocinni:hasPet() then
            local pet = fantocinni:getPet()
            if pet and pet:isAlive() then
                pet:addStatusEffect(tpz.effect.TERROR, 1, 0, 900)
            end
        end
    end
end

function onMobDespawn(mob)
end
