-----------------------------------
-- Area: Arrapago Remnants
--  Mob: Professor P
-- ID: 17081233
-- Adds "Two oozes, one room. So many delightful possibilities!"
-- 80% "Hmm, I don't feel a thing. Wha?! Where'd those come from?"
-- 35% "Tastes like... Cherry! Oh! Excuse me!"
-- Death "Bad news, everyone... I don't think I'm going to make it..."
-- Killing player "Hmm... Interesting...
-- Potion mob:useMobAbility(1398) 
-----------------------------------
local ID = require("scripts/zones/Arrapago_Remnants/IDs")
require("scripts/globals/instance")
require("scripts/globals/status")
require("scripts/globals/salvage")
require("scripts/globals/items")
require("scripts/globals/mobs")
-----------------------------------
-- TODO: TP moves by phase
-- TODO: Mob family / stats / SDT
-- TODO: 2nd 3rd phase transformation model
-- TP moves
tpMoveList1 = {1028, 1031, 1032, 1033, 1034}
-- Tackle, Spinning Attack, Howling Fist, Dragon Kick, Asuran Fists
tpMoveList2 = {319, 320, 1332, 1793}
-- Vampiric Root, Bad Breath, Extremely Bad Breath, Sweet breath
tpMoveList3 = {500, 501, 502, 503, 1360, 2389, 2533}
-- Mow, Fightful Roar, Mortal Ray, Unblessed Armor, Apocalyptic Ray, Lethal Triclip, Lithic Ray
    
function onMobSpawn(mob)
    mob:setDamage(100)
    mob:setDelay(4000)
end

function onMobEngaged(mob)
    local target = mob:getTarget()
    mob:setModelId(762)
    mob:setLocalVar("slimeTime", math.random(30, 45))
    mob:setLocalVar("phase", 1)
end

function onMobFight(mob, target)
    local hp = mob:getHPP()
    local slimeTime = mob:getLocalVar("slimeTime")
    local phase = mob:getLocalVar("phase")
    local battletime = mob:getBattleTime()

    -- Summons 2 Slimes every 90s seconds, first set comes within 30-45s
    if (battletime >= slimeTime) and (phase == 1) then
        mob:setLocalVar("slimeTime", battletime + 90)
        salvageUtil.msgGroup(mob, "Two oozes, one room. So many delightful possibilities!", 0, "Professor P")
        SpawnSlime(mob, target)
    end

    -- Below 80% Drinks a potion and grows tentancles, becoming stronger
    if (hp < 80) and (phase == 1) then
        mob:setDamage(120)
        mob:setDelay(3000)
        mob:setLocalVar("phase", 2)
        mob:useMobAbility(1398)
        mob:setModelId(2230) -- Ameretat
        salvageUtil.msgGroup(mob, "Hmm, I don't feel a thing. Wha?! Where'd those come from?", 0, "Professor P")
    end
    -- Below 35% Drinks a potion and grows huge, becoming much stronger
    if (hp < 35) and (phase == 2) then
        mob:setDamage(150)
        mob:setDelay(2000)
        mob:setLocalVar("phase", 3)
        mob:useMobAbility(1398)
        mob:setModelId(1360) -- Red Tauri
        salvageUtil.msgGroup(mob, "Tastes like... Cherry! Oh! Excuse me!", 0, "Professor P")
    end
end


function onMobWeaponSkillPrepare(mob, target)
    local phase = mob:getLocalVar("phase")

    if (phase == 1) then
        return tpMoveList1[math.random(#tpMoveList1)]
    elseif (phase == 2) then
        return tpMoveList2[math.random(#tpMoveList2)]
    elseif (phase >= 3) then
        return tpMoveList3[math.random(#tpMoveList3)]
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
    local instance = mob:getInstance()
    if isKiller or noKiller then
        -- Nearby door opens
        instance:setProgress(1)
        mob:getEntity(bit.band(ID.npc[5][1].DOOR1, 0xFFF), tpz.objType.NPC):setAnimation(8)
        mob:getEntity(bit.band(ID.npc[5][1].DOOR1, 0xFFF), tpz.objType.NPC):untargetable(true)
        mob:getEntity(bit.band(ID.npc[5][1].DOOR2, 0xFFF), tpz.objType.NPC):setAnimation(8)
        mob:getEntity(bit.band(ID.npc[5][1].DOOR2, 0xFFF), tpz.objType.NPC):untargetable(true)
        salvageUtil.msgGroup(mob, "Bad news, everyone... I don't think I'm going to make it...", 0, "Professor P")
        salvageUtil.spawnMobGroup(instance, ID.mob[5][1][2].mobs_start, ID.mob[5][1][2].mobs_end)
        mob:setModelId(762)
    end
end

function onMobDespawn(mob)
end

function SpawnSlime(mob, target)
    local instance = mob:getInstance()
    redSlime = GetMobByID(17081234, instance)
    metalSlime = GetMobByID(17081235, instance)
    redSlime:setSpawn(mob:getXPos() +1, mob:getYPos(), mob:getZPos() +1, mob:getRotPos())
    metalSlime:setSpawn(mob:getXPos() +2, mob:getYPos(), mob:getZPos() +2, mob:getRotPos())
    SpawnMob(17081234, instance)
    SpawnMob(17081235, instance)
    redSlime:updateEnmity(target)
    metalSlime:updateEnmity(target)
end

function RemoveCostume(mob)
    if mob == nil then
        return
    end

    local instance = mob:getInstance()
    local chars = instance:getChars()

    --for _, players in pairs(chars) do
        --players:costume(0)
    --end
end