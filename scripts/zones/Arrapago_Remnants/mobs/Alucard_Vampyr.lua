-----------------------------------
-- Area: Arrapago Remnants
--  Mob: Alucard (Vampyr)
-- ID: 17081245
-----------------------------------
local ID = require("scripts/zones/Arrapago_Remnants/IDs")
require("scripts/globals/instance")
require("scripts/globals/status")
require("scripts/globals/salvage")
require("scripts/globals/items")
require("scripts/globals/mobs")
mixins = {require("scripts/mixins/job_special")}
-----------------------------------
local tpMoveList = {2106, 2107, 2108, 2109, 2110, 2111, 2534}
-- Bloodrake, Decollation, Nosferatu's Kiss, Heliovoid, Wings of Gehenna, Eternal Damnation, Minax Glare
local auraList =
{
    [2106] = { tpz.effect.GEO_ATTACK_DOWN, 50 },
    [2107] = { tpz.effect.GEO_DEFENSE_DOWN, 50 },
    [2108] = { tpz.effect.GEO_MAGIC_ATK_DOWN, 50 },
    [2109] = { tpz.effect.GEO_MAGIC_DEF_DOWN, 50 },
    [2110] = { tpz.effect.GEO_ACCURACY_DOWN, 50 },
    [2111] = { tpz.effect.GEO_MAGIC_ACC_DOWN, 50 },
    [2534] = { tpz.effect.GEO_SLOW, 3500 }
}
local msgList =
{
    [2106] = { "Don't waste my time." },
    [2107] = { "You fail to amuse me." },
    [2108] = { "Pitiful." },
    [2109] = { "What a foolish ploy." },
    [2110] = { "Tremble before me!" },
    [2111] = { "What trickery is this?" },
    [2534] = { "This will please me.", }
}

function onMobSpawn(mob)
    local instance = mob:getInstance()
    local chars = instance:getChars()
    local hp = mob:getHPP()
    local progress = instance:getProgress()

    for i, v in pairs(chars) do
        v:addStatusEffect(tpz.effect.TERROR, 1, 0, 5)
    end
    salvageUtil.msgGroup(mob, "The night beckons!", 0, "Alucard")

    -- Reduce HP on spawn depending on phase
    if (progress == 9) then
        SetHPPercent(mob, 100)
    elseif (progress == 19) then
        SetHPPercent(mob, 75)
        ForceAggro(mob)
    elseif (progress == 29) then
        SetHPPercent(mob, 50)
        ForceAggro(mob)
    elseif (progress == 39) then
        SetHPPercent(mob, 25)
        ForceAggro(mob)
    end

    mob:setDelay(3500)
    mob:setDamage(60)
    mob:setMod(tpz.mod.DEFP, 25)
    mob:setMod(tpz.mod.HTHRES, 1000)
    mob:setMod(tpz.mod.SLASHRES, 1250)
    mob:setMod(tpz.mod.PIERCERES, 750)
    mob:setMod(tpz.mod.RANGEDRES, 500)
    mob:setMod(tpz.mod.IMPACTRES, 1000)
    mob:setMobMod(tpz.mobMod.MAGIC_COOL, 25)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
    mob:delImmunity(tpz.immunity.SILENCE)
    tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = tpz.jsa.BLOOD_WEAPON, hpp = 70},
            {id = tpz.jsa.MIGHTY_STRIKES, hpp = 40},
            {id = tpz.jsa.CHAINSPELL, hpp = 15},
        },
    })
end

function onMobEngaged(mob, target)
    mob:setLocalVar("msgTimer", os.time() + 45)
end

function onMobFight(mob, target)
    local instance = mob:getInstance()
    local progress = instance:getProgress()
    local manafontUses = mob:getLocalVar("manafontUses")
    local aura = mob:getLocalVar("aura")
    local msg = mob:getLocalVar("msg")
    local hp = mob:getHPP()

    -- Splits into bats every 25%
    if (hp <= 75) and (progress == 9) then
        instance:setProgress(instance:getProgress() +1) 
        DespawnMob(mob:getID(instance), instance)
        salvageUtil.spawnMobGroup(instance, ID.mob[6][1].mobs_start, ID.mob[6][1].mobs_end)
        salvageUtil.msgGroup(target, "Alucard splits into Vampyr bats!", 0xD, none)
    elseif (hp <= 50) and (progress == 19) then
        instance:setProgress(instance:getProgress() +1) 
        DespawnMob(mob:getID(instance), instance)
        salvageUtil.spawnMobGroup(instance, ID.mob[6][1].mobs_start, ID.mob[6][1].mobs_end)
        salvageUtil.msgGroup(target, "Alucard splits into Vampyr bats!", 0xD, none)
    elseif (hp <= 25) and (progress == 29) then
        instance:setProgress(instance:getProgress() +1) 
        DespawnMob(mob:getID(instance), instance)
        salvageUtil.spawnMobGroup(instance, ID.mob[6][1].mobs_start, ID.mob[6][1].mobs_end)
        salvageUtil.msgGroup(target, "Alucard splits into Vampyr bats!", 0xD, none)
    end
        

    -- Procced by Water skillchains(silence)
    mob:addListener("SKILLCHAIN_TAKE", "ALUCARD_SC_TAKE", function(mob, target, element)
        if element == 5 or element == 10 or element == 14 or element == 16 then -- Water damage skillchains
            BreakMob(mob, target, 1, 30, 1)
        end
    end)

    -- Gains an aura after every TP move
    if not mob:hasStatusEffect(tpz.effect.SILENCE) then
        PeriodicInstanceMessage(mob, target, "The " .. MobName(mob) .. " seems weak to skillchains...", 0xD, none, 30)
        if (aura > 0) then
            AddMobAura(mob, target, 13, auraList[aura][1], auraList[aura][2], 3)
        end
    end

    -- Display TP move message to players
    if (msg > 0) then
        salvageUtil.msgGroup(mob, msgList[msg][1], 0, "Alucard")
        mob:setLocalVar("msg", 0)
    end
end

function onMobWeaponSkillPrepare(mob, target)
    return tpMoveList[math.random(#tpMoveList)]
end

function onMobWeaponSkill(target, mob, skill)
    -- Set aura for table on TP move, except for Blood Weapon, Mighty Strikes, or Chainspell
    local twoHours = {688, 692, 695}
    for _, skillId in pairs(twoHours) do
        if skill:getID() == skillId then
            return
        end
        if skill:getID() == 691 then
            mob:setLocalVar("aura", skill:getID())
            mob:setLocalVar("msg", skill:getID())
        end
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
    local instance = mob:getInstance()
    local chars = instance:getChars()
    local progress = instance:getProgress()

    if isKiller or noKiller and (progress == 39) then
        -- If final boss, spawn next boss in line
        if salvageUtil.TrySpawnChariotBoss(mob, player, 17080585) then
        else
            -- Nearby door opens
            instance:setProgress(40)
            mob:getEntity(bit.band(ID.npc[6].DOOR, 0xFFF), tpz.objType.NPC):setAnimation(8)
            mob:getEntity(bit.band(ID.npc[6].DOOR, 0xFFF), tpz.objType.NPC):untargetable(true)
            salvageUtil.msgGroup(player, "The way forward is now open.", 0xD, none)
        end
    end
end

function onMobDespawn(mob)
end


function SetHPPercent(mob, hpp)
    hpp = hpp / 100
    hpp = math.ceil(mob:getMaxHP() * hpp)
    mob:setHP(hpp)
end

function ForceAggro(mob)
    local NearbyPlayers = mob:getPlayersInRange(50)
    if NearbyPlayers == nil then return end
    if NearbyPlayers then
        for _,v in ipairs(NearbyPlayers) do
            mob:updateClaim(v)
            mob:updateEnmity(v)
        end
    end
end
